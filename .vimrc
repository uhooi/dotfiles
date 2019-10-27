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

filetype plugin indent on
syntax enable

