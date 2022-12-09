local nvim_treesitter = require'nvim-treesitter.configs'
nvim_treesitter.setup {
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      },
    },
  },
  ensure_installed = {
    'lua', 'c', 'bash', 'help', 'vim', 'make',
    'gitcommit', 'gitattributes', 'git_rebase',
    'yaml', 'toml', 'ninja',
    'dockerfile',
    'markdown', 'markdown_inline',
    'todotxt', 'jq', 'comment',
    'html', 'css', 'scss',
    'php', 'phpdoc',
    'javascript', 'typescript', 'tsx', 'jsdoc',
    'json', 'jsonc', 'json5',
    'prisma',
    'haskell',
    'go', 'gomod',
  },
  -- ensure_installed = "maintained",
}
