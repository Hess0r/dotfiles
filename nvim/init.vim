" SETS
" =================
set number
" set ruler
set showmode
set showcmd
set hlsearch
set nobackup
set noswapfile
set nowritebackup
set noerrorbells
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set guicursor=
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=auto
set cmdheight=1
set hidden
set shortmess+=c
set updatetime=50
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildmenu
" set linebreak
" =================

" PLUGINS
" =================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'tpope/vim-fugitive'
call plug#end()

" COLORS
" =================
syntax on
colorscheme onedark
" =================

" FILETYPES
" =================
filetype plugin on
" =================

" AUTOCOMMANDS
" =================
autocmd bufwritepost init.vim source $MYVIMRC 
" =================

" COC.NVIM
" =================
let g:coc_global_extensions = [
  \ 'coc-fzf-preview',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-prettier',
  \ 'coc-explorer',
  \ '@yaegassy/coc-intelephense',
  \ 'coc-markdownlint',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-sh',
  \ ]
" =================

" KEYMAPPINGS
" =================
let mapleader="\<space>"

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
" =================
