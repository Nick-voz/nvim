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
        format = {
          cmdline = { icon = ":" },
          search_down = { icon = "/" },
          search_up = { icon = "?" },
          filter = { icon = "$" },
          help = { icon = "H" },
          input = { icon = "I" },
        },
      },

      commands = { history = { view = "popup" } },

      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

        hover = { silent = true },
      },

      presets = {
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },

      views = { split = { size = "auto" } },

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
