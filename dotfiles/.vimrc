filetype plugin indent on
colorscheme desert
syntax on
runtime ftplugin/man.vim

vnoremap <C-e> <C-a>
vnoremap g<C-e> g<C-a>

set number relativenumber
set backspace=indent,eol,start
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set mouse=
set completeopt-=preview
set hlsearch incsearch showmatch
set nowrap
set nomodeline
set wildmenu
set viminfo='1000
set encoding=utf8
set t_Co=256
set path+=**

let mapleader = " "
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <C-m> <C-a>
