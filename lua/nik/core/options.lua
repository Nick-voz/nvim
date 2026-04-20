vim.cmd("let g:netrw_liststyle = 3")

local vim = vim
local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = true

opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.cursorcolumn = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.swapfile = false

opt.scrolloff = 20

opt.syntax = "on"
opt.spell = true
opt.spelllang = { "en_us", "ru" }
vim.cmd("highlight SpellBad ctermfg=red guifg=#FF7F7F")
vim.opt_local.iskeyword:append({ "_", "-" })

opt.autoread = true
opt.winborder = "rounded"

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
    })
  end,
})
