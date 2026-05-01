---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    indent = { enabled = true },
    notifier = { enabled = true, timeout = 4000 },
  },
}
