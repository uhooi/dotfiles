filetype off
filetype plugin indent off

" マップリーダーを「,」にする
let mapleader = ","

" 「,」のデフォルトの機能は、\で使えるように退避
noremap \ ,

" 各設定ファイルを読み込む
source ~/.vim/config/basics.vim
source ~/.vim/config/plugins.vim
source ~/.vim/config/mappings.vim

" Colors
" Solarized
set t_Co=256
set background=light
colorscheme solarized
call togglebg#map('<F5>') " F5で背景を切り替えられるようにする

" Nord
"set background=dark
"colorscheme nord

filetype plugin indent on
syntax enable

