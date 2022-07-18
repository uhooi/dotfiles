call ddu#custom#patch_global({
\  'ui': 'filer',
\  'actionOptions': {
\    'narrow': {
\      'quit': v:false,
\    },
\  },
\  'sources': [{'name': 'file', 'params': {}}],
\  'sourceOptions': {
\    '_': {
\      'columns': ['filename'],
\    },
\  },
\  'kindOptions': {
\    'file': {
\      'defaultAction': 'open',
\    },
\  }
\})

nnoremap <buffer> >
\ <Cmd>call ddu#ui#filer#do_action('updateOptions', {
\   'sourceOptions': {
\     '_': {
\       'matchers': ToggleHidden(),
\     },
\   },
\ })<CR>

function! ToggleHidden()
  let current = ddu#custom#get_current(b:ddu_ui_name)
  let source_options = get(current, 'sourceOptions', {})
  let source_options_all = get(source_options, '_', {})
  let matchers = get(source_options_all, 'matchers', [])
  return empty(matchers) ? ['matcher_hidden'] : []
endfunction

" Mappings
autocmd FileType ddu-filer call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#filer#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#filer#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> o
        \ <Cmd>call ddu#ui#filer#do_action('expandItem',
        \ {'mode': 'toggle'})<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
endfunction
