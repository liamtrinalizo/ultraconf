filetype plugin on
syntax on
runtime ftplugin/man.vim
set keywordprg=:Man

set background=dark
set cino+=(0g0
set completeopt-=preview
set cscopetag cscoperelative "cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set diffopt+=iwhiteall,algorithm:patience,indent-heuristic diffopt-=internal
set encoding=utf8
set expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0 
set hlsearch incsearch showmatch
set keywordprg=:Man
set mouse=
set nocompatible nomodeline nowrap
set number relativenumber
set path+=**
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set spelllang=en
set t_Co=256
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set history=1000 viminfo+='1000,n~/.cache/vim/viminfo
set wildmenu showcmd

let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$'
let g:OmniCpp_DisplayMode = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1

map g<C-]> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

hi DiffAdd    ctermfg=0     ctermbg=DarkGreen
hi DiffChange ctermfg=white ctermbg=DarkBlue
hi DiffDelete ctermfg=0     ctermbg=DarkRed
hi DiffText   ctermfg=white ctermbg=DarkBlue
hi Special    ctermfg=DarkRed cterm=Bold
hi PmenuSel   ctermfg=white

if filereadable(expand("~/.vim/addi.vim")) 
    source ~/.vim/addi.vim 
    autocmd BufNewFile,BufRead COMMIT_EDITMSG inoremap <F2> <C-R>=Jid()<CR>
endif

autocmd BufNewFile,BufRead *.yml,neomutt-*,COMMIT_EDITMSG setlocal spell
