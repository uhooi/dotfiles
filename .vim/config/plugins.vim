scriptencoding utf-8

" dein
" 参考：https://github.com/Shougo/dein.vim
" 　　：http://post.simplie.jp/posts/55
" 　　：http://qiita.com/yoza/items/2f8bd33a18225754f346

filetype plugin indent off

if &compatible
  set nocompatible
endif

if has('vim_starting')
  " ランタイムパスにプラグインの格納パスを追加
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/
endif

call dein#begin(expand('~/.vim/dein/'))

" 導入するプラグイン一覧
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', 'build': 'make')
call dein#add('Shougo/unite.vim')                " ランチャー(最近開いたファイル一覧機能を使用するにはneomru.vimが必要)
call dein#add('Shougo/neomru.vim')               " ファイル操作
call dein#add('ujihisa/unite-colorscheme')       " カラースキーマ一覧表示
call dein#add('Shougo/neocomplete.vim')          " 入力補完
call dein#add('itchyny/lightline.vim')           " ステータスライン拡張
call dein#add('itchyny/calendar.vim')            " Googleカレンダー連携
"call dein#add('itchyny/vim-parenmatch')          " 対応する括弧をハイライトする(デフォルトより8倍高速)
"call dein#add('itchyny/vim-cursorword')          " カーソル上の単語に下線を引く
call dein#add('scrooloose/nerdtree')             " ツリーエクスプローラー
call dein#add('scrooloose/syntastic')            " 構文チェッカー
call dein#add('nathanaelkane/vim-indent-guides') " インデント可視化
"call dein#add('koron/minimap-vim')               " ミニマップ→Rictyだときれいに表示されないためコメントアウト
"call dein#add('severin-lemaignan/vim-minimap')   " ミニマップ→なぜか表示されないためコメントアウト
call dein#add('kannokanno/previm')               " マークダウンプレビュー
call dein#add('tyru/open-browser.vim')           " ブラウザ連携
"call dein#add('kakkyz81/evervim')                " Evernote連携(Python2.7とmarkdownパッケージが必要)
call dein#add('tpope/vim-fugitive')              " Git連携
"call dein#add('thinca/vim-quickrun')            " 
"call dein#add('easymotion/vim-easymotion')       " キャレット移動補助
call dein#add('osyo-manga/vim-over')             " 置換対象文字列ハイライト
call dein#add('kylef/apiblueprint.vim')          " API Blueprintのシンタックスハイライトとバリデーション
call dein#add('aklt/plantuml-syntax')            " PlantUMLのシンタックスハイライト
call dein#add('mechatroner/rainbow_csv')         " CSVのシンタックスハイライト

" カラースキーマ
call dein#add('altercation/vim-colors-solarized')
call dein#add('nanotech/jellybeans.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('tomasr/molokai')
"call dein#add('vim-scripts/Visual-Studio')       " 文字が崩れるためコメントアウト

call dein#end()

" プラグインの更新確認を聞く
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on


" --------------------------------------------------------------
" Unite
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

" --------------------------------------------------------------
" doxygenのフォーマットを有効にする
" ∵C#のシンタックスハイライトをきれいに表示したいため
" 参考：http://vim-jp.org/vimdoc-ja/syntax.html
:let g:load_doxygen_syntax = 1

" --------------------------------------------------------------
" lightline
" 参考：http://itchyny.hatenablog.com/entry/20130828/1377653592
" 　　：http://itchyny.hatenablog.com/entry/20130917/1379369171
" 　　：https://github.com/itchyny/lightline.vim
" 　　：http://altarf.net/computer/%E6%8A%80%E8%A1%93%E7%9A%84%E3%81%AA%E3%83%9D%E3%82%A8%E3%83%A0/3244
" 　　：http://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
" 　　：http://qiita.com/osamunmun/items/6fcabd8dff0d5fded559
" 　　：http://note103.hateblo.jp/entry/2016/03/16/172327

let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'compatible'
"set t_Co=256
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
        \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype', 'winform' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode',
        \   'winform' : 'LightLineWinform'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '|', 'right': '|' }
        \ }

        " セパレート候補
        " 今のところどれもうまくいかない
        "\ 'separator': { 'left': '', 'right': '' },
        "\ 'subseparator': { 'left': '|', 'right': '|' }
        "\ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        "\ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
        "\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        "\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
        "\ 'separator': { 'left': '<U+2B80>', 'right': '<U+2B82>' },
        "\ 'subseparator': { 'left': '<U+2B81>', 'right': '<U+2B83>' }
        "\ 'separator': { 'left': "<U+2B80>", 'right': "<U+2B82>" },
        "\ 'subseparator': { 'left': "<U+2B81>", 'right': "<U+2B83>" }
        "\ 'separator': { 'left': '⮀', 'right': '⮂' },
        "\ 'subseparator': { 'left': '⮁', 'right': '⮃' }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  else
    return ''
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineWinform()
  return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction

