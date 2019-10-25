set visualbell " 通知を視覚化する
set guiheadroom=100

"---------------------------------------------------------------------------
" フォント設定:

if has('win32') || has('win64') || has('mac')
  set encoding=utf-8
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
endif

if has('win16') || has('win32') || has('win64')
  " Windows
  "set guifont=Hack:h13
  set guifont=RictyDiminished\ NF:h10.5:cSHIFTJIS " 半角
  set guifontwide=RictyDiminished\ NF:h10.5:cSHIFTJIS " 全角
  set linespace=1
elseif has('mac')
  " Mac
  "set guifont=Hack:h13
  set guifont=RictyDiminished\ NF:h13.5 " 半角
  set guifontwide=RictyDiminished\ NF:h13.5 " 全角
  set linespace=1
else
  " linux
  set guifont=Hack:13
endif

"---------------------------------------------------------------------------
" GUI固有である画面表示の設定:

set lines=39 " ウィンドウに表示する行数、ステータスラインの行数分が設定値から引かれるよう
set columns=100 " 1行に表示する文字数
set cmdheight=2 " コマンドラインの高さ(GUI使用時)

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

set background=light

" カラースキーマの選択
colorscheme solarized
"colorscheme jellybeans
"colorscheme hybrid
"colorscheme molokai
"colorscheme visualstudio

