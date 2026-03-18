return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "searchcount", "selectioncount" },
        lualine_c = { "lsp_status" },
        lualine_x = { "filetype", "encoding", "branch", "diff" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
