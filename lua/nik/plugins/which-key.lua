return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    preset = "helix",
    win = {
      no_overlap = true,
      width = 45,
      height = { min = 4, max = 25 },
      row = 0,
    },
  },

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
}
