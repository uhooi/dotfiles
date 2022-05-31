" Pythonのパスを明示的に指定する
" ∵Neovimでは違うPythonを見ているため
" ref: https://qiita.com/uhooi/items/8a023c24c004ec0c8b84#pythonのパスを指定
let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')

" メニューの日本語化（メニュー表示前に行う必要がある）
if has('mac')
  set langmenu=japanese
endif

" Search
set hlsearch
set ignorecase
set smartcase
set wrapscan

" Edit
set tabstop=4
autocmd FileType vim setlocal tabstop=2
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

" Display
set number
set ruler
set list
set listchars=tab:>.,trail:-,extends:>,precedes:<
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set cursorline
set colorcolumn=80
syntax on
set pumheight=10

" Font
set ambiwidth=double

" Cursor
set whichwrap=b,s,h,l
set scrolloff=15

" Mouse
set mouse=a

" File
set writebackup
set nobackup
set undodir=~/.vim/undo

" スワップファイルが存在する場合、メッセージを表示せずに読取専用で開く
" ref: http://itchyny.hatenablog.com/entry/2014/12/25/090000
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" 動作に関する設定
set clipboard=unnamed,unnamedplus " レジスタを指定せずにクリップボードを使用する
" 挿入モードから切り替えるとき、自動的にIMEをOFFにする 初期値：0
"set iminsert=2 " gVimだと初期値が2のためコメントアウト

