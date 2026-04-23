vim.g.mapleader = " "

local keymap = vim.keymap
local vim = vim

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<leader>rf", "<cmd>!python3 %<CR>", { desc = "run curent file through python" })
keymap.set(
  "n",
  "<leader>rt",
  "<cmd>terminal python3 %<CR>",
  { desc = "run curent file through python in new terminal window" }
)
keymap.set("n", "<leader>rm", "<cmd>!python3 main.py<CR>", { desc = "run main.py" })
keymap.set(
  "n",
  "<leader>rM",
  "<cmd>terminal python3 main.py<CR>" .. vim.fn.getcwd() .. "<CR>",
  { desc = "run main.py in new terminal window" }
)
keymap.set("n", "<leader>rT", "<cmd>terminal pytest<CR>", { desc = "run pytest in new terminal window" })
keymap.set(
  "n",
  "<leader>ro",
  [[<cmd>exe "silent !firefox --new-window file://" . expand('%:p')<CR>]],
  { desc = "open courent file with firefox" }
)
keymap.set("n", "<leader>hh", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })

keymap.set("n", "<CR>", "<cmd>call append(line('.'), '')<CR>", { desc = "apped empty line down" })
keymap.set("n", "<S-CR>", "<cmd>call append(line('.')-1, '')<CR>", { desc = "append empty line up " })
keymap.set("n", "<C-CR>", "yyp$", { desc = "duplicate line down" })
keymap.set("n", "<C-S-CR>", "yyP^", { desc = "duplicate line up" })

keymap.set("n", "<leader>wf", "<cmd>w<CR>", { desc = "write file" })
keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "write all" })

keymap.set("n", "<leader>qe", vim.diagnostic.setqflist, { desc = "Add diagnostic to quickfix list" })

keymap.set({ "n", "v" }, "<leader>wq", "<C-w>q")
keymap.set({ "n", "v" }, "<leader>wo", "<C-w>o")
keymap.set({ "n", "v" }, "<C-up>", "<C-w><up>")
keymap.set({ "n", "v" }, "<C-down>", "<C-w><down>")
keymap.set({ "n", "v" }, "<C-left>", "<C-w><left>")
keymap.set({ "n", "v" }, "<C-right>", "<C-w><right>")

vim.keymap.set("n", "<A-Up>", ":m -2<CR>==", { silent = true })
vim.keymap.set("n", "<A-Down>", ":m +1<CR>==", { silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>==gv", { silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>==gv", { silent = true })
