" Show line numbers
set number
set numberwidth=3

" Highlight position of cursor
" set cursorcolumn
set cursorline

" Height of the command bar
set cmdheight=1

" Highlight search results
set hlsearch

" When searching try to be smart about cases
set smartcase

" Ignore case when searching
set ignorecase

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax on
colorscheme monokai
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

" Format of the file status
set laststatus=2
set statusline=%F%=\(%c:%l/%L\)\ [%{getfperm(@%)}\ %{&encoding}\ %{&fileformat}]

" Always show current position
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

" Current mode in status line
set showmode

" Split to the right and to the bottom
set splitright
set splitbelow

" Activate filetype plugins automatically
" Use :filetype to get more information
" https://github.com/elentok/plaintasks.vim
filetype plugin on

" Configure https://github.com/itchyny/lightline.vim
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
