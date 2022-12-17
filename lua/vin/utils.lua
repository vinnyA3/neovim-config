local M = {}

function M.map(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, key, action, options)
end

return M
