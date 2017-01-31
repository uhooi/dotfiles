scriptencoding utf-8

"---------------------------------------------------------------------------
" フォント設定:
"
" フォントをRicty Diminishedにする
" 参考：http://qiita.com/astrsk_nakata/items/90f51a97981db494939f
" 　　：https://www.kaoriya.net/blog/2013/05/05/
" 　　：https://randomsoft.com/node/627
" 　　：http://note103.hateblo.jp/entry/2016/03/16/172327
if has('win32') || has('win64')
  set encoding=utf-8
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
  set guifont=Ricty_Diminished\ for\ Powerline:h10.5:cSHIFTJIS " 半角
  set guifontwide=Ricty_Diminished\ for\ Powerline:h10.5:cSHIFTJIS " 全角
  set rop=type:directx,renmode:5
"  set antialias " 何も変わらないためコメントアウト
  set printheader=%<%f%h%m%=%N\ ページ
  " 行間隔の設定
  set linespace=1
elseif has('mac')
  set encoding=utf-8
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
  set guifont=Ricty_Diminished\ for\ Powerline:h13.5 " 半角
  set guifontwide=Ricty_Diminished\ for\ Powerline:h13.5 " 半角
  set linespace=1
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif
" 「舩」などの文字が半角のように表示されるのを防ぐ
set ambiwidth=double

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
"
if has('mouse')
  " どのモードでもマウスを使えるようにする
  set mouse=a
  " マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
  set nomousefocus
  " 入力時にマウスポインタを隠す (nomousehide:隠さない)
  set mousehide
endif

" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"---------------------------------------------------------------------------
" メニューに関する設定:
"
" 解説:
" "M"オプションが指定されたときはメニュー("m")・ツールバー("T")供に登録され
" ないので、自動的にそれらの領域を削除するようにした。よって、デフォルトのそ
" れらを無視してユーザが独自の一式を登録した場合には、それらが表示されないと
" いう問題が生じ得る。しかしあまりにレアなケースであると考えられるので無視す
" る。
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" 印刷に関する設定:
"
" 注釈:
" 印刷はGUIでなくてもできるのでvimrcで設定したほうが良いかもしれない。この辺
" りはWindowsではかなり曖昧。一般的に印刷には明朝、と言われることがあるらし
" いのでデフォルトフォントは明朝にしておく。ゴシックを使いたい場合はコメント
" アウトしてあるprintfontを参考に。
"
" 参考:
"   :hardcopy
"   :help 'printfont'
"   :help printing
"
" 印刷用フォント
if has('printer')
  if has('win32') || has('win64')
    set printfont=MS_Mincho:h12:cSHIFTJIS
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

"---------------------------------------------------------------------------
" GUI固有である画面表示の設定:
" ウィンドウの高さ(初期値：25)
set lines=39 " ウィンドウに表示する行数、ステータスラインの行数分が設定値から引かれるよう
" ウィンドウの幅(初期値：80)
set columns=100 " 1行に表示する文字数
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

" 背景を透過させる(初期値：255)
" 参考：http://qiita.com/mayami/items/2635d24c6f67c8277308
" 重いのでコメントアウト
"if has('win32') || has('win64')
"  autocmd GUIEnter * set transparency=240
"elseif has('mac')
"  set transparency=240
"endif

"---------------------------------------------------------------------------
" カラースキーマに関する設定:
" solarized
let g:solarized_termcolors=16
"let g:solarized_termcolors=256
let g:solarized_termrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'

" F5で背景を切り替えられるようにする
call togglebg#map('<F5>')

syntax enable

"set t_Co=8
"set t_Co=16 " 初期値
"set t_Co=256

set background=light

" カラースキーマの選択
colorscheme solarized
"colorscheme jellybeans
"colorscheme hybrid
"colorscheme molokai
"colorscheme visualstudio

