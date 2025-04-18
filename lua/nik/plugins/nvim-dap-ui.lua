return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    -- require("neodev").setup({
    --   library = { plugins = { "nvim-dap-ui" }, types = true },
    -- })
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = {
        {
          elements = {
            {
              id = "watches",
              size = 1,
            },
            -- {
            --   id = "scopes",
            --   size = 0.5,
            -- },
          },
          position = "bottom",
          size = 15,
        },
        -- {
        --   elements = {
        --     {
        --       id = "repl",
        --       size = 0.67,
        --     },
        --     -- {
        --     --   id = "console",
        --     --   size = 0.33,
        --     -- },
        --   },
        --   position = "bottom",
        --   size = 0.5,
        -- },
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 2,
        max_value_lines = 100,
      },
    })
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    local keymap = vim.keymap

    keymap.set("n", "<leader>ud", ": lua require('dapui').toggle()<cr>", { desc = "toggle debuger ui" })

    keymap.set(
      "n",
      "<leader>us",
      ": lua require('dapui').float_element('scopes', { width = 100, height=15, enter = true, position = 'center' })<cr><cr>",
      { desc = "toggle scopes ui" }
    )

    keymap.set(
      "n",
      "<leader>uS",
      ": lua require('dapui').float_element('stacks',{ width = 100, height=15, enter = true, position = 'center' })<cr><cr>",
      { desc = "toggle stacks ui" }
    )

    keymap.set(
      "n",
      "<leader>uw",
      ": lua require('dapui').float_element('watches',{ width = 100, height=15, enter = true, position = 'center' })<cr><cr>",
      { desc = "toggle watches ui" }
    )

    keymap.set(
      "n",
      "<leader>ub",
      ": lua require('dapui').float_element('breakpoints', { width = 100, height=15, enter = true, position = 'center' })<cr><cr>",
      { desc = "toggle breakpoints ui" }
    )

    keymap.set(
      "n",
      "<leader>ur",
      ": lua require('dapui').float_element('repl', { width = 100, height=15, enter = true, position = 'center' })<cr><cr>",
      { desc = "toggle repl ui" }
    )

    keymap.set(
      "n",
      "<leader>uc",
      ": lua require('dapui').float_element('console', { width = 100, height=15, enter = true, position = 'center' })<cr><cr>",
      { desc = "toggle console ui" }
    )
  end,
}
