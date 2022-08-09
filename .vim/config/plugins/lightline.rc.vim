" ref: https://itchyny.hatenablog.com/entry/20130824/1377351527
"    : https://itchyny.hatenablog.com/entry/20130828/1377653592
"    : https://itchyny.hatenablog.com/entry/20130917/1379369171
"    : https://itchyny.hatenablog.com/entry/20130918/1379461406
"    : https://github.com/itchyny/lightline.vim
"    : http://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
"    : http://qiita.com/osamunmun/items/6fcabd8dff0d5fded559
"    : http://note103.hateblo.jp/entry/2016/03/16/172327
"    : https://thinca.hatenablog.com/entry/20111204/1322932585
"    : https://qiita.com/t-mochizuki/items/15f4a8d8f52d620cdc05
"    : https://github.com/prabirshrestha/vim-lsp/pull/783
"    : https://kitagry.github.io/blog/programmings/2020/08/lightline-vim-lsp/
"    : https://qiita.com/Chemi-F/items/2190c0c02803655c2379
"    : https://github.com/prabirshrestha/vim-lsp/blob/68c018eb1a79e0bbeb496f7040f7205b57cf3750/doc/vim-lsp.txt#L1451-L1456

set laststatus=2
set noshowmode
set showtabline=2

if !has('gui_running')
  set t_Co=256
endif

let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'compatible'
let g:lightline = {
\  'colorscheme': 'wombat',
\  'mode_map': {'c': 'NORMAL'},
\  'active': {
\    'left': [
\      [ 'mode', 'paste' ],
\      [ 'gitbranch' ],
\      [ 'lsp_errors', 'lsp_warnings', 'lsp_ok' ]
\    ],
\    'right': [
\      [ 'lineinfo' ],
\      [ 'percent' ],
\      [ 'fileformat', 'fileencoding', 'filetype', 'winform' ]
\    ]
\  },
\  'component_function': {
\    'modified': 'LightLineModified',
\    'readonly': 'LightLineReadonly',
\    'gitbranch': 'gin#component#branch#unicode',
\    'filename': 'LightLineFilename',
\    'fileformat': 'LightLineFileformat',
\    'filetype': 'LightLineFiletype',
\    'fileencoding': 'LightLineFileencoding',
\    'mode': 'LightLineMode',
\    'winform' : 'LightLineWinform',
\    'cwd': 'LightLineCwd',
\  },
\  'component_expand': {
\    'lsp_errors': 'LightLineLSPErrors',
\    'lsp_warnings': 'LightLineLSPWarnings',
\    'lsp_ok': 'LightLineLSPOk',
\  },
\  'component_type': {
\    'lsp_errors': 'error',
\    'lsp_warnings': 'warning',
\    'lsp_ok': 'middle',
\  },
\  'separator': { 'left': '', 'right': '' },
\  'subseparator': { 'left': '|', 'right': '|' }
\}

let g:lightline.tabline = {
\  'left': [
\    [ 'tabs' ]
\  ],
\  'right': [
\    [ 'close' ],
\    [ 'cwd' ]
\  ],
\}

let g:lightline.tab = {
\  'active': [ 'tabnum', 'filepath', 'modified' ],
\  'inactive': [ 'tabnum', 'filepath', 'modified' ]
\}

let g:lightline.tab_component_function = {
\ 'filepath': 'LightLineFilepath'
\}

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
\    (&ft == 'vimfiler' ? vimfiler#get_status_string() :
\     &ft == 'unite' ? unite#get_status_string() :
\     &ft == 'vimshell' ? vimshell#get_status_string() :
\    '' != expand('%:t') ? expand('%:t') : '[No Name]') .
\    ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineWinform()
  return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction

function! LightLineCwd()
  return winwidth(0) > 50 ? fnamemodify(getcwd(), ":~") : ''
endfunction

function! LightLineFilepath(n) abort
  let bufnrs = tabpagebuflist(a:n)
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]
  let _ = pathshorten(bufname(curbufnr))
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! LightlineLSPErrors() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.error == 0 ? '' : printf('✗%d', l:counts.error)
endfunction

function! LightlineLSPWarnings() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.warning == 0 ? '' : printf('‼%d', l:counts.warning)
endfunction

function! LightlineLSPOk() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  let l:total = l:counts.error + l:counts.warning
  return l:total == 0 ? '☑' : ''
endfunction

augroup LightLineOnLSP
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END

