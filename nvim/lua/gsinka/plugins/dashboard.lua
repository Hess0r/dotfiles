local db = require('dashboard')
local cwd = vim.fn.getcwd()
local data_dir = vim.fn.stdpath("data")

db.setup({
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '',
      cwd,
      '',
      '',
      '',
    },
    center = {
      { icon = '  ', desc = 'Find file       ', shortcut = 'SPC sf ', action = 'Telescope find_files'},
      { icon = '  ', desc = 'Find text       ', shortcut = 'SPC sp ', action = 'Telescope live_grep'},
      { icon = '🖿  ', desc = 'Show explorer   ', shortcut = 'SPC n  ', action = 'NnnPicker'},
    },
    footer = {}
  },
})
