scriptencoding utf-8

" --------------------------------------------------------------
" vi互換でなく、Vimのデフォルト設定にする
"set nocompatible " ググったら不要と出てきたためコメントアウト

" --------------------------------------------------------------
" 日本語対応のための設定:
"
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
source $VIM/plugins/kaoriya/encode_japan.vim
" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif

" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif

" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

" --------------------------------------------------------------
" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

" WindowsのgVimでメニューバーとツールバーを非表示にする
" 参考：http://qiita.com/knt45/items/9717e30ca6a0f1fdad0f
set guioptions-=m " メニューバー
set guioptions-=T " ツールバー

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
" ファイル名に大文字小文字の区別がないシステム用の設定:
"   (例: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tagsファイルの重複防止
  set tags=./tags,tags
endif

" --------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

" --------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

" --------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

" --------------------------------------------------------------
" スワップファイルが存在する場合、メッセージを表示せずに読取専用で開く
" 参考：http://itchyny.hatenablog.com/entry/2014/12/25/090000
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" --------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: 日本語ヘルプを無効化する.
if kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimdoc-ja"'), ',')
endif

" vimproc: 同梱のvimprocを無効化する
if kaoriya#switch#enabled('disable-vimproc')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
endif

" go-extra: 同梱の vim-go-extra を無効化する
if kaoriya#switch#enabled('disable-go-extra')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]golang$"'), ',')
endif

" --------------------------------------------------------------
" KaoriYa 固有の機能を無効にする
if has('kaoriya')
  let g:no_vimrc_example=0
  let g:vimrc_local_finish=1
  let g:gvimrc_local_finish=1

  "$VIM/plugins/kaoriya/autodate.vim
  let plugin_autodate_disable=1
  "$VIM/plugins/kaoriya/cmdex.vim
  let plugin_cmdex_disable=1
  "$VIM/plugins/kaoriya/dicwin.vim
  let plugin_dicwin_disable=1
  "$VIMRUNTIME/plugin/format.vim
  let plugin_format_disable=1
  "$VIM/plugins/kaoriya/hz_ja.vim
  let plugin_hz_ja_disable=1
  "$VIM/plugins/kaoriya/scrnmode.vim
  let plugin_scrnmode_disable=1
  "$VIM/plugins/kaoriya/verifyenc.vim
  let plugin_verifyenc_disable=1
endif

