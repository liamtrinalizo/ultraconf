filetype plugin indent on
syntax on
runtime ftplugin/man.vim
set keywordprg=:Man

set background=dark
set backspace=indent,eol,start
set cino+=(0g0
set completeopt-=preview
set diffopt+=iwhiteall,algorithm:patience,indent-heuristic diffopt-=internal
set encoding=utf8
set expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0 
set history=1000 viminfo='1000
set hlsearch incsearch showmatch
set keywordprg=:Man
set mouse=
set nocompatible
set nomodeline
set nowrap
set number relativenumber
set path+=**
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set wildmenu showcmd

let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$'

map g<C-]> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

function Diff()
    vs `tempfile` | se ft=diff | r!git diff #
endfunction

autocmd BufNewFile,BufRead *.yml,neomutt-*,COMMIT_EDITMSG set spell

if filereadable(expand("~/.vim/addi.vim")) 
    source ~/.vim/addi.vim 
endif
