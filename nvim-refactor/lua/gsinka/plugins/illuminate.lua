vim.cmd([[
  hi IlluminatedWordText gui=NONE
  hi IlluminatedWordText guibg='#3b3f4c'

  hi IlluminatedWordRead gui=NONE
  hi IlluminatedWordRead guibg='#3b3f4c'

  hi IlluminatedWordWrite gui=NONE
  hi IlluminatedWordWrite guibg='3b3f4c'
]])

require('illuminate').configure({
  filetype_denylist = {
    'TelescopePropmt',
    'fugitive',
  },
  min_count_to_highlight = 2,
})
