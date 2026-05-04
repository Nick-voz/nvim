if vim.fn.argc() == 1 then
  local arg = vim.fn.argv(0)
  if vim.fn.isdirectory(arg) == 1 then vim.api.nvim_set_current_dir(arg) end
end

require("nik.core.options")
require("nik.core.keymaps")
require("nik.core.autocmd")
