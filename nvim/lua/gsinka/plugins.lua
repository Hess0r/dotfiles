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
use('sheerun/vim-polyglot')
use('windwp/nvim-autopairs')
use('nelstrom/vim-visual-star-search')
use('airblade/vim-gitgutter')

use {
	"luukvbaal/nnn.nvim",
	config = function()
    require('gsinka.plugins.nnn')
  end
}

use({
	'navarasu/onedark.nvim',
	config = function()
    require('onedark').load()
		-- vim.cmd('colorscheme onedark')
	end
})

use('vim-airline/vim-airline')
use({
  'vim-airline/vim-airline-themes',
  config = function ()
    vim.g.airline_theme = 'onedark'
  end
})

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
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
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('gsinka.plugins.cmp')
  end,
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
  'liuchengxu/vim-which-key',
  config = function()
    require('gsinka.plugins.whichkey')
  end
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
  -- Plug 'hrsh7th/cmp-cmdline'
  -- Plug 'sbdchd/neoformat'
  -- Plug 'rafamadriz/friendly-snippets'

