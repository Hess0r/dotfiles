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

require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

local packer_bootstrap = ensure_packer() 

use('wbthomason/packer.nvim')
use('vim-airline/vim-airline')
use('vim-airline/vim-airline-themes')
use({
	'navarasu/onedark.nvim',
	config = function()
		vim.cmd('colorscheme onedark')
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
  run = ':TSUpdate',
  requires = {
    'nvim-treesitter/playground',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('gsinka.plugins.treesitter')
  end,
})
use('tpope/vim-commentary')

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
  -- Plug 'tpope/vim-fugitive'
  -- Plug 'neovim/nvim-lspconfig'
  -- Plug 'tpope/vim-commentary'
  -- Plug('nvim-treesitter/nvim-treesitter', {['do'] = function() vim.cmd(':TSUpdate') end})
  -- Plug 'hrsh7th/cmp-nvim-lsp'
  -- Plug 'hrsh7th/nvim-cmp'
  -- Plug 'hrsh7th/cmp-buffer'
  -- Plug 'hrsh7th/cmp-path'
  -- Plug 'hrsh7th/cmp-cmdline'
  -- Plug 'L3MON4D3/LuaSnip'
  -- Plug 'saadparwaiz1/cmp_luasnip'
  -- Plug 'kyazdani42/nvim-web-devicons'
  -- Plug 'nvim-lua/plenary.nvim'
  -- Plug 'b0o/schemastore.nvim'
  -- Plug 'onsails/lspkind-nvim'
  -- Plug 'sbdchd/neoformat'
  -- Plug 'rafamadriz/friendly-snippets'
  -- Plug 'airblade/vim-gitgutter'
  -- Plug 'OmniSharp/omnisharp-vim'
  -- Plug 'liuchengxu/vim-which-key'
  -- Plug 'windwp/nvim-autopairs'

