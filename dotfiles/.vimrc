filetype plugin indent on
syntax on
runtime ftplugin/man.vim
set keywordprg=:Man

set autowrite
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
set spelllang=en
set t_Co=256
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set runtimepath=$XDG_CONFIG_HOME/vim,/usr/share/vim/vimfiles,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set history=1000 viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set undodir=$XDG_DATA_HOME/vim/undo directory=$XDG_DATA_HOME/vim/swap backupdir=$XDG_DATA_HOME/vim/backup viewdir=$XDG_DATA_HOME/vim/view
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
hi PmenuSel   ctermfg=black ctermbg=white
hi QuickFixLine ctermbg=DarkRed

if filereadable(expand("$XDG_DATA_HOME/vim/addi.vim")) 
    source $XDG_DATA_HOME/vim/addi.vim 
    autocmd BufNewFile,BufRead COMMIT_EDITMSG inoremap <F2> <C-R>=Jid()<CR>
endif

autocmd BufNewFile,BufRead jira,neomutt-*,COMMIT_EDITMSG setlocal spell
autocmd BufWritePost *.h,*.hpp,*.c,*.cc,*.cpp silent !ctags -R .

command! Browse setl buftype=nofile | 0put =v:oldfiles
command! NewBrowse new +setl\ buftype=nofile | 0put =v:oldfiles
