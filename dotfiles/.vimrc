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
set history=1000 viminfo='1000
set mouse=
set nocompatible
set nomodeline
set nowrap
set number relativenumber
set path+=**
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set wildmenu showcmd
set keywordprg=:Man
set diffopt+=iwhiteall,algorithm:patience,indent-heuristic diffopt-=internal

hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

set spelllang=en
if filereadable(expand("/usr/share/vim/vimfiles/spell/fr.utf-8.spl"))
    set spelllang+=fr
    if filereadable(expand("/usr/share/vim/vimfiles/spell/de.utf-8.spl"))
        set spelllang+=de
    endif
endif

function Diff()
    vs `tempfile` | se ft=diff | r!git diff #
endfunction

if filereadable(expand("~/.vim/addi.vim")) 
    source ~/.vim/addi.vim 
endif
