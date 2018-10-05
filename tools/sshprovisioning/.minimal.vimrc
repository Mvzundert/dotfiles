" ==========================
" ======= Miniam vimrc======
" ==========================
" Used for copying when connecting using SSH to other servers.

" ==========================
" ======= Config ===========
" ==========================
" Necessary for lots of cool vim things, makes it not live in the past.
set nocompatible

" Enable Syntax processing
syntax enable

" Always change to the current file dir
" set autochdir
" Detect when a file is changed
set autoread

" Encoding seems to be a thing...
scriptencoding utf-8
set encoding=utf-8

" ==========================
" ====== Menu  =============
" ==========================
" Show command in the bottom bar
set showcmd
" Visual Autocomplete for the command menu
set wildmenu

" ==========================
"======== Tabs =============
" ==========================
" tabs ftw
set noexpandtab
" tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set smarttab
" Number of visual spaces per TAB
set tabstop=4
" Number of spaces in TAB when editing
set softtabstop=4
" Tabs are spaces
set expandtab
" number of spaces to use for indent and unindent
set shiftwidth=4
" round indent to a multiple of 'shiftwidth'
set shiftround 

" ==========================
" ======= Lines/Cursor =====
" ==========================
" Hyrid line numbers are awesome, we show the line
" number and the relative number @ the same time.
" Make sure you have vim 7.4 or higher to support this,
" else turn one of these off
set relativenumber 
set number
" Highlight the line on which the cursor lives.
set cursorline

"" we handle longer lines.
" set wrap
" set textwidth=100
" set formatoptions=qrn1
set colorcolumn=180
highligh ColorColumn ctermbg=0 guibg=lightgrey

" We display tabs and line endings.
set list
set listchars=tab:▸\ ,eol:¬
"set listchars=eol:~,tab:▸\ ,eol:¬,extends:>,precedes:<,space:_

" ==========================
" ===== Highlight magic =====
" ==========================
" Highlight matching [{()}] 
set showmatch
" Magic for doing regex stuff.
set magic
" Backspace over everything in insert mode... might not be the best idea.
set backspace=2

" ==========================
" ====== Folding ===========
" ==========================
" Enable folding
set foldenable
" Open most folds by default
set foldlevelstart=11
" 10 nested fold max
set foldnestmax=10
" Fold based on indent level.
set foldmethod=indent

" ==========================
" ====== Improve search ====
" ==========================
" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" Ignore case when searching, this can be set or unset in command mode
" but I prefer to have it set by default.
set ignorecase

" ==========================
" ======= No Backup ========
" ==========================
" I don't think VIM should be storing any backups when
" we have buffers we can use, feel free to disable this
" if you prefer to have swap files etc.
set nobackup
set nowb
set noswapfile


