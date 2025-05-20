return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local sorters = require("telescope.sorters")
    local transform_mod = require("telescope.actions.mt").transform_mod

    -- or create your custom action

    telescope.setup({
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
      },

      defaults = {
        path_display = { "smart" },
        layout_strategy = "vertical",
        layout_config = {
          height = 0.99,
          width = 0.85,
          preview_cutoff = 0,
        },
        file_ignore_patterns = {
          "^.git/",
          "^.pytest_cache",
          "^.venv/",
          "^venv/",
          "%.pyc",
          ".DS_Store",
        },

        -- Example: { "^scratch/" } -- ignore all files in scratch directory
        -- Example: { "%.npz" } -- ignore all npz files
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>", { desc = "Telescope command history" })
    keymap.set("n", "<leader>cc", "<cmd>Telescope commands<cr>", { desc = "Telescope commands" })
    keymap.set("n", "<leader>fT", "<cmd>Telescope<cr>", { desc = "Telescope" })
  end,
}
