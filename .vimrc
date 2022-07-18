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
noremap \ ,

" Set augroup.
" ref: https://github.com/Shougo/shougo-s-github/blob/959a1069654d90f56bbb8b2f5a5f6d065010d102/vim/rc/vimrc
augroup MyAutoCmd
  autocmd!
augroup END

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

