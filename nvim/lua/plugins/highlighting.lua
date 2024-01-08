return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPre',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('gsinka.plugins.treesitter')
    end,
  },
}
