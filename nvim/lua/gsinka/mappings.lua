local wk = require('which-key')

wk.register({
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
      O = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", 'LSP workspace symbols' },
      m = { "<cmd>lua require('telescope.builtin').marks()<CR>", 'Marks' },
      w = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", 'Spell suggest' },
      r = { "<cmd>lua require('telescope.builtin').resume()<CR>", 'Resume' },
    },
    g = {
      name = 'Git',
      l = {"<cmd>GV<CR>", 'Log'},
      g = {"<cmd>FloatermNew --name=lazygit lazygit<CR>", 'Lazygit floaterm'},
      d = {"<cmd>DiffviewFileHistory %<CR>", 'Buffer commits'},
      h = {"<cmd>0Gclog<CR>", 'Buffer revision history'},
    },
    p = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find files' },
    ['<space>'] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", 'Buffers' },
    ['?'] = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", 'Old files' },
    n = { "<cmd>NnnPicker %:p:h<CR>", 'Nnn picker' },
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
    z = {
      name = 'Session',
      l = { "<cmd>lua require('persistence').load()<CR>", 'Load' },
    },
    t = {
      name = 'Testing',
      n = { "<cmd>TestNearest<CR>", 'Test nearest' },
      f = { "<cmd>TestFile<CR>", 'Test file' },
      s = { "<cmd>TestSuite<CR>", 'Test suite' },
      l = { "<cmd>TestLast<CR>", 'Test last' },
      v = { "<cmd>TestVisit<CR>", 'Test visit' },
    },
    x = {
      name = 'Trouble',
      x = {"<cmd>TroubleToggle<CR>", 'Trouble toggle'},
    },
    ['*'] = 'which_key_ignore',
}, { prefix = '<leader>' })

wk.register({
    ['<C-A-n>'] = { "<cmd>NnnExplorer %:p:h<CR>", 'Nnn explorer' },
    ['<C-A-p>'] = { "<cmd>NnnPicker %:p:h<CR>", 'Nnn picker' },
    ['<A-\'>'] = { ":FloatermToggle<CR>", 'Floaterm toggle' }
})

wk.register({
    ['<C-A-n>'] = { "<cmd>NnnExplorer<CR>", 'Nnn explorer' },
    ['<C-A-p>'] = { "<cmd>NnnPicker<CR>", 'Nnn picker' },
    ['<ESC><ESC>'] = { "<C-\\><C-n>", 'Escape' },
    ['<A-\'>'] ={ "<C-\\><C-n>:FloatermToggle<CR>", 'Floaterm toggle'},
    ['<A-\">'] ={ "<C-\\><C-n>:FloatermNew<CR>", 'Floaterm new'},
    ['<A-j>'] = { "<C-\\><C-n>:FloatermNext<CR>", 'Floaterm next' },
    ['<A-k>'] = { "<C-\\><C-n>:FloatermPrev<CR>", 'Floaterm prev' },
}, { mode = 't' })
