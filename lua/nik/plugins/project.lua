return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/projects/rgpu/*",
      "~/projects/*",
      "~/.config/*",
    },
    datapath = vim.fn.stdpath("data"),
    last_session_on_startup = true,
    dashboard_mode = true,
    filetype_autocmd_timeout = 200,

    forget_project_keys = {
      i = "<C-d>",
      n = "d",
    },

    follow_symlinks = "full",

    session_manager_opts = {
      autosave_ignore_dirs = {
        vim.fn.expand("~"),
        "/tmp",
      },
      autosave_ignore_filetypes = {

        "ccc-ui",
        "dap-repl",
        "dap-view",
        "dap-view-term",
        "gitcommit",
        "gitrebase",
        "qf",
        "toggleterm",
      },
    },

    picker = {
      type = "telescope",

      preview = {
        enabled = true,
        git_status = true,
        git_fetch = false,
        show_hidden = true,
      },
      opts = {},
    },
    vim.keymap.set("n", "<leader>fP", "<cmd>NeovimProjectDiscover<cr>", { desc = "Show project list" }),
    vim.keymap.set("n", "<leader>fp", "<cmd>NeovimProjectHistory<cr>", { desc = "Show recent projects" }),
  },

  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "ibhagwan/fzf-lua" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
