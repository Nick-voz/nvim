return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local gheight = vim.api.nvim_list_uis()[1].height
    local gwidth = vim.api.nvim_list_uis()[1].width
    local width = 100
    local height = 20

    nvimtree.setup({
      view = {
        relativenumber = true,

        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = width,
            height = height,
            row = (gheight - height) * 0.3,
            col = (gwidth - width) * 0.5,
            title = "File tree",
            title_pos = "center",
          },
        },
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true,
        },
      },
      filters = {
        custom = { ".DS_Store", "__pycache__", ".pytest_cache" },
      },
      git = {
        ignore = false,
      },

      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
  end,
}
