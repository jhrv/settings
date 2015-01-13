execute pathogen#infect()

" Enable filetype plugins
filetype plugin on
filetype indent on

syntax enable " Enable syntax highlighting

set autoread " Set to auto read when a file is changed from the outside

set nocompatible " </3 vi

set number " show linenumbers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k

" Airline stuff
set laststatus=2
set ttimeoutlen=50
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''
let g:airline_branch_prefix     = ''
let g:airline_readonly_symbol   = ''
let g:airline_linecolumn_prefix = ''

set wildmenu " Turn on the Wild menu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*~ " Ignore compiled files
set ruler "Always show current position
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them

" No annoying sound on errors
set noerrorbells
set novisualbell

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

set ffs=unix,dos,mac " Use Unix as the standard file type

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title

set autochdir   " Change working directory to open buffer
 
"colorscheme atom-dark
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
