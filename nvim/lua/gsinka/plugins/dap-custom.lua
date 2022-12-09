local widgets = require('dap.ui.widgets')
local scopes = widgets.sidebar(widgets.scopes)
-- local threads = widgets.sidebar(widgets.threads)

local M = {}

M.open = function ()
  scopes.open()
  -- threads.open()
end

return M
