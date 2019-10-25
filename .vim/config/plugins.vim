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
call dein#add('Shougo/neocomplete.vim')          " 入力補完→asyncomplete.vimに移行する予定
call dein#add('itchyny/lightline.vim')           " ステータスライン拡張
call dein#add('maximbaz/lightline-ale')          " lightlineにALEのアイコンを表示する
call dein#add('itchyny/calendar.vim')            " Googleカレンダー連携
"call dein#add('itchyny/vim-highlighturl')        " URLのハイライト→色が濃いためコメントアウト
"call dein#add('itchyny/vim-parenmatch')          " 対応する括弧をハイライトする(デフォルトより8倍高速)
"call dein#add('itchyny/vim-cursorword')          " カーソル上の単語に下線を引く
call dein#add('scrooloose/nerdtree')             " ツリーエクスプローラー
"call dein#add('scrooloose/syntastic')            " 構文チェッカー→ALEを使うためコメントアウト
call dein#add('nathanaelkane/vim-indent-guides') " インデント可視化
"call dein#add('koron/minimap-vim')               " ミニマップ→Rictyだときれいに表示されないためコメントアウト
"call dein#add('severin-lemaignan/vim-minimap')   " ミニマップ→なぜか表示されないためコメントアウト
call dein#add('kannokanno/previm')               " マークダウンプレビュー
call dein#add('tyru/open-browser.vim')           " ブラウザ連携
"call dein#add('kakkyz81/evervim')                " Evernote連携(Python2.7とmarkdownパッケージが必要)
call dein#add('tpope/vim-fugitive')              " Git連携
"call dein#add('thinca/vim-quickrun')            " 
"call dein#add('easymotion/vim-easymotion')       " キャレット移動補助
call dein#add('dense-analysis/ale')              " 非同期校正
call dein#add('tokorom/ale-prh-review')          " Re:VIEWの非同期校正
call dein#add('SirVer/ultisnips')                " スニペット
"call dein#add('prabirshrestha/asyncomplete.vim') " 入力補完→Vim 8以上でないと使えないので一旦コメントアウト
call dein#add('machakann/vim-sandwich')          " 括弧入力補助
call dein#add('thinca/vim-themis')               " Vimスクリプトのテストフレームワーク

" シンタックスハイライト
call dein#add('osyo-manga/vim-over')             " 置換対象文字列ハイライト
call dein#add('kylef/apiblueprint.vim')          " API Blueprintのシンタックスハイライトとバリデーション
call dein#add('aklt/plantuml-syntax')            " PlantUMLのシンタックスハイライト
call dein#add('mechatroner/rainbow_csv')         " CSVのシンタックスハイライト
call dein#add('keith/swift.vim')                 " Swiftのシンタックスハイライト
call dein#add('tokorom/vim-review')              " Re:VIEWのシンタックスハイライト

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

" プラグインを削除する場合にコメントインする
" 参考：http://katsumeshix.hatenablog.jp/entry/2017/10/16/103709
"call map(dein#check_clean(), "delete(v:val, 'rf')")

filetype plugin indent on

" 各プラグインの設定ファイルを読み込む
source ~/.vim/config/plugins/unite.vim
source ~/.vim/config/plugins/lightline.vim
source ~/.vim/config/plugins/nerdtree.vim
source ~/.vim/config/plugins/neocomplete.vim
source ~/.vim/config/plugins/vimindentguides.vim
source ~/.vim/config/plugins/previm.vim
source ~/.vim/config/plugins/openbrowser.vim
source ~/.vim/config/plugins/evervim.vim
source ~/.vim/config/plugins/calendar.vim
source ~/.vim/config/plugins/vimover.vim
source ~/.vim/config/plugins/vimreview.vim
source ~/.vim/config/plugins/ale.vim
source ~/.vim/config/plugins/lightlineale.vim
source ~/.vim/config/plugins/ultisnips.vim
source ~/.vim/config/plugins/vimsandwich.vim

" doxygenのフォーマットを有効にする
" ∵C#のシンタックスハイライトをきれいに表示したいため
" 参考：http://vim-jp.org/vimdoc-ja/syntax.html
:let g:load_doxygen_syntax = 1

