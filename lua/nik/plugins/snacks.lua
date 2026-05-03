---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    indent = { enabled = true },
    notifier = { enabled = true, style = "minimal" },
    explorer = { enabled = true, replace_netrw = true },
    picker = {
      sources = {
        explorer = { auto_close = true, layout = { preset = "vertical", preview = true } },
      },
    },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
