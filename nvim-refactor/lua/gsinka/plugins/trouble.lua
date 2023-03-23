local wk = require('which-key')

wk.register({
  x = {
    name = 'Trouble',
    x = {"<cmd>TroubleToggle<CR>", 'Trouble toggle'},
  },
}, { prefix = '<leader>' })
