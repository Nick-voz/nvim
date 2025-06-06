---@diagnostic disable: need-check-nil
return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function(_, opts)
    require("dap-python").resolve_python = function()
      local handle = io.popen("which python")
      local result = handle:read("*a")
      handle:close()
      local python_path = result:gsub("^%s*(.-)%s*$", "%1")
      return python_path
    end
    require("dap-python").setup()
    require("dap-python").test_runner = "pytest"

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>dm",
      ":lua require('dap-python').test_method()<cr>",
      { desc = "run test for next method through debug" }
    )

    keymap.set(
      "n",
      "<leader>dC",
      ":lua require('dap-python').test_class()<cr>",
      { desc = "run test for class through debug" }
    )

    keymap.set(
      "v",
      "<leader>rS",
      ":lua require('dap-python').debug_selection()<cr>",
      { desc = "run test for selection through debug" }
    )
  end,
}
