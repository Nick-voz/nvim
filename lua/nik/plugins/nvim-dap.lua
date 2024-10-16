return {
  "mfussenegger/nvim-dap",
  config = function(_, opts)
    --     require("core.utils").load_mappings("dap")
    local keymap = vim.keymap

    keymap.set("n", "<leader>b", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" })
    keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "DapContinue" })
    keymap.set("n", "<leader>dt", "<cmd>DapTerminate<cr>", { desc = "DapTerminate" })
    keymap.set("n", "<leader>si", "<cmd>DapStepInto<cr>", { desc = "Step into" })
    keymap.set("n", "<leader>su", "<cmd>DapStepOut<cr>", { desc = "Step out" })
    keymap.set("n", "<leader>sv", "<cmd>DapStepOver<cr>", { desc = "Step over" })
  end,
}
