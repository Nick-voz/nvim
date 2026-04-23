return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    indent = { enabled = true },
    input = { enabled = true, prompt_pos = "title" },
    picker = { enabled = true },
    notifier = { enabled = true, timeout = 4000 },
  },
  keys = {
    {
      "<leader>nh",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
  },
}
