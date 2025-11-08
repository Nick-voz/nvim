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
        width = 0.9,
        height = 0.9,
        row = 1,
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open neogit" })
  end,
}
