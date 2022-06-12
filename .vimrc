if !exists('g:encoding_set') || !has('nvim')
  set encoding=utf-8
  set fileencodings=utf-8,sjis,iso-2022-jp,cp932,euc-jp
  set fileencoding=utf-8
  let g:encoding_set=1
endif
scriptencoding utf-8

" ref: https://github.com/vim-jp/reading-vimrc/wiki/vimrcアンチパターン
"    : https://eh-career.com/engineerhub/entry/2019/01/28/103000
"    : https://vim-jp.org/vimdoc-ja/filetype.html

filetype off
filetype plugin indent off

let g:mapleader = ","
noremap \ , " `,` のデフォルトの機能を `\` で使えるように退避

source ~/.vim/config/filetypes.vim
source ~/.vim/config/basics.vim
source ~/.vim/config/plugins.vim
source ~/.vim/config/mappings.vim

syntax enable
filetype plugin indent on

let s:vimrc_local = '~/.vimrc.local'
if filereadable(expand(s:vimrc_local))
  exec ':source '.s:vimrc_local
endif

