" 参考：https://github.com/lighttiger2505/.dotfiles/blob/master/.vim/rc/plugins/deoplete.rc.vim
" 　　：https://github.com/zchee/.nvim/blob/master/init.vim
" 　　：https://sinshutu-kibotu.hatenablog.jp/entry/2017/01/27/062757

" Prams of deoplete
let g:deoplete#enable_at_startup = 1

let s:default_ignore_sources = ['around', 'dictionary', 'member', 'omni', 'tag', 'ale', 'LanguageClient']
call deoplete#custom#option({
  \ 'auto_complete': v:true,
  \ 'auto_complete_delay': 0,
  \ 'auto_refresh_delay': 20,
  \ 'refresh_always': v:true,
  \ 'smart_case': v:true,
  \ 'camel_case': v:true,
  \ 'ignore_case': v:true,
  \ 'min_pattern_length': 1,
  \ 'max_list': 10000,
  \ 'check_stderr': v:true,
  \ 'num_processes': 0,
  \ 'on_insert_enter': v:true,
  \ 'on_text_changed_i': v:true,
  \ 'prev_completion_mode': 'filter',
  \ 'skip_chars': [],
  \ 'skip_multibyte': v:false,
  \ })

call deoplete#custom#source('_', 'converters', ['converter_auto_paren', 'converter_remove_overlap'])
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])  " 'matcher_fruzzy', 'matcher_fuzzy', 'matcher_length'
call deoplete#custom#source('_', 'sorters', ['sorter_word'])

call deoplete#custom#source('buffer', 'rank', 200)

call deoplete#custom#source('go', 'matchers', ['matcher_passthrough'])
call deoplete#custom#source('go', 'sorters', ['sorter_passthrough'])
call deoplete#custom#source('go', 'rank', 500)

call deoplete#custom#source('LanguageClientInternal', 'converters', ['converter_auto_paren_lsp', 'converter_auto_paren', 'converter_remove_overlap'])
call deoplete#custom#source('LanguageClientInternal', 'matchers', ['matcher_passthrough'])  " 'matcher_cpsm'
call deoplete#custom#source('LanguageClientInternal', 'sorters', ['sorter_passthrough'])  " 'sorter_word'
Gautocmdft json,yaml call deoplete#custom#source('LanguageClientInternal', 'min_pattern_length', 0)

call deoplete#custom#source('asm', 'matchers', ['matcher_passthrough'])
call deoplete#custom#source('asm', 'sorters', ['sorter_passthrough'])
call deoplete#custom#source('asm', 'rank', 1000)

call deoplete#custom#source('neosnippet', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('neosnippet', 'rank', 200)

" call deoplete#custom#source('zsh', 'refresh_always', v:true)

" source
" go
let g:deoplete#sources#go#gocode_binary = g:gopath.'/bin/gocode'
let g:deoplete#sources#go#gocode_sock = 'unix'
let g:deoplete#sources#go#auto_goos = 1
let g:deoplete#sources#go#pointer = 0
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#cgo_only = 1
let g:deoplete#sources#go#cgo#libclang_path = s:llvm_path . '/lib/libclang.dylib'
let g:deoplete#sources#go#cgo#sort_algo = 'priority'  " 'priority', 'alphabetical'
let s:clang_flags = [
      \ '-I/usr/local/include',
      \ '-I' . s:llvm_path . '/lib/clang/' . s:llvm_clang_version . '/include',
      \ '-I/usr/include',
      \ '-F/System/Library/Frameworks',
      \ '-F/Library/Frameworks',
      \ '-isysroot/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk',
      \ ]  " clang++ -v -E -x c++ - -v < /dev/null
      "\ '-I' . s:llvm_path . '/include/c++/v1',
let g:deoplete#sources#go#cgo#flags = s:clang_flags
"" clang
let g:deoplete#sources#clang#clang_header = s:llvm_path . '/lib/clang'
let g:deoplete#sources#clang#libclang_path = s:llvm_path . '/lib/libclang.dylib'
let g:deoplete#sources#clang#flags = s:clang_flags
"" jedi
let g:deoplete#sources#jedi#statement_length = 0
let g:deoplete#sources#jedi#short_types = 0
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#ignore_errors = 1
let g:deoplete#sources#jedi#extra_path = []
let g:deoplete#sources#jedi#python_path = g:python3_host_prog
" asm
let g:deoplete#sources#asm#go_mode = 1
" neopairs
let g:neopairs#enable = 1
" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#events = ['CompleteDone']  " default
let g:echodoc#type = 'virtual'  " echo, signature, virtual, floating
let g:echodoc#highlight_identifier = 'Identifier'  " default
let g:echodoc#highlight_arguments = 'Special'  " default
let g:echodoc#highlight_trailing = 'Type'  " default
" neosnippet
let g:neosnippet#data_directory = $XDG_CACHE_HOME . '/nvim/neosnippet'
let g:neosnippet#disable_runtime_snippets = {}
let g:neosnippet#disable_select_mode_mappings = 0
let g:neosnippet#enable_auto_clear_markers = 1
let g:neosnippet#enable_complete_done = 0
let g:neosnippet#enable_completed_snippet = 0
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#snippets_directory = $XDG_CONFIG_HOME . '/nvim/neosnippets'
let g:neosnippet_username = 'zchee'
let g:neosnippet_author = 'Koichi Shiraishi'

" key mappings
inoremap <expr><C-h> deoplete#smart_close_popup()."<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"

call deoplete#custom#source('ghc', 'sorters', ['sorter_word'])

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Hidden autocomplete preview
"set completeopt-=preview

