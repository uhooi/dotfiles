filetype off
filetype plugin indent off

let mapleader = ","
noremap \ , " `,` のデフォルトの機能を `\` で使えるように退避

source ~/.vim/config/basics.vim
source ~/.vim/config/plugins.vim
source ~/.vim/config/mappings.vim

filetype plugin indent on
syntax enable

