return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
        config = function()
          require('telescope').load_extension('fzf')
        end,
      },
    },
    config = function()
      require('gsinka.plugins.telescope')
    end,
  },
}
