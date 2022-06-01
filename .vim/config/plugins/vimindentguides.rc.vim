" ref: http://www.mk-mode.com/octopress/2014/02/10/vim-installation-of-indent-plugin/

" vimの起動時にvim-indent-guidesを無効にする
" ∵鬱陶しいため
let g:indent_guides_enable_on_vim_startup=0
" 「Ctrl + i」でガイドの表示を切り替える
nnoremap <C-i> :IndentGuidesToggle<CR>
" ガイドの幅
let g:indent_guides_guide_size = 1

