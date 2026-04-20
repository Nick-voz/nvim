return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    dim = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true, prompt_pos = "title" },
    picker = { enabled = true },
    quickfile = { enabled = true },
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
    {
      "<leader>df",
      function()
        Snacks.dim.enable()
      end,
      desc = "Dim focus",
    },
    {
      "<leader>dd",
      function()
        Snacks.dim.disable()
      end,
      desc = "Disable dim",
    },
  },

  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end
      end,
    })
  end,
}
