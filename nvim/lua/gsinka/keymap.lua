local wk = require('which-key')

local M = {}

M.opts = { noremap = true, silent = true }
M.optsNoSilent = { noremap = true, silent = false }

M.nnoremap = function (key, command, opts)
  vim.keymap.set('n', key, command, opts)
end

M.vnoremap = function (keymap, command, opts)
  vim.keymap.set('v', keymap, command, opts)
end

M.tnoremap = function (keymap, command, opts)
  vim.keymap.set('t', keymap, command, opts)
end

local wknopts = function (prefix)
  return {
    mode = 'n',
    prefix = prefix,
  }
end

local wkvopts = function (prefix)
  return {
    mode = 'v',
    prefix = prefix,
  }
end

local wktopts = function (prefix)
  return {
    mode = 't',
    prefix = prefix,
  }
end

M.wknnoremap = function(prefix, config)
  wk.register(config, wknopts(prefix))
end

M.wktnoremap = function(prefix, config)
  wk.register(config, wktopts(prefix))
end

M.wkvnoremap = function(prefix, config)
  wk.register(config, wkvopts(prefix))
end

return M
