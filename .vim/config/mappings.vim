" ref: https://github.com/lighttiger2505/.dotfiles/blob/master/.vim/rc/mappings.rc.vim
"    : https://qiita.com/uhooi/items/58d58c24647f92f1995e
"    : https://vim-jp.org/vimdoc-ja/map.html#map-table

" ノーマル、ビジュアル、選択、オペレータ待機
" 「H, L」で行頭・行末に移動する
noremap H 0
noremap L $
noremap 0 H
noremap $ L
" Disable Arrow keys
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" ノーマル
" 「g」でカーソルを論理行移動できるようにする
" ref: https://zenn.dev/mattn/articles/83c2d4c7645faa
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nmap <SID>g <Nop>
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
nnoremap <C-a> +
nnoremap <C-x> -
" ウィンドウ関連
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap sr <C-w>r
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nmap s+ <C-w>+
nmap s- <C-w>-
nmap s> <C-w>>
nmap s< <C-w><
nmap s <Nop>
" ref: https://zenn.dev/mattn/articles/83c2d4c7645faa#おまけ
nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" 挿入
" 挿入モード時に矢印キーを無効にする
" ∵Vimのキーバインドに慣れるため
" Macの場合、日本語入力がおかしくなる不具合があるため無効にしない
" ref: https://github.com/cohama/lexima.vim/issues/13
if !has('mac')
  inoremap <Left> <Nop>
  inoremap <Down> <Nop>
  inoremap <Up> <Nop>
  inoremap <Right> <Nop>
endif

" ビジュアル
" インデントの調整後にビジュアルモードを解除しない
xnoremap < <gv
xnoremap > >gv

