local wk = require('which-key')

wk.register({
  g = {
    name = 'Git',
    d = {"<cmd>DiffviewFileHistory %<CR>", 'Buffer commits'},
  },
})
