set visualbell " 通知を視覚化する
set guiheadroom=100

" --------------------------------------------------------------
" メニュー設定:

" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

" WindowsのgVimでメニューバーとツールバーを非表示にする
" 参考：http://qiita.com/knt45/items/9717e30ca6a0f1fdad0f
set guioptions-=m " メニューバー
set guioptions-=T " ツールバー

" タブをテキストベースにする
" 参考：https://twitter.com/tsuyoshi_cho/status/1201153730290290688
set guioptions-=e

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
  set guifont=RictyDiminished\ Nerd\ Font:h10.5:cSHIFTJIS " 半角
  set guifontwide=RictyDiminished\ Nerd\ Font:h10.5:cSHIFTJIS " 全角
  set linespace=1
elseif has('mac')
  " Mac
  set guifont=RictyDiminished\ Nerd\ Font:h18 " 半角
  set guifontwide=RictyDiminished\ Nerd\ Font:h18 " 全角
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

