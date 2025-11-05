return {

  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
    "nvim-mini/mini.pick", -- optional
    "folke/snacks.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      disable_hint = false,
      disable_context_highlighting = false,
      disable_signs = true,

      git_executable = "git",
      prompt_force_push = true,
      disable_insert_on_commit = "auto",
      filewatcher = {
        interval = 1000,
        enabled = true,
      },
      graph_style = "ascii",
      commit_date_format = nil,
      log_date_format = nil,

      git_services = {
        ["github.com"] = {
          pull_request = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
          commit = "https://github.com/${owner}/${repository}/commit/${oid}",
          tree = "https://${host}/${owner}/${repository}/tree/${branch_name}",
        },
        ["bitbucket.org"] = {
          pull_request = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
          commit = "https://bitbucket.org/${owner}/${repository}/commits/${oid}",
          tree = "https://bitbucket.org/${owner}/${repository}/branch/${branch_name}",
        },
        ["gitlab.com"] = {
          pull_request = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
          commit = "https://gitlab.com/${owner}/${repository}/-/commit/${oid}",
          tree = "https://gitlab.com/${owner}/${repository}/-/tree/${branch_name}?ref_type=heads",
        },
        ["azure.com"] = {
          pull_request = "https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
          commit = "",
          tree = "",
        },
        ["codeberg.org"] = {
          pull_request = "https://${host}/${owner}/${repository}/compare/${branch_name}",
          commit = "https://${host}/${owner}/${repository}/commit/${oid}",
          tree = "https://${host}/${owner}/${repository}/src/branch/${branch_name}",
        },
      },

      telescope_sorter = function()
        return require("telescope").extensions.fzf.native_fzf_sorter()
      end,
      remember_settings = true,
      use_per_project_settings = true,
      ignored_settings = {},

      highlight = {
        italic = true,
        bold = true,
        underline = true,
      },

      use_default_keymaps = true,

      auto_refresh = true,
      sort_branches = "-committerdate",
      commit_order = "topo",
      initial_branch_name = "",
      kind = "tab",

      floating = {
        relative = "editor",
        width = 0.8,
        height = 0.7,
        style = "minimal",
        border = "rounded",
      },

      disable_line_numbers = false,
      disable_relative_line_numbers = false,

      console_timeout = 2000,
      auto_show_console = true,
      auto_close_console = true,

      notification_icon = "󰊢",
      status = {
        show_head_commit_hash = true,
        recent_commit_count = 10,
        HEAD_padding = 10,
        HEAD_folded = false,
        mode_padding = 3,
        mode_text = {
          M = "modified",
          N = "new file",
          A = "added",
          D = "deleted",
          C = "copied",
          U = "updated",
          R = "renamed",
          DD = "unmerged",
          AU = "unmerged",
          UD = "unmerged",
          UA = "unmerged",
          DU = "unmerged",
          AA = "unmerged",
          UU = "unmerged",
          ["?"] = "",
        },
      },
      commit_editor = {
        kind = "tab",
        show_staged_diff = true,
        staged_diff_split_kind = "split",
        spell_check = true,
      },
      commit_select_view = {
        kind = "tab",
      },
      commit_view = {
        kind = "tab",
        verify_commit = vim.fn.executable("gpg") == 1,
      },
      log_view = {
        kind = "tab",
      },
      rebase_editor = {
        kind = "split_above",
        no_expand = true,
      },
      reflog_view = {
        kind = "tab",
      },
      merge_editor = {
        kind = "auto",
      },
      preview_buffer = {
        kind = "floating_console",
      },
      popup = {
        kind = "tab",
      },
      stash = {
        kind = "tab",
      },
      refs_view = {
        kind = "tab",
      },
      signs = {
        hunk = { "", "" },
        item = { ">", "v" },
        section = { ">", "v" },
      },

      integrations = {
        telescope = nil,
        diffview = nil,
        fzf_lua = nil,
        mini_pick = nil,
        snacks = nil,
      },

      sections = {

        sequencer = {
          folded = false,
          hidden = false,
        },

        untracked = {
          folded = false,
          hidden = false,
        },

        unstaged = {
          folded = false,
          hidden = false,
        },

        staged = {
          folded = false,
          hidden = false,
        },

        stashes = {
          folded = true,
          hidden = false,
        },

        unpulled_upstream = {
          folded = true,
          hidden = false,
        },

        unmerged_upstream = {
          folded = false,
          hidden = false,
        },

        unpulled_pushRemote = {
          folded = true,
          hidden = false,
        },

        unmerged_pushRemote = {
          folded = false,
          hidden = false,
        },

        recent = {
          folded = true,
          hidden = false,
        },

        rebase = {
          folded = true,
          hidden = false,
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open neogit" })
  end,
}
