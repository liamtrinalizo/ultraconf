filetype plugin indent on
syntax on
runtime ftplugin/man.vim
set keywordprg=:Man

autocmd BufNewFile,BufRead *.yml,neomutt-*,COMMIT_EDITMSG set spell

set background=dark
set backspace=indent,eol,start
set cino+=(0g0
set completeopt-=preview
set encoding=utf8
set expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0 
set hlsearch incsearch showmatch
set history=1000
set mouse=
set nocompatible
set nomodeline
set nowrap
set number relativenumber
set path+=**
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set viminfo='1000
set wildmenu
set keywordprg=:Man

function Diff()
    vs `tempfile` | se ft=diff | r!git diff #
endfunction

if filereadable(expand("~/.vim/addi.vim")) 
	source ~/.vim/addi.vim 
endif
