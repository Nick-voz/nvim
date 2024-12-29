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
      },
    })
  end,
}
