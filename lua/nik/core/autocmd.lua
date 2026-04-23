vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.treesitter.stop()
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(_)
    vim.cmd("NvimTreeFindFileToggle")
    vim.cmd("NvimTreeFindFileToggle")
  end,
})
