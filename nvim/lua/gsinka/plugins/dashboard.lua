local db = require('dashboard')
local cwd = vim.fn.getcwd()

db.custom_header = {
  '',
  '',
  '',
  cwd,
  '',
  '',
  '',
}

db.custom_center = {
  { icon = '  ', desc = 'Find file       ', shortcut = 'SPC sf ', action = 'Telescope find_files'},
  { icon = '  ', desc = 'Find text       ', shortcut = 'SPC sp ', action = 'Telescope live_grep'},
  { icon = '🖿  ', desc = 'Show explorer   ', shortcut = 'SPC n  ', action = 'NnnPicker'},
  -- { icon = '⨯  ', desc = 'Quit            ', action = 'q'},
}

db.custom_footer = { '' }
