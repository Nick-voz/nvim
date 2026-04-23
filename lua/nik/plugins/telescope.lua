return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.1",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local todo_comments = require("todo-comments")

    local telescope = require("telescope")
    local actions = require("telescope.actions")

    todo_comments.setup()
    telescope.setup({
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
      },

      defaults = {
        path_display = { "truncate" },
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        layout_config = {
          height = 0.8,
          width = 0.8,
          preview_cutoff = 0,
          prompt_position = "top",
          mirror = true,
        },
        file_ignore_patterns = {
          "^.git/",
          "^.pytest_cache",
          "^.venv/",
          "^venv/",
          "%.pyc",
          ".DS_Store",
          "^node_modules/",
          "^.angular/*",
          "^dist/*",
        },

        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>", { desc = "Telescope command history" })
    keymap.set("n", "<leader>cc", "<cmd>Telescope commands<cr>", { desc = "Telescope commands" })
    keymap.set("n", "<leader>fT", "<cmd>Telescope<cr>", { desc = "Telescope" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
  end,
}
