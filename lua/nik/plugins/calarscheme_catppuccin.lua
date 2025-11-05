return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
