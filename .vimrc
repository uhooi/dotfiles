if !exists('g:encoding_set') || !has('nvim')
  set encoding=utf-8
  set fileencodings=utf-8,sjis,iso-2022-jp,cp932,euc-jp
  set fileencoding=utf-8
  let g:encoding_set=1
endif
scriptencoding utf-8
" 参考：https://github.com/vim-jp/reading-vimrc/wiki/vimrcアンチパターン

filetype off
filetype plugin indent off

let mapleader = ","
noremap \ , " `,` のデフォルトの機能を `\` で使えるように退避

source ~/.vim/config/basics.vim
source ~/.vim/config/plugins.vim
source ~/.vim/config/mappings.vim

filetype plugin indent on
syntax enable

