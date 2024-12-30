return {
  "frankroeder/parrot.nvim",

  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },

  config = function()
    require("parrot").setup({
      providers = {
        gemini = {
          api_key = os.getenv("GEMINI_KEY"),
        },
      },
      toggle_target = "popup",

      hooks = {
        CommitMsg = function(prt, params)
          local futils = require("parrot.file_utils")
          if futils.find_git_root() == "" then
            prt.logger.warning("Not in a git repository")
            return
          else
            local template = [[
          I want you to act as a commit message generator. I would like you 
          to generate an appropriate commit message using the conventional 
          commit format. Do not write any explanations or other words, just 
          reply with the commit message. Start with a short headline as
          summary but then list the individual changes in more detail.

          Here are the changes that should be considered by this message:
          ]] .. vim.fn.system("git diff --no-color --no-ext-diff --staged")
            local model_obj = prt.get_model("command")
            prt.Prompt(params, prt.ui.Target.popup, model_obj, nil, template)
          end
        end,

        SpellCheck = function(prt, params)
          local template = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.

        After this respond just with the snippet of code that should be rewritten.

        Text:
        ```{{filetype}}
        {{selection}}
        ```
        ]]
          local model_obj = prt.get_model("command")
          prt.Prompt(params, prt.ui.Target.popup, model_obj, nil, template)
        end,
        WriteDocks = function(prt, params)
          local chat_prompt = [[
            Generate detailed but concise documentation for this specific part of code:
            {{selection}}

            Context (file type and content):
            ```{{filetype}}
            {{filecontent}}
            ```

            Please provide:
            1. Brief description (1-2 sentences about main purpose)
            2. Parameters/Arguments:
               - name: type - description
               - required/optional status
               - default values if any
            3. Return value:
               - type and description
               - possible return values/states
            4. Raises/Exceptions (if applicable):
               - what exceptions can be thrown
               - under what conditions
            6. Usage example (short)(optional)

            For classes additionally include:
            - Inheritance information
            - Class attributes
            - Public methods summary
            - Important internal methods (if any)

            Format as proper docstring for the given language.
            Use language-specific documentation style:
            - Python: Google style
            - JavaScript: JSDoc
            - Java: Javadoc
            etc.

            Keep it comprehensive but avoid redundant information.
            Focus on WHAT and WHY rather than HOW.

            Resalt MUST be just dockstnig for this specific part of code
            ]]
          local model_obj = prt.get_model("command")
          prt.Prompt(params, prt.ui.Target.popup, model_obj, nil, chat_prompt)
        end,
      },
    })

    vim.keymap.set("n", "<leader>ps", ":PrtSpellCheck<CR>", { desc = "Spell check with parrot" })
    vim.keymap.set("v", "<leader>pd", ":PrtWriteDocks<CR>", { desc = "Generate documentation for selected symbol" })
    vim.keymap.set(
      { "n", "v", "x", "t" },
      "<C-g>m",
      "<cmd>PrtCommitMsg<cr>",
      { desc = "Create commit message with AI" }
    )
  end,
}
