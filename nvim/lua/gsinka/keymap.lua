local M = {}

M.opts = { noremap = true, silent = true }
M.optsNoSilent = { noremap = true, silent = false }

M.nnoremap = function (key, command, opts)
  vim.keymap.set('n', key, command, opts)
end

M.vnoremap = function (keymap, command, opts)
  vim.keymap.set('v', keymap, command, opts)
end

return M
