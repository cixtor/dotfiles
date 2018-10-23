" VIM - Vi IMproved
" VIM plugin manager
" brew install vim

execute pathogen#infect()
filetype plugin indent on
" plugin 'tpope/vim-pathogen'
" plugin 'itchyny/lightline.vim'
" plugin 'elentok/plaintasks.vim'
" plugin 'dracula/vim'

syntax on
set number
set nocompatible
set numberwidth=3
" set background=dark
colorscheme dracula

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

" One tab == 4 spaces
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

" Limit characters per line in GIT and Mercurial commits
au FileType hgcommit  set tw=72
au FileType gitcommit set tw=72

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
