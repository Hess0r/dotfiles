vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'tpope/vim-commentary',
  'junegunn/gv.vim',
  'tpope/vim-eunuch',
  'tpope/vim-unimpaired',
  'tpope/vim-surround',
  'rafamadriz/friendly-snippets',
  -- 'sheerun/vim-polyglot',
  -- 'jwalton512/vim-blade',
  -- 'pantharshit00/vim-prisma',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      {
        'folke/neodev.nvim',
        config = function()
          require('neodev').setup()
        end,
      },
    },
    config = function()
      require('gsinka.plugins.lsp')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('gsinka.plugins.cmp')
    end
  },
  { 'folke/which-key.nvim', opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    opts = {
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
        }
      }
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  -- { 'numToStr/Comment.nvim', opts = {} },
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
      },
    },
    config = function()
      require('gsinka.plugins.telescope')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('gsinka.plugins.treesitter')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('bufferline').setup({})
    end,
  },
  {
    'luukvbaal/nnn.nvim',
    config = function()
      require('gsinka.plugins.nnn')
    end
  },
  {
    'danymat/neogen',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    'voldikss/vim-floaterm',
    config = function()
      require('gsinka.plugins.floaterm')
    end,
  },
  {
    'vim-test/vim-test',
    config = function()
      require('gsinka.plugins.vim-test')
    end
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
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gsinka.plugins.diffview')
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('gsinka.plugins.trouble')
    end,
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  -- This thing is experimental
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function ()
      require('noice').setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          view = 'cmdline'
        },
      })
    end,
  },
  -- {
  --   'glepnir/lspsaga.nvim',
  --   event = 'BufRead',
  --   dependencies = {
  --     'kyazdani42/nvim-web-devicons',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   config = true,
  -- },
  -- {
  --   'RRethy/vim-illuminate',
  --   config = function()
  --     require('gsinka.plugins.illuminate')
  --   end
  -- },
})

