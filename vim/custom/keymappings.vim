" map <leader> to space
let mapleader = "\<space>"

" tab for navigation in command complete window
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <CR> to select
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" <C-f> and <C-b> to scroll floating window
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" :Format to format current buffer
command! -nargs=0 Format :call CocAction('format')
" :OR to organise imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" K to call show documentation on preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" <c-o> to search symbol in current document
nnoremap <silent><nowait> <leader>o :<C-u>CocList outline<CR>
" Jump to next diagnostic
nmap <silent> [g <Plug>(coc-diagnostic-next)
" Jump to previous diagnostic
nmap <silent> ]g <Plug>(coc-diagnostic-prev)
" Call CocAction for current line
nnoremap <silent><nowait> <leader>. :<C-u>CocAction<CR>
" Search workspace symbols
nnoremap <silent><nowait> <leader>t :<C-u>CocList -I symbols<CR>
" Go to definition
nmap <silent> gd <Plug>(coc-definition)

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" toggle NerdTree
nnoremap <silent><nowait> <leader>n :NERDTreeToggle<CR>
" fuzzy file search
nnoremap <silent><nowait> <leader>p :Files<CR>
" fuzzy buffer search
nnoremap <silent> <leader>b :Buffers<CR>
" which key toggle
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" navigate through buffers
nnoremap <silent><nowait> <leader>h :bn<CR>
nnoremap <silent><nowait> <leader>l :bp<CR>
" close current buffer
nnoremap <silent><nowait> <leader>w :bd<CR>
