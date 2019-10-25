" 参考：https://kamiya555.github.io/2015/10/14/nerdtree-command/

" Vimの起動時にファイルが指定されていない場合、NERDTreeを初期表示する
" Unite中心に使用するためコメントアウト
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ブックマークを初期表示する
let g:NERDTreeShowBookmarks=1

" 「Ctrl + n」でNERDTreeの表示を切り替える
noremap <C-n> :NERDTreeToggle<CR>

