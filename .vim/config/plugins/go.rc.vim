" 参考：https://qiita.com/gorilla0513/items/a027885d03af0d6d5863

"let g:go_list_type = "locationlist"
"let g:go_list_type_commands = {"GoInstall": "quickfix", "GoBuild": "quickfix", "GoTest": "quickfix"}
"let g:go_list_autoclose = 1
"let g:go_list_height = 10

"let g:go_fmt_command = "goimports" " ファイル保存時にインポート文を自動挿入する
"let g:go_metalinter_autosave = 1 " ファイル保存時に構文チェックする
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

let g:go_term_mode = 'split' " GoRunやGoTest時に画面を上下に分割する

" ハイライト
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" キーマップ
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>m <Plug>(go-imports)
au FileType go nmap <leader>s <Plug>(go-def-split)
au FileType go nmap <leader>v <Plug>(go-def-vertical)
"au FileType go nmap <leader>gi <Plug>(go-info)
"au FileType go nmap <leader>gd <Plug>(go-doc)
"au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>i <Plug>(go-install)
"au FileType go nmap <leader>dt <Plug>(go-def-tab)
"au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>e <Plug>(go-iferr)
"au FileType go nmap <silent> <leader>at :GoAddTags<CR>
"au FileType go nmap <silent> <leader>fs :GoFillStruct<CR>
"au FileType go nmap <silent> <leader>ki :GoKeyify<CR>
"au FileType go nmap <silent> <leader>dd :GoDeclsDir<CR>
"au FileType go nmap <silent> <leader>ip :GoImpl<CR>

