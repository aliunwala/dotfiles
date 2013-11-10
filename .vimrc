""""""""""""""""""""""""""""""
" => Plugin Related
""""""""""""""""""""""""""""""
let g:pathogen_disabled = ["vim-multiple-cursors-master"]
execute pathogen#infect()
call pathogen#helptags()
"autocmd vimenter * NERDTree  " Nerd tree starts up everytime
autocmd vimenter * if !argc() | NERDTree | endif "Nerd tree starts up when no files specified

""""""""""""""""""""""""""""""
" => Basic Settings
""""""""""""""""""""""""""""""
syntax enable
set number         "line numbers
filetype on        "vim detectects file type
filetype plugin on "??

set tabstop=4      "how many char's a tab LOOKs 
set softtabstop=4 "how many col are added for a tab
set shiftwidth=4
"set smarttab
set expandtab

set noerrorbells   "no error sounds
set nocompatible   "??
set ai             "auto indent
set ic             "ignore case
set si             "smart indent
set mouse=a        "use a mouse in vim
"set nowrap
set incsearch      "search as you type
set wrap           "Wrap lines
set undolevels=5000 "how many undos can be done
"colorscheme desert "background colorscheme
"colorscheme evening "background colorscheme
colorscheme grb256 "background colorscheme // Needs to be called after plugin calls

au BufNewFile,BufRead *.max set filetype=perl
au BufNewFile,BufRead *.sv set filetype=verilog
au BufNewFile,BufRead *.svh set filetype=verilog
au BufNewFile,BufRead *.v set filetype=verilog
au BufNewFile,BufRead *.vh set filetype=verilog

set showmatch      "highlight matching braces
set mat=5          "how long showmatch highlights braces

set hls            "Highlight All Search Patterns
set wrapscan       "search next when at end of file
set cul            "Highlight current line

set guioptions+=m
set guioptions+=T
:fixdel
set backspace=2
set whichwrap+=<,>,h,l "wrap cursor at end of line
" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
    syntax on
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
nnoremap <S-j> 7j
nnoremap <S-k> 7k

" Smart way to move between windows "traded functionaliaty for tab movment
" commands below
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Move Cursor
imap <silent> <A-h> <Left>
imap <silent> <A-k> <Up>
imap <silent> <A-j> <Down>
imap <silent> <A-l> <Right>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Fast cmd mode
imap ii <Esc>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
nnoremap <leader>
nnoremap <C-h> :tabprev<cr>
nnoremap <C-l> :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()





""--------------- Move Windows
"    nmap <silent> <A-i> :wincmd k<CR>
"    nmap <silent> <A-k> :wincmd j<CR>
"    nmap <silent> <A-j> :wincmd h<CR>
"    nmap <silent> <A-l> :wincmd l<CR>
"    "CANNOT USE THIS KEPT HERE FOR REFRENCE
"    "CANNOT DO <C-i> since that maps to tab.... really dumb
"    "imap <silent> <A-i> <ESC>:wincmd k<CR> <Insert>
"    "imap <silent> <A-k> <ESC>:wincmd j<CR> <Insert>
"    "imap <silent> <A-j> <ESC>:wincmd h<CR> <Insert>
"    "imap <silent> <A-l> <ESC>:wincmd l<CR> <Insert>
"
""-------------- Move Cursor
"    imap <silent> <A-i> <Up>
"    imap <silent> <A-k> <Down>
"    imap <silent> <A-j> <Left>
"    imap <silent> <A-l> <Right>
"    
"    nmap <silent> i <Up>
"    nmap <silent> k <Down>
"    nmap <silent> j <Left>
"    nmap <silent> l <Right>
"    
"    vmap <silent> i <Up>
"    vmap <silent> k <Down>
"    vmap <silent> j <Left>
"    vmap <silent> l <Right>
"
""-------------- Other mappings
"    nmap <silent> h <Insert>
"    imap hh <Esc>
"

"indentation guide
"
