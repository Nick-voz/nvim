return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {},

        format = {
          cmdline = { pattern = "^:", icon = ":", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "H" },
          input = { view = "cmdline_input", icon = "I" },
        },
      },

      redirect = { view = "popup", filter = { event = "msg_show" } },
      notify = { enabled = true, view = "notify" },

      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

        hover = { silent = true },
      },

      health = { checker = true },

      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      throttle = 1000 / 30,

      views = {
        split = {
          size = "auto",
        },
      },

      routes = {
        { filter = { event = "msg_show", kind = "shell_out" }, view = "popup" },
        { filter = { event = "msg_show", find = "written" }, view = "mini" },
        { filter = { event = "msg_show", find = "Word.*spell" }, view = "mini" },
        {
          filter = { event = "msg_show", ["not"] = { kind = { "undo", "confirm", "search_count" } } },
          view = "notify",
          opts = { replace = true },
        },

        -- TODO: check sometimes for fixes: Masson and code actions is unacceptable
        -- hope they will fix confirm display
        { filter = { event = "msg_show", kind = "confirm" }, view = "popup" },
        { filter = { event = "msg_show", kind = { "undo" } }, view = "mini" },
      },
    })

    local keymap = vim.keymap
    local noice = require("noice")

    keymap.set("n", "<leader>nh", function()
      noice.cmd("history")
    end, { desc = "Show notifications history" })
    keymap.set("n", "<leader>nl", function()
      noice.cmd("last")
    end, { desc = "Show last notification" })

    vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
      if not require("noice.lsp").scroll(4) then
        return "<c-f>"
      end
    end, { silent = true, expr = true })
    vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
      if not require("noice.lsp").scroll(-4) then
        return "<c-b>"
      end
    end, { silent = true, expr = true })
    vim.keymap.set("c", "<S-Enter>", function()
      require("noice").redirect(vim.fn.getcmdline())
    end, { desc = "Redirect Cmdline" })
  end,
}
