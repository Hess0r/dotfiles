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

call which_key#register('<Space>', "g:which_key_map")
" which key toggle
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:which_key_map = {}
let g:which_key_map.b = {
  \ 'name': '+buffers',
  \ 'b': 'show buffers',
  \ 'w': 'close current buffer',
  \ }
let g:which_key_map.p = 'Search files by name'
let g:which_key_map.f = 'Search in files'
let g:which_key_map.h = 'Next buffer'
let g:which_key_map.l = 'Prev buffer'
let g:which_key_map.e = 'Toggle file explorer'
let g:which_key_map.o = 'Search outline'
let g:which_key_map["."] = 'Quick action'
let g:which_key_map.t = 'Search workspace symbols'

" toggle Coc-Explorer
nnoremap <silent><nowait> <leader>e :CocCommand explorer<CR>
" fuzzy file search
nnoremap <silent><nowait> <leader>p :Files<CR>
" Buffers
  " fuzzy buffer search
  nnoremap <silent> <leader>bb :Buffers<CR>
  " close current buffer
  nnoremap <silent><nowait> <leader>bw :bd<CR>
" navigate through buffers
nnoremap <silent><nowait> <leader>l :bn<CR>
nnoremap <silent><nowait> <leader>h :bp<CR>
" search in files
nnoremap <silent><nowait> <leader>f :Rg<CR>
