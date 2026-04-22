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
      kind = "floating",

      floating = {
        width = 0.8,
        height = 0.8,
        row = 2,
      },

      commit_editor = { kind = "floating" },
      commit_select_view = { kind = "floating" },
      commit_view = { kind = "tab" },
      log_view = { kind = "floating" },
      reflog_view = { kind = "floating" },
      stash = { kind = "floating" },
      refs_view = { kind = "floating" },
      popup = { kind = "floating" },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open neogit" })
    keymap.set("n", "<leader>gl", neogit.action("log", "log_current"), { desc = "Open neogit" })
    keymap.set(
      "n",
      "<leader>pb",
      neogit.action("branch", "checkout_local_branch"),
      { desc = "Open neogit branch popup" }
    )
  end,
}
