" A lot stolen from "The Ultimate .Vimrc file

" http://spf13.com/post/ultimate-vim-config

" Basic {
set visualbell  "Disble bell
set nocompatible "Novi compatibility
let mapleader="," " Mapleader
" }

" General {
call pathogen#runtime_append_all_bundles()
filetype plugin indent on  " Automatically change file types
set history=1000  " Keep (a lot) more history
set nobackup
set foldmethod=indent  " Set Fold method as (indent,syntax,manual)
" }

" Vim UI {
syntax on " Enable systax highlightation
"colorscheme ir_black 

if has("cmdline_info")
	set ruler " Enable cursor position
	set showcmd " Show imcomplete CMDS at the bottom
	set showmode  " Display current mode
endif

if has("statusline")
	set statusline=%F%m%r%h%w%=(%{&ff}/%Y%{&encoding})\ (%l\/%L,\%c\ %P)
endif

set showmatch  " Show matching of: () [] {}
set matchpairs+=<:>

	" Searching {
	set ignorecase " Case insensitive search
	set smartcase  " Case sensitve when uppercase is present
	set incsearch  " Search as you type
	set hlsearch   " Highlight search matches
	" }

set autoread  " Auto read when file is changed
set hidden    " Hide buffers, rather ehan close them
set number    " Show line number
set numberwidth=3  

	" GVim {
	if has("gui_running")
		color ir_black 
		"set guifont = Monaco\ 9  " Set the font
		"set guifont = Monospace  " Set the font
		" GVim options {
		set guioptions-=m  " Remove menu bar
		set guioptions-=T  " Remove toolbar with icons
		set guioptions-=r  " Remove scrollbars
		" }

		" Window  {
		set lines=65
		set columns=115
		winpos 800 0
		" }
	endif
	" }

  " Formatting {
  "Be smart, and awesome, about indentation
  set cindent     " Set C-style indent
  set autoindent  " Indent at the save leval as previous line
  set smartindent " Auto indent after a {
  set smarttab
  "set expandtab  " Tabs are spaces

  set tabstop=4 " Tabs are 2 spaces
  set shiftwidth=4 " Even if there are tabs, preview as spaces
  set softtabstop=4
  "set backspace=4 " Backspace back 2 spaces
  " }

  " Key Mapping {
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-L> <C-W>l
  map <C-H> <C-W>h
  " Quickly edit/reload the vimrc file
  nmap <silent> <leader>ev :e  $MYVIMRC<CR>
  nmap <silent> <leader>sv :so $MYVIMRC<CR>

  inoremap jj <ESC>  " Quick escaping
  nnoremap <leader>W :%s/\s\+$//g<CR>  " Clean whitespace at the line bottom
  " }

" }

" Plugin {

	" NERDTree toggle {
	nmap <silent><F7> :NERDTreeToggle<CR>
	" }

	" BufExplorer {
	nmap <silent><F8> :BufExplorer<CR>
	" }

	" SuperTab {
	let g:SuperTabDefaultCompletionType = "context"
	" }

	" Zen coding {
	let g:user_zen_expandabbr_key = "<c-e>"
	let g:user_zen_complete_tag=1
	" }
" }
" }
