vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = require('gsinka.keymap')
local nnoremap = keymap.wknnoremap
local tnoremap = keymap.wktnoremap

nnoremap('<leader>', {
    s = {
      name = 'Search',
      f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find files' },
      g = { "<cmd>lua require('telescope.builtin').git_files()<CR>", 'Git files' },
      b = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", 'Current buffer search' },
      h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", 'Help tags' },
      t = { "<cmd>lua require('telescope.builtin').tags()<CR>", 'Tags' },
      d = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", 'Grep string' },
      p = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", 'Live grep' },
      o = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", 'LSP document symbols' },
      m = { "<cmd>lua require('telescope.builtin').marks()<CR>", 'Marks' },
      w = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", 'Spell suggest' },
    },
    g = {
      name = 'Git',
      s = {"<cmd>lua require('telescope.builtin').git_status()<CR>", 'Status'},
      c = {"<cmd>lua require('telescope.builtin').git_commits()<CR>", 'Commits'},
      d = {"<cmd>lua require('telescope.builtin').git_bcommits()<CR>", 'Buffer commits'},
      b = {"<cmd>lua require('telescope.builtin').git_branches()<CR>", 'Branches'},
      p = {"<cmd>Gdiffsplit<CR>", 'Diffsplit'},
      v = {"<cmd>GV<CR>", 'Log'},
    },
    p = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find files' },
    ['<space>'] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", 'Buffers' },
    ['?'] = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", 'Old files' },
    n = { "<cmd>NnnPicker<CR>", 'Nnn picker' },
    x = { "<cmd>set spell!<CR>", 'Toggle spellcheck'},
    ['<F5>'] = { "<cmd>lua require('dap').continue()<CR>", 'Start debug' },
    b = {
      name = 'Debug',
      b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", 'Toggle breakpoint' },
      t = { "<cmd>lua require('gsinka.plugins.dap-custom').open()<CR>", 'Open dap widgets' },
      c = { "<cmd>lua require('telescope').extensions.dap.commands()<CR>", 'Dap commands' },
      v = { "<cmd>lua require('telescope').extensions.dap.variables()<CR>", 'Dap variables' },
      l = { "<cmd>lua require('telescope').extensions.dap.configurations()<CR>", 'Dap configurations' },
      u = { "<cmd>lua require('dapui').toggle()<CR>", 'Dap-ui toggle' },
    },
    h = {
      name = 'GitGutter'
    },
    ['*'] = 'which_key_ignore',
})

nnoremap('', {
    ['<C-A-n>'] = { "<cmd>NnnExplorer %:p:h<CR>", 'Nnn explorer' },
    ['<C-A-p>'] = { "<cmd>NnnPicker<CR>", 'Nnn picker' },
    ['<A-\'>'] = { ":FloatermToggle<CR>", 'Floaterm toggle' }
})

tnoremap('', {
    ['<C-A-n>'] = { "<cmd>NnnExplorer %:p:h<CR>", 'Nnn explorer' },
    ['<C-A-p>'] = { "<cmd>NnnPicker<CR>", 'Nnn picker' },
    ['<ESC><ESC>'] = { "<C-\\><C-n>", 'Escape' },
    ['<A-\'>'] ={ "<C-\\><C-n>:FloatermToggle<CR>", 'Floaterm toggle'},
    ['<A-\">'] ={ "<C-\\><C-n>:FloatermNew<CR>", 'Floaterm new'},
    ['<A-j>'] = { "<C-\\><C-n>:FloatermNext<CR>", 'Floaterm next' },
    ['<A-k>'] = { "<C-\\><C-n>:FloatermPrev<CR>", 'Floaterm prev' },
})