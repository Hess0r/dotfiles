local ensure_packer = function ()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

use('wbthomason/packer.nvim')

use('tpope/vim-commentary')
use('tpope/vim-fugitive')
use('junegunn/gv.vim')
use('tpope/vim-eunuch')
use('tpope/vim-unimpaired')
-- use('tpope/vim-sleuth')
use('sheerun/vim-polyglot')
use({
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end
  })
use('nelstrom/vim-visual-star-search')
use('airblade/vim-gitgutter')

use({
    'luukvbaal/nnn.nvim',
    config = function()
      require('gsinka.plugins.nnn')
    end
  })

use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end
  })

use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      -- require('gsinka.plugins.lualine')
      require('lualine').setup()
    end,
  })

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    { 'nvim-telescope/telescope-dap.nvim' },
  },
  config = function()
    require('gsinka.plugins.telescope')
  end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('gsinka.plugins.treesitter')
  end,
})
use({
    'folke/tokyonight.nvim',
    config = function()
      require('gsinka.plugins.colors')
    end
})

use({
    'EdenEast/nightfox.nvim',
    config = function()
      require('gsinka.plugins.colors')
    end
})

use({
    'navarasu/onedark.nvim',
    config = function()
      require('gsinka.plugins.colors')
    end
})

use({
    'danymat/neogen',
    config = function()
      require('neogen').setup({})
    end,
    requires = 'nvim-treesitter/nvim-treesitter',
  })

use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function ()
    require('gsinka.plugins.lsp')
  end,
})

use({
    'L3MON4D3/LuaSnip',
    config = function ()
      require('gsinka.plugins.luasnip')
    end
})

use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('gsinka.plugins.cmp')
  end,
})

use({
    'jayp0521/mason-nvim-dap.nvim',
    requires = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function ()
      require('gsinka.plugins.dap')
    end
})

use({
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
    },
    config = function ()
      require('gsinka.plugins.dap-ui')
    end
})

use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
})

use({
  'voldikss/vim-floaterm',
  config = function()
    require('gsinka.plugins.floaterm')
  end,
})

use({
  'folke/which-key.nvim',
  config = function()
    require('gsinka.plugins.whichkey')
  end
})

use({
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
})

use({
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('trouble').setup()
  end,
})

if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

  -- Plug('junegunn/fzf', { ['do'] = function() vim.call('fzf#install') end })
  -- Plug 'junegunn/fzf.vim'
  -- Plug 'sbdchd/neoformat'
  -- Plug 'rafamadriz/friendly-snippets'

