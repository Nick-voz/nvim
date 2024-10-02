vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>rf", "<cmd>!python3 %<CR>", { desc = "run curent file through python" })
keymap.set(
  "n",
  "<leader>rt",
  "<cmd>terminal python3 %<CR>",
  { desc = "run curent file through python in new terminal window" }
)
keymap.set(
  "n",
  "<leader>rT",
  "<cmd>terminal pytest " .. vim.fn.getcwd() .. "<CR>",
  { desc = "run pytest in new terminal window" }
)
keymap.set("n", "<leader>ro", "<cmd>!open -a Safari %<CR><CR>", { desc = "open courent file with Safari" })
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })

keymap.set("n", "<CR>", "<cmd>call append(line('.'), '')<CR>", { desc = "apped empty line down" })
keymap.set("n", "<S-CR>", "<cmd>call append(line('.')-1, '')<CR>", { desc = "append empty line up " })

keymap.set("n", "<C-CR>", "yyp$", { desc = "duplicate line down" })
keymap.set("n", "<C-S-CR>", "yyP^", { desc = "duplicate line up" })

keymap.set("n", "<leader>q", "<cmd>wq<CR>", { desc = "safe and quit" })
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "force quit" })
keymap.set("n", "<leader>wf", "<cmd>w<CR>", { desc = "write file" })
keymap.set("n", "<leader>wa", "<cmd>w<CR>", { desc = "write all" })
