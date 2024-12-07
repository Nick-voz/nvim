return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    require("spellsitter").setup({ enable = true })
  end,
}
