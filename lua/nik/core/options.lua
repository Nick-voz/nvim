vim.cmd("let g:netrw_liststyle = 3")

local vim = vim
local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true
opt.cursorcolumn = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.scrolloff = 20

opt.syntax = "on"
-- Spell Check Settings
-- opt.spell = true
-- opt.spelllang = { "en_us", "ru" }
vim.cmd("highlight SpellBad ctermfg=red guifg=#FF7F7F")
vim.opt_local.iskeyword:append({ "_", "-" })

opt.autoread = true

-- Source - https://stackoverflow.com/a/73365602
-- Posted by lcheylus, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-04-20, License - CC BY-SA 4.0

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
    })
  end,
})
