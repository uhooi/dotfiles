scriptencoding utf-8

" 参考：https://github.com/lighttiger2505/.dotfiles/blob/master/.vim/rc/mappings.rc.vim
" 　　：https://qiita.com/uhooi/items/58d58c24647f92f1995e
" 　　：:h map-table

" 再割り当て：なし
" 通常モード、視覚モード
" 「g」でカーソルを論理行移動できるようにする
" 参考：https://zenn.dev/mattn/articles/83c2d4c7645faa
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nmap <SID>g <Nop>
" 「Shift + h, l」で行頭・行末に移動する
noremap <S-h> 0
noremap <S-l> $
noremap 0 <S-h>
noremap $ <S-l>
" 矢印キーを無効にする
" ∵Vimのキーバインドに慣れるため
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" 通常モード
" 「Y」をカーソル位置から行末までのヤンクにする
nnoremap Y y$
" 貼り付け先のインデントに合わせてペーストする
nnoremap p ]p
nnoremap P ]P
nnoremap ]p p
nnoremap ]P P
" インクリメント、デクリメントを「+」「-」に割り当てる
nnoremap + <C-a>
nnoremap - <C-x>

" ウィンドウ関連
" 参考：http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
nnoremap sr <C-w>r
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nmap s+ <C-w>+
nmap s- <C-w>-
nmap s> <C-w>>
nmap s< <C-w><
nmap s <Nop>
" 参考：https://zenn.dev/mattn/articles/83c2d4c7645faa#おまけ
nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" 挿入モード
" エスケープでIMEをOFFにする(通常モードに戻るときにIMEをOFFにしたいため)
"inoremap <ESC> <ESC>:set iminsert=0<CR>
" コントロールでカーソル移動を通常モードと同様のキーバインドで行う
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" 挿入モード時に矢印キーを無効にする
" ∵Vimのキーバインドに慣れるため
" Macの場合、日本語入力がおかしくなる不具合があるため無効にしない
" 参考：https://github.com/cohama/lexima.vim/issues/13
if !has('mac')
  inoremap <Left> <Nop>
  inoremap <Down> <Nop>
  inoremap <Up> <Nop>
  inoremap <Right> <Nop>
endif

" ビジュアルモード
" インデントの調整後にビジュアルモードを解除しない
xnoremap < <gv
xnoremap > >gv

