" dein
" 参考：https://github.com/Shougo/dein.vim
" 　　：http://post.simplie.jp/posts/55
" 　　：http://qiita.com/yoza/items/2f8bd33a18225754f346

let s:dein_dir = expand('~/.cache/dein')

if has('vim_starting')
  " ランタイムパスにプラグインの格納パスを追加
  " TODO: `s:dein_dir` を使って書く方法がわからない
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim/
endif

if !dein#load_state(s:dein_dir)
  finish
endif

call dein#begin(s:dein_dir)

let s:config_dir = expand('~/.vim/config')
call dein#load_toml(s:config_dir . '/dein.toml', {'lazy': 0})
call dein#load_toml(s:config_dir . '/dein_colorscheme.toml', {'lazy': 0})
call dein#load_toml(s:config_dir . '/dein_lazy.toml', {'lazy': 1})
call dein#load_toml(s:config_dir . '/dein_syntax.toml', {'lazy': 1})
call dein#load_toml(s:config_dir . '/dein_complete.toml', {'lazy': 1})
call dein#load_toml(s:config_dir . '/dein_lsp.toml', {'lazy': 1})
call dein#load_toml(s:config_dir . '/dein_go.toml', {'lazy': 1})

call dein#end()
call dein#save_state()

" プラグインの更新確認を聞く
if dein#check_install()
  call dein#install()
endif

" プラグインを削除する場合にコメントインする
" 参考：http://katsumeshix.hatenablog.jp/entry/2017/10/16/103709
"call map(dein#check_clean(), "delete(v:val, 'rf')")

