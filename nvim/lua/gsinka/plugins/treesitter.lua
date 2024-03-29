require('ts_context_commentstring').setup({})

require('nvim-treesitter.configs').setup({
  -- Add languages to be installed here that you want installed for treesitter
  -- ensure_installed = {
  --   'lua', 'c', 'bash', 'vim', 'make', 'regex',
  --   'gitcommit', 'gitattributes', 'git_rebase',
  --   'yaml', 'toml', 'ninja',
  --   'dockerfile',
  --   'markdown', 'markdown_inline',
  --   'todotxt', 'jq', 'comment',
  --   'html', 'css', 'scss',
  --   'php', 'phpdoc',
  --   'javascript', 'typescript', 'tsx', 'jsdoc',
  --   'json', 'jsonc', 'json5',
  --   'prisma',
  --   'haskell', 'elm',
  --   'go', 'gomod',
  --   'c_sharp',
  -- },
  auto_install = true,
  highlight = { enable = true },
  indent = {
    enable = true,
    disable = { 'python', 'javascript', 'javascriptreact', 'typescriptreact', 'typescript' }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
})

pcall(require('nvim-treesitter.install').update { with_sync = true })
