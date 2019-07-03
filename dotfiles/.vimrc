" set the runtime path to include Vundle and initialize
" to install git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fugitive.vim'
Plugin 'SuperTab'
Plugin 'Yggdroot/indentLine'
Bundle 'takac/vim-hardtime'

call vundle#end()            " required
filetype plugin indent on    " required
colorscheme desert
syntax on
runtime ftplugin/man.vim
autocmd FileType help wincmd L

set number
set relativenumber
set backspace=indent,eol,start
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set mouse=
set completeopt-=preview
set hlsearch
set nowrap
set showmatch
set noshowmode

set incsearch
set viminfo='1000
set encoding=utf8

set t_Co=256 " 256 colors in terminal

"AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_line = ''
let g:airline_theme = 'badwolf'

"HARDTIME
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 0

"VOOGLE
let g:search_engine = 'google'
