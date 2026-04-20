return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "json",
      "yaml",
      "html",
      "css",
      "markdown",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "python",
      "javascript",
      "fish",
      "bash",
    })
  end,
}
