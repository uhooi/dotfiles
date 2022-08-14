call ddc#custom#patch_global('sources',
\  ['around', 'file', 'vim-lsp']
\)
call ddc#custom#patch_global('cmdlineSources',
\  ['cmdline-history', 'input', 'file', 'vim-lsp', 'around']
\)

call ddc#custom#patch_global('sourceOptions', {
\  '_': {
\    'ignoreCase': v:true,
\    'matchers': ['matcher_head'],
\    'sorters': ['sorter_rank'],
\  },
\  'around': {
\    'mark': 'A',
\  },
\  'file': {
\    'mark': 'F',
\    'isVolatile': v:true,
\    'forceCompletionPattern': '\S/\S*',
\  },
\  'cmdline-history': {
\    'mark': 'history',
\    'sorters': [],
\  },
\  'input': {
\    'mark': 'input',
\    'isVolatile': v:true,
\    'forceCompletionPattern': '\S/\S*',
\  },
\  'vim-lsp': {
\    'mark': 'lsp',
\  },
\})

" Use pum.vim
call ddc#custom#patch_global('autoCompleteEvents', [
\  'InsertEnter', 'TextChangedI', 'TextChangedP',
\  'CmdlineEnter', 'CmdlineChanged',
\])
call ddc#custom#patch_global('completionMenu', 'pum.vim')

" Mappings
" For insert mode completion
inoremap <silent><expr> <Tab>
\  pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
\  (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\  '<Tab>' : ddc#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n> <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
inoremap <C-e> <Cmd>call pum#map#cancel()<CR>
inoremap <silent><expr> <C-l> ddc#map#extend()
inoremap <silent><expr> <C-x><C-f> ddc#manual_complete('path')

" For command line mode completion
cnoremap <expr> <Tab>
\  pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
\  exists('b:ddc_cmdline_completion') ?
\  ddc#manual_complete() : nr2char(&wildcharm)
cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
cnoremap <C-c> <Cmd>call pum#map#cancel()<CR>
cnoremap <C-o> <Cmd>call pum#map#confirm()<CR>

nnoremap : <Cmd>call CommandlinePre(':')<CR>:
nnoremap ? <Cmd>call CommandlinePre('/')<CR>?
function! CommandlinePre(mode) abort
  " Note: It disables default command line completion!
  set wildchar=<C-t>
  set wildcharm=<C-t>
  cnoremap <expr><buffer> <Tab>
\    pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
\    exists('b:ddc_cmdline_completion') ? ddc#manual_complete() : "\<C-t>"
  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  if a:mode ==# ':'
    call ddc#custom#patch_buffer('cmdlineSources',
\      ['cmdline-history', 'cmdline', 'around'])
    call ddc#custom#patch_buffer('keywordPattern', '[0-9a-zA-Z_:#]*')
  else
    call ddc#custom#patch_buffer('cmdlineSources',
\      ['around', 'line'])
  endif
  autocmd MyAutoCmd User DDCCmdlineLeave ++once call CommandlinePost()
  autocmd MyAutoCmd InsertEnter <buffer> ++once call CommandlinePost()
  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  silent! cunmap <buffer> <Tab>
  " Restore sources
  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
  set wildcharm=<Tab>
endfunction

call ddc#enable()
