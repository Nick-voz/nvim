return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add file to the harpoon list" })

    vim.keymap.set("n", "<leader>hc", function()
      harpoon:list():clear()
    end, { desc = "Clear harpoon list" })

    vim.keymap.set("n", "<leader>hL", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle harpoon list" })

    vim.keymap.set("n", "<leader>hf", function()
      harpoon:list():select(1)
    end, { desc = "Goto first file in the harpoon list" })

    vim.keymap.set("n", "<leader>hs", function()
      harpoon:list():select(2)
    end, { desc = "Goto second file in the harpoon list" })

    vim.keymap.set("n", "<leader>ht", function()
      harpoon:list():select(3)
    end, { desc = "Goto third file in the harpoon list" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Goto previous file in the harpoon list" })

    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Goto next file in the harpoon list" })

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>hl", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon telescope window" })
  end,
}
