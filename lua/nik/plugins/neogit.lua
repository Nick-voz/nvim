return {
  "NeogitOrg/neogit",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-mini/mini.pick",
    "folke/snacks.nvim",
  },

  config = function()
    local neogit = require("neogit")

    neogit.setup({
      disable_hint = true,
      kind = "tab",

      commit_editor = { kind = "tab" },
      commit_select_view = { kind = "tab" },
      commit_view = { kind = "tab" },
      log_view = { kind = "tab" },
      reflog_view = { kind = "tab" },
      stash = { kind = "tab" },
      refs_view = { kind = "tab" },
      popup = { kind = "tab" },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open neogit" })
    keymap.set("n", "<leader>gl", neogit.action("log", "log_current"), { desc = "Open neogit" })
    keymap.set("n", "<leader>pb", neogit.action("branch", "checkout_local_branch"), { desc = "Open branch popup" })
  end,
}
