filetype plugin indent on
syntax on
runtime ftplugin/man.vim
set keywordprg=:Man

set autowrite autoread
set background=dark
set cino+=(0g0
set completeopt-=preview
set cscopetag cscoperelative "cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set diffopt+=iwhiteall,algorithm:patience,indent-heuristic diffopt-=internal
set encoding=utf8
set hlsearch incsearch showmatch
set keywordprg=:Man
set mouse=
set nocompatible nomodeline nowrap
set number relativenumber
set path+=**
set spelllang=en
set t_Co=256
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab autoindent
set runtimepath=$XDG_CONFIG_HOME/vim,/usr/share/vim/vimfiles,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set history=1000 viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo undofile
set undodir=$XDG_DATA_HOME/vim/undo directory=$XDG_DATA_HOME/vim/swap backupdir=$XDG_DATA_HOME/vim/backup viewdir=$XDG_DATA_HOME/vim/view
set wildmenu showcmd

let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$'
let g:netrw_liststyle = 3
let g:OmniCpp_DisplayMode = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1
let g:OmniCpp_NamespaceSearch = 1

map g<C-]> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

hi DiffAdd    ctermfg=0     ctermbg=DarkGreen
hi DiffChange ctermfg=white ctermbg=DarkBlue
hi DiffDelete ctermfg=0     ctermbg=DarkRed
hi DiffText   ctermfg=white ctermbg=DarkBlue
hi Special    ctermfg=DarkRed cterm=Bold
hi PmenuSel   ctermfg=black ctermbg=white
hi QuickFixLine ctermbg=DarkRed

if filereadable(expand("$XDG_DATA_HOME/vim/addi.vim")) 
    source $XDG_DATA_HOME/vim/addi.vim 
    autocmd BufNewFile,BufRead COMMIT_EDITMSG inoremap <F2> <C-R>=Jid()<CR>
endif

autocmd BufNewFile,BufRead jira,neomutt-*,COMMIT_EDITMSG setlocal spell
autocmd BufNewFile,BufRead,BufEnter *.h,*.hpp,*.c,*.cc,*.cpp set omnifunc=omni#cpp#complete#Main
autocmd BufWritePost *.h,*.hpp,*.c,*.cc,*.cpp silent !ctags -R --c++-kinds=+pl --fields=+iaS --extras=+q
if filereadable("./cscope.out")
    cscope add cscope.out
endif


command! Browse vnew +setl\ buftype=nofile | 0put =v:oldfiles | %s/ /\\ /g | noh
command! Make wa | silent make | redraw! | cw
