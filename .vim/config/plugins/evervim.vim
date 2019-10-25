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

