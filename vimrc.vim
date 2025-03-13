""""""" Global Config 
set termguicolors
set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:python3_host_prog = '/opt/homebrew/bin/python3.11'


map <F9> :redraw!<cr>

"""""""  Tab configuration
"map <leader>tn :tabnew 
map <leader>te :tabedit 
"map <leader>tz :tabclose<cr>
"map <leader>tm :tabmove 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map for switching between the last two tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au TabLeave * :let g:last_tab=tabpagenr()
function! <sid>LastTab() "{{{
  if !exists("g:last_tab")
    return
  endif
  exe "tabn" g:last_tab
endfu "}}}
nmap <silent> <leader>tt :call <sid>LastTab()<CR>

" " When pressing <leader>cd switch to the directory of the open buffer
" map <leader>d :cd %:p:h<cr>

" When you press gv you vimgrep after the selected text
nnoremap <expr>   gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"" When pressing <leader>cd switch to the directory of the open buffer
"map <leader>cd :cd %:p:h/..<cr>
"map <leader>d :cd %:p:h<cr>

" " This version will work across newlines:
" " Swaping the lines up and down
" nnoremap <silent> gk ddkP
" nnoremap <silent> gj ddp
" " Swaping the words left and right (doesn't work for now)
" nnoremap <silent> gh "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR>``<c-l>:nohlsearch<CR>
" nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>/\w\+\_W\+<CR>``<c-l>:nohlsearch<CR>
" nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>/\w\+\_W\+<CR>``<c-l>:nohlsearch<CR>


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
inoremap <silent> <C-b> <Backspace>
inoremap <silent> <C-h> <C-o>h
inoremap <silent> <C-k> <C-o>k
inoremap <silent> <C-l> <C-o>l

"This allows for change paste motion cp{motion}
function! ChangePaste(type, ...) "{{{
  silent exe "normal! `[v`]\"_c"
  silent exe "normal! p"
endfunction "}}}
noremap <silent> cp :set opfunc=ChangePaste<CR>g@


" Map key chord `jk` to <Esc>.
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
  " echo l:timediff
	return (l:timediff <= 0.2 && l:timediff >=0.01) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
