" ref: https://qiita.com/uhooi/items/292a98f45600c1e31b3e

" Japaneseize the menu {{{
if has('mac')
  set langmenu=japanese
endif
" }}}

" Search {{{
set hlsearch
set ignorecase
set smartcase
set wrapscan
" }}}

" Edit {{{
set tabstop=4
set softtabstop=0
set shiftwidth=0
set smarttab
set expandtab
set autoindent
set backspace=indent,eol,start
set showmatch
set matchtime=1
set matchpairs+=<:>
set wildmenu
set wildignorecase
set formatoptions+=mM
set nrformats=alpha
set virtualedit+=block
" }}}

" Display {{{
set number
set ruler
set list
set listchars=tab:>.,trail:-,extends:>,precedes:<
set wrap
set cmdheight=2
set showcmd
set title
set cursorline
set colorcolumn=80
set foldmethod=marker
set pumheight=10
set signcolumn=yes
" }}}

" Cursor {{{
set whichwrap=b,s,h,l
set scrolloff=15
" }}}

" Mouse {{{
set mouse=a
" }}}

" File {{{
set writebackup
set nobackup
set undodir=~/.vim/undo

" スワップファイルが存在する場合、メッセージを表示せずに読取専用で開く
" ref: http://itchyny.hatenablog.com/entry/2014/12/25/090000
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END
" }}}

" Others {{{
set clipboard=unnamed,unnamedplus " レジスタを指定せずにクリップボードを使用する
" }}}

