return {
  "MeanderingProgrammer/treesitter-modules.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesitter-modules").setup({
      ensure_installed = {
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "python",
        "javascript",
        "angular",
      },
      ignore_install = {},
      sync_install = false,
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<A-space>",
          node_incremental = "<A-space>",
          scope_incremental = false,
          node_decremental = "<A-tab>",
        },
      },
    })
  end,
}
