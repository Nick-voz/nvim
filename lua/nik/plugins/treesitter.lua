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
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
