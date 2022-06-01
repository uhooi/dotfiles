" ALE(Asynchronous Lint Engine)

" ref: http://www.tokoro.me/posts/vim-review/
"    : https://github.com/tokorom/dotfiles/blob/master/.vim/plugins.vim
"    : https://wonderwall.hatenablog.com/entry/2017/03/01/223934
"    : https://github.com/dense-analysis/ale/issues/2065
"    : https://github.com/lighttiger2505/.dotfiles/blob/master/.vim/rc/plugins/ale.rc.vim

let g:ale_lint_on_save = 1 " 保存時にチェックする
let g:ale_lint_on_text_changed = 'never' " 変更時にチェックしない
let g:ale_lint_on_enter = 0 " ファイルオープン時にチェックしない
let g:ale_open_list = 1 " エラー時にリストを自動で開く
" ロケーションリストの代わりにQuickFixを使う
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters_explicit = 1 " `ale_linters` で指定したlintのみ実行する

let g:ale_fix_on_save = 1 " 保存時に自動修正する

"let g:ale_sign_column_always = 0 " シンボルカラムを警告時のみ表示する(デフォルト)
"let g:ale_sign_error = '>>' " エラー時のシンボル(デフォルト)
"let g:ale_sign_warning = '--' " 警告時のシンボル(デフォルト)

let g:ale_linters = {
\   'javascript': ['jslint', 'eslint'],
\   'markdown': ['mdl'],
\   'make': ['checkmake'],
\   'vim': ['vint'],
\   'shell': ['shellcheck'],
\   'swift': ['swiftlint', 'swiftsyntaxcheck'],
\   'review': ['redpen', 'prhreview'],
\   'json': ['jq'],
\}

let g:ale_fixers = {
\   'review': ['redpen', 'prhreview'],
\   'tex': ['latexindent'],
\}

