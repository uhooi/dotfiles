" dein
" 参考：https://github.com/Shougo/dein.vim
" 　　：http://post.simplie.jp/posts/55
" 　　：http://qiita.com/yoza/items/2f8bd33a18225754f346

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

if has('vim_starting')
  " ランタイムパスにプラグインの格納パスを追加
  set runtimepath+=s:dein_dir/repos/github.com/Shougo/dein.vim/
endif

if !dein#load_state(s:dein_dir)
  finish
endif

call dein#begin(s:dein_dir)

call dein#load_toml('~/.vim/config/dein.toml', {'lazy': 0})
call dein#load_toml('~/.vim/config/dein_lazy.toml', {'lazy': 1})

" 導入するプラグイン一覧
call dein#add('nathanaelkane/vim-indent-guides') " インデント可視化
call dein#add('kannokanno/previm')               " マークダウンプレビュー
call dein#add('tyru/open-browser.vim')           " ブラウザ連携
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

call dein#end()
call dein#save_state()

" プラグインの更新確認を聞く
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" プラグインを削除する場合にコメントインする
" 参考：http://katsumeshix.hatenablog.jp/entry/2017/10/16/103709
"call map(dein#check_clean(), "delete(v:val, 'rf')")

" 各プラグインの設定ファイルを読み込む
source ~/.vim/config/plugins/vimindentguides.rc.vim
source ~/.vim/config/plugins/previm.rc.vim
source ~/.vim/config/plugins/openbrowser.rc.vim
source ~/.vim/config/plugins/vimover.rc.vim
source ~/.vim/config/plugins/vimreview.rc.vim
source ~/.vim/config/plugins/ale.rc.vim
source ~/.vim/config/plugins/ultisnips.rc.vim
source ~/.vim/config/plugins/vimsandwich.rc.vim

" doxygenのフォーマットを有効にする
" ∵C#のシンタックスハイライトをきれいに表示したいため
" 参考：http://vim-jp.org/vimdoc-ja/syntax.html
:let g:load_doxygen_syntax = 1

