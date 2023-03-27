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
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'folke/noice.nvim',
    },
    config = function ()
      require('lualine').setup(
        {
          options = {
            icons_enabled = false,
            theme = 'onedark',
            component_separators = '|',
            section_separators = '',
          },
          sections = {
            lualine_c = {
              {
                'filename',
                path = 1,
              }
            },
            lualine_x = {
              {
                require('noice').api.status.mode.get,
                cond = require('noice').api.status.mode.has,
              },
              'encoding', 'fileformat', 'filetype',
            },
          },
        }
      )
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
