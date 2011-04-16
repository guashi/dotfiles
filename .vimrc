" A lot stolen from "The Ultimate .Vimrc file

" http://spf13.com/post/ultimate-vim-config

" Basic {
set visualbell  "Disble bell
set nocompatible "No vi compatibility
let mapleader="," " Mapleader
" }

" General {
call pathogen#runtime_append_all_bundles()

if has("autocmd")  "Do this when compiled with support for autocommands.
	filetype plugin indent on  " Automatically change file types

	" Set File type to 'text' for file ending in .txt
	autocmd BufNewFile,BufRead *.txt setfiletype text

	" Enable soft-wrapping for text files
	autocmd FileType text,html,xhtml,eruby setlocal wrap linebreak nolist

	" Put these in an autocmd group
	augroup vimrcEx
	au!
		" When editing a file, always jump to the last know cursor position
		autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "normal g`\"" |
			\ endif

		autocmd BufWritePost .vimrc source $MYVIMRC  " Auto load .vimrc file
	augroup END

else
  set autoindent " Indent at the save leval as previous line

endif " has("autocmd")


set history=1000  " Keep (a lot) more history
set nobackup
set nowritebackup
" }

" Vim UI {
" Switch syntax highlighting on, when terminal has colors
if (&t_Co>2 || has("gui_running")) && !exists("syntax_on")
	syntax on " Enable systax highlightation
	set hlsearch

  colorscheme ir_black
  highlight NonText guibg=#060606
  highlight Folded  guibg=#0A0A0A guifg=#9090D0

endif

"if has("cmdline_info")
	set ruler " Enable cursor position
	set showcmd " Show imcomplete CMDS at the bottom
	set showmode  " Display current mode
"endif

set laststatus=2 "Always display the status line
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
set numberwidth=5  

	" GVim {
	if has("gui_running")
		"color ir_black 
		"set guifont = Monaco\ Sans\ 9  " Set the font
		"set guifont = Monospace  " Set the font
		" GVim options {
		set guioptions-=m  " Remove menu bar
		set guioptions-=T  " Remove toolbar with icons
		set guioptions-=r  " Remove scrollbars
		" }

		" Window  {
		set lines=42
		set columns=92
		winpos 200 0
		" }
	endif
	" }

  " Formatting {
  "Be smart, and awesome, about indentation
  set cindent     " Set C-style indent
  "set autoindent  " Indent at the save leval as previous line
  set smartindent " Auto indent after a {
  set smarttab
  "set expandtab  " Tabs are spaces

  set tabstop=2    " Tabs are 2 spaces
  set shiftwidth=2 " Even if there are tabs, preview as spaces
  set softtabstop=2
  set expandtab
  "set backspace=4 " Backspace back 2 spaces
  set backspace=indent,eol,start " Allow backspacing over everything in insert mode 

 if has("folding")
	  set foldenable
	  set foldmethod=syntax  " Set Fold method as (indent,syntax,manual)
	  set foldlevel=1
	  set foldnestmax=2
  endif

  " Tab completion
  "set completeopt=longest, menu
  "set wildmode=list:longest, list:full
  "set complete=,.t

  " }

  " Key Mapping {
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-L> <C-W>l
  map <C-H> <C-W>h

  " Quickly edit/reload the vimrc file
  nmap <silent> <leader>ev :e  $MYVIMRC<CR>
  nmap <silent> <leader>sv :so $MYVIMRC<CR>
  
  " Quick escaping
  inoremap jj <ESC>

  " Clean whitespace at the line bottom
  nnoremap <leader>W :%s/\s\+$//g<CR>   

  " Hide search highlighting
  map <leader>h :set invhls<CR>

  " Open an edit command with the path of current edited file
  map <leader>e :e <C-R>=expand("%:p:h") ."/" <CR>
  map <leader>vs :vsp <C-R>=expand("%:p:h") . "/" <CR>
  cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR> 
  
  " Insert current file name
  imap <C-F> <C-R>=expand("%")<CR> 

  " Map autocomplete to tab
  imap <Tab> <C-N>

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
	"let g:user_zen_expandabbr_key = "<c-e>"
	"let g:user_zen_complete_tag=1
	" }
" }
" }

