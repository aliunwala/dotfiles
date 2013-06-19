set nocompatible 
set incsearch
set hls
set wrapscan
set undolevels=1000


set expandtab

set cul
set guioptions+=m
set guioptions+=T
:fixdel
set backspace=2 
" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
	syntax on
endif

"" Highlight matches with last search pattern
""
"" Version 5+ adjustments
"" Set syntax environment for trusted terminals
"" (NLS-capable terminals, such as aixterm and dtterm, tend to
"" cause vim's syntax highlighting to be dysfunctional.)
"" - Switch syntax highlighting on
"" - Set Constant to more outstanding background
"" - Switch on highlighting the last used search pattern.
"" Set gui-specific behaviours
""
""
"" Configure syntax highlighting to work with GUI or xterm
""
"if ! has("gui_running")
"  if $TERM == 'aixterm'
"	set t_Co=0
"  else
"    set t_Co=8
"    if has("terminfo")
"      set t_Sf=[3%p1%dm
"      set t_Sb=[4%p1%dm
"    else
"      set t_Sf=[3%dm
"      set t_Sb=[4%dm
"    endif
"  endif
"endif
"
""color  desert
""IndentGuidesEnable


