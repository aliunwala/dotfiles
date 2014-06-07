""""""""""""""""""""""""""""""
" => Vundle Related 
""""""""""""""""""""""""""""""
    ""let g:pathogen_disabled = ["vim-multiple-cursors-master"]
    "execute pathogen#infect()
    "call pathogen#helptags()
    ""autocmd vimenter * NERDTree  " Nerd tree starts up everytime
    "autocmd vimenter * if !argc() | NERDTree | endif "Nerd tree starts up when no files specified
    
    set nocompatible              " be iMproved, required
    filetype off                  " required
    
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'godlygeek/csapprox'
    Plugin 'vim-scripts/Colour-Sampler-Pack'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-scripts/taglist.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'kien/ctrlp.vim'                
    "Plugin 'Valloric/YouCompleteMe'
    Plugin 'Lokaltog/powerline'
    Plugin 'nathanaelkane/vim-indent-guides'

    "already in the right place so no need to add it 
    "Plugin 'file:///home/goatfigpc/.dotfiles/.vim/bundle/grb256-master' "

    "Plugin 'scrooloose/syntastic'
    


    
    "" The following are examples of different formats supported.
    "" Keep Plugin commands between vundle#begin/end.
    "" plugin on GitHub repo
    "Plugin 'tpope/vim-fugitive'
    "" plugin from http://vim-scripts.org/vim/scripts.html
    "Plugin 'L9'
    "" Git plugin not hosted on GitHub
    "Plugin 'git://git.wincent.com/command-t.git'
    "" git repos on your local machine (i.e. when working on your own plugin)
    "Plugin 'file:///home/gmarik/path/to/plugin'
    "" The sparkup vim script is in a subdirectory of this repo called vim.
    "" Pass the path to set the runtimepath properly.
    "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    "" Avoid a name conflict with L9
    "Plugin 'user/L9', {'name': 'newL9'}
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""
" => Plugin related 
""""""""""""""""""""""""""""""
    "---------------------
    " => YouCompleteMe
    "---------------------
    imap <Tab> <C-P>
    set complete=.,b,u,]
    set wildmode=longest,list:longest
    set completeopt=menu,preview
    "---------------------
    " => ctrlp - fuzzymatching file open
    "---------------------
    let g:ctrlp_map = '<c-y>'
    let g:ctrlp_show_hidden = 1
    """"""""""""""""""""""""""""""
    " => Tag list config 
    """"""""""""""""""""""""""""""
    let Tlist_Ctags_Cmd = "/usr/bin/ctags"
    let Tlist_WinWidth = 50
    map <F4> :TlistToggle<cr>
    map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    """"""""""""""""""""""""""""""
    " => Easy Motion
    """"""""""""""""""""""""""""""
    nmap <leader>l  (easymotion-w)
    """"""""""""""""""""""""""""""
    " => NerdTree 
    """"""""""""""""""""""""""""""
    map <F1> :NERDTreeToggle<cr>
    map <F2> :NERDTreeMirror<cr>
""""""""""""""""""""""""""""""
" => Zooming In and Out
""""""""""""""""""""""""""""""
    map - :call FontUpDown('d')<cr>
    map = :call FontUpDown('u')<cr>
""""""""""""""""""""""""""""""
" => Plugin Cheat sheet
""""""""""""""""""""""""""""""
    " Muticursor
    "   ctrl+n highlight and move forward
    "   ctrl+p go back one highlight
    "   ctrl+x skip one cursor position
    " NerdTree
    "   
    " NerdCommenter
    "   leader+ci toggle comment per line
    "   leader+cc add comment
    " Tag List
    "   <F4> show tags
    "   <F8>
    "  +             Open a fold
    "  -             Close a fold
    "  *             Open all folds
    "  =             Close all folds

""""""""""""""""""""""""""""""
" => Basic Settings
""""""""""""""""""""""""""""""
    set list lcs=tab:\.\ 
    syntax enable
    set number         "line numbers
    filetype on        "vim detectects file type
    filetype plugin on "??
    
    " Fix Copy Past Stupidity
    "set clipboard=unnamed "Probably only for windows
    set clipboard=unnamedplus
    
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
    colorscheme oceandeep "background colorscheme
    colorscheme chocolateliquor "background colorscheme
    "colorscheme twilight "background colorscheme
    "colorscheme wombat256mod "background colorscheme
    "colorscheme grb256 "background colorscheme // Needs to be called after plugin calls
    
    au BufNewFile,BufRead *.max set filetype=perl
    au BufNewFile,BufRead *.sv set filetype=verilog
    au BufNewFile,BufRead *.svh set filetype=verilog
    au BufNewFile,BufRead *.v set filetype=verilog
    au BufNewFile,BufRead *.vh set filetype=verilog
    au BufNewFile,BufRead *.launch set filetype=xml
    
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
    nmap <leader>w :w<cr>
    nmap <leader>q :q<cr>
    nmap <leader>e :Explore<cr>
    
    " Add visual red col at 80 char
    set colorcolumn=80
    " Add visual identifier for wraped lines
    set showbreak=>>>
    " Remove help menu from popping up
    "nnoremap <f1> <Nop>
    "vnoremap <f1> <Nop>
    "inoremap <f1> <Nop>

    "---------------------
    " => Make tab key act properly
    "---------------------
    imap <Tab> <C-P>
    nnoremap <Tab> >>_
    nnoremap <S-Tab> <<_
    inoremap <S-Tab> <C-D>
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv
    
    "---------------------
    " => Make control+s save like in windows 
    "---------------------
    inoremap <c-s> <c-o>:write<CR>
    nnoremap <c-s> :write<CR>
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
    " Always show the status line
    set laststatus=2
    
    " Format the status line
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk
    nnoremap <S-j> 7j
    nnoremap <S-k> 7k
    
    "inoremap <C-n> <C-p> " Broken Need to fix flip n to p
    
    " Smart way to move between windows "traded functionaliaty for tab movment
    " commands below
    "map <C-j> <C-W>j
    "map <C-k> <C-W>k
    "map <C-h> <C-W>h
    "map <C-l> <C-W>l
    nnoremap <S-h> <C-W>h 
    nnoremap <S-l> <C-W>l
    
    
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
    imap jk <Esc>
    "vmap  <Esc>
    
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
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSelection('gv')<CR>
    
    " Open vimgrep and put the cursor in the right position
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
    
    " Vimgreps in the current file
    map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
    
    " When you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
    
    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with vimgrep, display your results in cope by doing:
    "   <leader>cc
    "
    " To go to the next search result do:
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
    
    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " good scripting how to is at
    " http://www.ibm.com/developerworks/library/l-vim-script-1/
    " http://learnvimscriptthehardway.stevelosh.com/
    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction
    
    " to run do :call Font(12)
    function! Font(size) range
            let l:mytemp ="Monospace\\ " . a:size 
            echo l:mytemp
            execute "set guifont=" . l:mytemp
    endfunction
    "Example :call Font(11)
    
    let g:globalsize =12
    function! FontUpDown(size1) range
            if a:size1 == 'u'
                execute Font(g:globalsize+1)
                let g:globalsize = g:globalsize+1
            endif
            if a:size1 == 'd'
                execute Font(g:globalsize-1)
                let g:globalsize = g:globalsize-1
            endif
    endfunction
    
    " Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        en
        return ''
    endfunction
    
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
