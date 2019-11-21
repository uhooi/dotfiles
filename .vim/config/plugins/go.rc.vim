" 参考：https://qiita.com/gorilla0513/items/a027885d03af0d6d5863
" 　　：https://qiita.com/tobita0000/items/22d314515f009e721740

"let g:go_list_type = "locationlist"
"let g:go_list_type_commands = {"GoInstall": "quickfix", "GoBuild": "quickfix", "GoTest": "quickfix"}
"let g:go_list_autoclose = 1
"let g:go_list_height = 10

let g:go_fmt_command = "goimports"

let g:go_fmt_autosave = 0 " ファイル保存時にフォーマットする
let g:go_metalinter_autosave = 1 " ファイル保存時にリントする
let g:go_metalinter_autosave_enabled = ['vet', 'golint'] " ファイル保存時に有効にするリント
let g:go_metalinter_deadline = "5s" " リントの最大待ち時間

let g:go_term_mode = 'split' " GoRunやGoTest時に画面を上下に分割する

" LSPに任せる機能をOFFにする
"let g:go_def_mapping_enabled = 0
"let g:go_doc_keywordprg_enabled = 0

" ハイライト
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" キーマップ
au FileType go nmap <space>r <Plug>(go-run)
au FileType go nmap <space>b <Plug>(go-build)
au FileType go nmap <space>t <Plug>(go-test)
au FileType go nmap <space>c <Plug>(go-coverage)
au FileType go nmap <space>m <Plug>(go-imports)
au FileType go nmap <space>s <Plug>(go-def-split)
au FileType go nmap <space>v <Plug>(go-def-vertical)
"au FileType go nmap <space>gi <Plug>(go-info)
"au FileType go nmap <space>gd <Plug>(go-doc)
"au FileType go nmap <space>gv <Plug>(go-doc-vertical)
au FileType go nmap <space>i <Plug>(go-install)
"au FileType go nmap <space>dt <Plug>(go-def-tab)
"au FileType go nmap <space>e <Plug>(go-rename)
au FileType go nmap <space>e <Plug>(go-iferr)
au FileType go nmap <silent> <space>f :GoFmt<CR>
"au FileType go nmap <silent> <space>at :GoAddTags<CR>
"au FileType go nmap <silent> <space>fs :GoFillStruct<CR>
"au FileType go nmap <silent> <space>ki :GoKeyify<CR>
"au FileType go nmap <silent> <space>dd :GoDeclsDir<CR>
"au FileType go nmap <silent> <space>ip :GoImpl<CR>

