return {
  -- This thing is experimental
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'echasnovski/mini.nvim',
    },
    config = function()
      require('gsinka.plugins.noice')
    end,
  },

  {
    'karb94/neoscroll.nvim',
    config = true,
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('gsinka.plugins.dashboard')
    end
  },

  {
    'luukvbaal/nnn.nvim',
    config = function()
      require('gsinka.plugins.nnn')
    end
  },

  {
    'voldikss/vim-floaterm',
    config = function()
      require('gsinka.plugins.floaterm')
    end,
  },
}
