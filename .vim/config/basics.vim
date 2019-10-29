" 参考：https://github.com/lighttiger2505/.dotfiles/blob/master/.vim/rc/options.rc.vim
" 　　：https://yu8mada.com/2018/08/26/i-ll-explain-vim-s-5-tab-and-space-related-somewhat-complicated-options-as-simply-as-possible/

" File encoding
if !exists('g:encoding_set') || !has('nvim')
  set encoding=utf-8
  set fileencodings=utf-8,sjis,iso-2022-jp,cp932,euc-jp
  set fileencoding=utf-8
  let g:encoding_set=1
endif
scriptencoding utf-8

" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif

" --------------------------------------------------------------
" Search
set hlsearch   " 検索文字列に色を付ける
set ignorecase " 検索時に大文字小文字を無視 (noignorecase:無視しない)
set smartcase  " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set wrapscan   " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
"set gdefault   " 置換時に「/g」をデフォルトで有効にする

" Edit
set tabstop=4                  " タブの半角スペース数 " 8→4に変更した
autocmd FileType vim setlocal tabstop=2
set softtabstop=0              " タブの入力時に挿入する半角スペース数。0だとOFFになる
set shiftwidth=0               " 改行時などにインデントする半角スペース数。0だとtabstopの値が使われる
set smarttab                   " タブの入力時にスペースを挿入する
set expandtab                  " タブをスペースに展開する (noexpandtab:展開しない)
set autoindent                 " 自動的にインデントする (noautoindent:インデントしない)
set backspace=indent,eol,start " バックスペースでインデントや改行を削除できるようにする
set showmatch                  " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set matchtime=1                " showmatchで対応する括弧を表示する時間(単位：0.1秒)(デフォルト：0.5秒)
set matchpairs+=<:>            " 対応する括弧に「<>」を追加
set wildmenu                   " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set formatoptions+=mM          " テキスト挿入中の自動折り返しを日本語に対応させる
set nrformats=alpha            " 数値の増減は常に10進数として行い、英字も増減できるようにする 初期値：octal,hex

" Display(GUI固有ではない)
set number         " 行番号を表示(nonumber:非表示)
"set relativenumber " 行番号をキャレット位置を基準として表示
set ruler          " ルーラーを表示 (noruler:非表示)
set list           " タブやスペース、改行などを可視化(nolist:非表示)
"set listchars=tab:>-,extends:<,trail:-,eol:< " どの文字でタブや改行を表示するかを設定
" タブを「>.」、行末の半角スペースを「-」、省略を「<」「>」で可視化
set listchars=tab:>.,trail:-,extends:>,precedes:<
set wrap           " 長い行を折り返して表示 (nowrap:折り返さない)
set laststatus=2   " 常にステータス行を表示 (詳細は:he laststatus)
set cmdheight=2    " コマンドラインの行数(Windows用gvim使用時はgvimrcを編集すること)
set showcmd        " コマンドをステータス行に表示
set title          " タイトルバーにファイル名を表示する
set cursorline     " カーソルがある行の背景色を変える
"set cursorcolumn   " カーソルがある列の背景色を変える " 半角と全角文字が混在していると見づらいのでコメントアウト
set colorcolumn=80 " 指定した列に色を付ける
syntax on          " コードに色を付ける
set pumheight=10   " 補完メニューの高さ(デフォルト：0(無制限))

" Cursor
set whichwrap=b,s,h,l " hやlによるカーソル移動で行をまたぐようにする 初期値：b,s
set scrolloff=15      " スクロール開始行数 初期値：0

" File
set writebackup
set nobackup          " バックアップファイルを作成しない
"set noswapfile        " スワップファイルを作成しない
"set noundofile        " アンドゥファイルを作成しない
set undodir=$VIM/undo " アンドゥファイルの保存先を指定する

" 動作に関する設定
set clipboard=unnamed,unnamedplus " レジスタを指定せずにクリップボードを使用する
" 挿入モードから切り替えるとき、自動的にIMEをOFFにする 初期値：0
"set iminsert=2 " gVimだと初期値が2のためコメントアウト

" --------------------------------------------------------------
" スワップファイルが存在する場合、メッセージを表示せずに読取専用で開く
" 参考：http://itchyny.hatenablog.com/entry/2014/12/25/090000
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

