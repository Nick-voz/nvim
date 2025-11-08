return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      view = {
        merge_tool = {
          layout = "diff4_mixed",
          disable_diagnostics = true,
          winbar_info = true,
        },
      },
      hooks = {
        view_opened = function()
          local actions = require("diffview.actions")
          actions.toggle_files()
        end,
      },
      vim.keymap.set("n", "<leader>dx", "<Cmd>DiffviewClose<CR>", {
        desc = "Diffview: close",
        silent = true,
        noremap = true,
      }),
    })
  end,
}
