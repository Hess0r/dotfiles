vim.g.which_key_map = {
  s = {
    name = '+search',
    b = 'cur buf fuzzy find',
    d = 'grep string',
    f = 'find files',
    h = 'help tags',
    m = 'marks',
    o = 'document symbols',
    p = 'live grep',
    t = 'tags',
  },
  g = {
    name = '+git',
    c = 'commits',
    d = 'buffer history',
    s = 'status',
    b = 'branches',
  },
  h = {
    name = '+git-hunks',
    p = 'preview hunk',
    s = 'stage hunk',
    u = 'undo hunl',
  },
  e = 'show line diagnostic',
  q = 'show current buffer diagnostics',
  f = 'format',
  D = 'jump to type definition',
  ['?'] = 'show previously open files',
  ['ve'] = 'edit vimrc',
  ['v'] = {name = 'which_key_ignore'},
  ['rn'] = 'rename',
  ['r'] = {name = 'which_key_ignore'},
  ['ca'] = 'coda action',
  ['c'] = {name = 'which_key_ignore'},
  ['n'] = 'open explorer',
  ['<CR>'] = 'reload config',
}

vim.call('which_key#register', '<Space>', 'g:which_key_map')

