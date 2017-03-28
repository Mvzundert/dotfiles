" Pathogen makes plugins easy https://github.com/tpope/vim-pathogen
call pathogen#infect()

" Nerd Tree stuff
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ============= Config =============
set nocompatible        " Necesary for lots of cool vim things
syntax enable           " enable syntax processing

" ============= Command  =============
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu

" ============= Tabs =============
set tabstop=4      	    " number of visual spaces per TAB
set softtabstop=4   	" number of spaces in tab when editing
set expandtab       	" tabs are spaces

" ============= Lines/Cursor =============
set number              " Line numbers
set cursorline          " Highlight the cursor line.

" ============= highligh magic =============
set showmatch           " highlight matching [{()}]
set magic               " For regular expressions turn magic on
set backspace=2         " backspace over everything in insert mode

" ============= Folding =============
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" ============= Improve search =============
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase		    " Ignore case when searching

" ============= No Backup =============
set nobackup
set nowb
set noswapfile

" ============= Theming =============
set background=dark	    " theming of VIM background
colorscheme badwolf     " awesome colorscheme https://github.com/sjl/badwolf


