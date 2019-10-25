" 参考：https://mba-hack.blogspot.jp/2013/03/unitevim.html
" 　　：http://www.karakaram.com/unite

" Unite用キーバインド
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap [unite]u :<C-u>Unite<Space>-no-split<Space>
" 現在開いているファイルと同フォルダ内に存在するファイル一覧
nnoremap [unite]f :<C-u>UniteWithBufferDir<Space>-buffer-name=files<Space>file<CR>
" バッファ一覧
nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
" レジスタ一覧
nnoremap [unite]r :<C-u>Unite<Space>-buffer-name=register<Space>register<CR>
" ブックマーク一覧
nnoremap [unite]k :<C-u>Unite<Space>bookmark<CR>
" ブックマークに追加
nnoremap [unite]a :<C-u>UniteBookmarkAdd<CR>
" 最近開いたファイル一覧
nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>

