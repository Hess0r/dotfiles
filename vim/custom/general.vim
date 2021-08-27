let skip_defaults_vim=1
set nocompatible

" show line numbers
set number
" col and row info on bottom right
set ruler

" show command insert mode
set showmode
" show command under status line
set showcmd

" spacing settings for <TAB> and autoindents
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set expandtab

" does not change <EOL> on editing
set nofixendofline

" sets line numberong to fixed, instead of relative to current line
set norelativenumber

" no backup and swap files are created when editing or writing
set nobackup
set noswapfile
set nowritebackup

" set window icont text to the name of open file
set icon

" always show status line (even on last window)
set laststatus=2

" use visaul bell instead of beeping
" the t_vb sets the flash timing and coldrs
" empty t_vb will not show any flash
set visualbell
set t_vb=

" coc.nvim
set cmdheight=2
set hidden
set updatetime=300
set shortmess+=c
" coc.nvim end

" Ignoring files from fzf
set wildignore+=*/tmp/*
set wildignore+=*/vendor/
set wildignore+=*/node_modules/

" function to use when omni complete in insert mode
set omnifunc=syntaxcomplete#Complete

" set the signs to be displayed in number row
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
