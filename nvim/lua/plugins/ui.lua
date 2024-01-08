return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
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
