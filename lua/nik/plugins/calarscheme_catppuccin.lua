return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      float = {
        transparent = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