" --------------------------------------------------------------
" NERDTree
" 参考：https://kamiya555.github.io/2015/10/14/nerdtree-command/

" Vimの起動時にファイルが指定されていない場合、NERDTreeを初期表示する
" Unite中心に使用するためコメントアウト
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ブックマークを初期表示する
let g:NERDTreeShowBookmarks=1

" 「Ctrl + n」でNERDTreeの表示を切り替える
noremap <C-n> :NERDTreeToggle<CR>

" --------------------------------------------------------------
" syntastic
" 参考：


" --------------------------------------------------------------
" neocomplete
" 参考：https://github.com/Shougo/neocomplete.vim
" 　　：http://blog.basyura.org/entry/20100622/p1
" 　　：http://pocke.hatenablog.com/entry/2014/08/10/104054

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" vimの起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcaseを使用する
let g:neocomplete#enable_smart_case = 1
" スニペットファイルの保存先
let g:neocomplete#snippets_dir='~/.vim/snippets'
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let $DOTVIM = $HOME.'/.vim'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'sql' : $DOTVIM.'/dicts/PPOSUserTableName.txt'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Enterキーで確定する
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" Macで改行するたびにIMEがOFFになるためコメントアウト
" WindowsでもEnterキーで確定できなくなる
" 参考：http://baqamore.hatenablog.com/entry/2014/12/28/023713
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" --------------------------------------------------------------
" vim-indent-guides
" 参考：http://www.mk-mode.com/octopress/2014/02/10/vim-installation-of-indent-plugin/

" vimの起動時にvim-indent-guidesを無効にする
" ∵鬱陶しいため
let g:indent_guides_enable_on_vim_startup=0
" 「Ctrl + i」でガイドの表示を切り替える
map <C-i> :IndentGuidesToggle<CR>
" ガイドの幅
let g:indent_guides_guide_size = 1

" --------------------------------------------------------------
" previm
" 参考：http://myenigma.hatenablog.com/entry/2015/12/29/181310
" ブラウザオープンコマンド
" open-browserを導入している場合は設定不要
"let g:previm_open_cmd = 'open -a firefox'

" 「Ctrl + p」でプレビューを表示する
nnoremap <C-p> :PrevimOpen<CR>

" --------------------------------------------------------------
" open-browser.vim
" 参考：http://hanagurotanuki.blogspot.jp/2015/03/windowsopen-browservimchrome.html
let g:netrw_nogx = 1
nnoremap gx (openbrowser-smart-search)
vnoremap gx (openbrowser-smart-search)

" Windowsの場合、ブラウザにChromeを指定する
if has('win32') || has('win64')
  let g:openbrowser_browser_commands = [
    \   {
    \     "name": "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
    \     "args": ["{browser}", "{uri}"]
    \   }
    \ ]
endif

" --------------------------------------------------------------
" evervim
" 参考：http://gk9187.hatenablog.com/entry/2014/12/08/175751
" 　　：http://yutorinote.com/evervim/
" 　　：http://kazy.hatenablog.com/entry/2012/12/03/174431
" 開発者トークン
" https://www.evernote.com/api/DeveloperToken.action から作成できる
let g:evervim_devtoken = "省略"

" evervim用キーバインド
nnoremap [evervim] <Nop>
nmap <Leader>e [evervim]
nnoremap [evervim]l :EvervimNotebookList<CR>
nnoremap [evervim]s :EvervimSearchByQuery<Space>
nnoremap [evervim]c :EvervimCreateNote<CR>
nnoremap [evervim]t :EvervimListTags<CR>

" --------------------------------------------------------------
" calendar.vim
" 参考：http://itchyny.hatenablog.com/entry/20140108/1389164688

" Googleカレンダーと連携する
let g:calendar_google_calendar = 1

" --------------------------------------------------------------
" vim-over
" 参考：http://qiita.com/syui/items/3a1af1301ee197b32a8a

" vim-over用キーバインド
nnoremap [vimover] :OverCommandLine<CR>
nmap <Leader>o [vimover]



