scriptencoding utf-8

" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif

" --------------------------------------------------------------
" Search
"set hlsearch   " 検索文字列に色を付ける " 他の設定ファイルから読み込んでいるためコメントアウト
set ignorecase " 検索時に大文字小文字を無視 (noignorecase:無視しない)
set smartcase  " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set wrapscan   " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
"set gdefault   " 置換時に「/g」をデフォルトで有効にする " コメントアウト

" Edit
set tabstop=4                  " タブの画面上での幅 " 8→4に変更した
set expandtab                  " タブをスペースに展開する (noexpandtab:展開しない)
set autoindent                 " 自動的にインデントする (noautoindent:インデントしない)
set backspace=indent,eol,start " バックスペースでインデントや改行を削除できるようにする
set showmatch                  " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set matchtime=1                " showmatchで対応する括弧を表示する時間(単位：0.1秒)(デフォルト：0.5秒)
set matchpairs+=<:>            " 対応する括弧に「<>」を追加
set wildmenu                   " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set formatoptions+=mM          " テキスト挿入中の自動折り返しを日本語に対応させる
set nrformats=alpha            " 数値の増減は常に10進数として行い、英字も増減できるようにする 初期値：octal,hex

" display(GUI固有ではない)
set number " 行番号を表示(nonumber:非表示)
set ruler  " ルーラーを表示 (noruler:非表示)
set list   " タブやスペース、改行などを可視化(nolist:非表示)
"set listchars=tab:>-,extends:<,trail:-,eol:< " どの文字でタブや改行を表示するかを設定
" タブを「>.」、行末の半角スペースを「-」、省略を「<」「>」で可視化
set listchars=tab:>.,trail:-,extends:>,precedes:<
set wrap         " 長い行を折り返して表示 (nowrap:折り返さない)
set laststatus=2 " 常にステータス行を表示 (詳細は:he laststatus)
set cmdheight=2  " コマンドラインの行数(Windows用gvim使用時はgvimrcを編集すること)
set showcmd      " コマンドをステータス行に表示
set title        " タイトルバーにファイル名を表示する
set cursorline   " カーソルがある行の背景色を変える
"set cursorcolumn " カーソルがある列の背景色を変える " 半角と全角文字が混在していると見づらいのでコメントアウト
"syntax on        " コードに色を付ける " 他の設定ファイルから読み込んでいるのでコメントアウト
set pumheight=10  " 保管メニューの高さ(デフォルト：0(無制限))

" cursor
set whichwrap=b,s,h,l " hやlによるカーソル移動で行をまたぐようにする 初期値：b,s
set scrolloff=8       " スクロール開始行数 初期値：0

" file
set nobackup          " バックアップファイルを作成しない
"set noswapfile        " ファイルの編集中にスワップファイルを作成しない " コメントアウト
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

