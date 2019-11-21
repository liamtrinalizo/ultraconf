filetype plugin indent on
set background=dark
syntax on
runtime ftplugin/man.vim

set background=dark
set backspace=indent,eol,start
set cino+=(0g0
set completeopt-=preview
set encoding=utf8
set expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0 
set hlsearch incsearch showmatch
set mouse=
set nocompatible
set nomodeline
set nowrap
set number relativenumber
set path+=**
set statusline=%n\ -\ %f\ -\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]%y%h%m%=%l/%L;\ %4c\ [%P]
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set viminfo='1000
set wildmenu
set keywordprg=:Man

let mapleader = " "
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
