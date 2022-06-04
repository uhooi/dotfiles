" ref: http://itchyny.hatenablog.com/entry/20130828/1377653592
"    : http://itchyny.hatenablog.com/entry/20130917/1379369171
"    : https://github.com/itchyny/lightline.vim
"    : http://altarf.net/computer/%E6%8A%80%E8%A1%93%E7%9A%84%E3%81%AA%E3%83%9D%E3%82%A8%E3%83%A0/3244
"    : http://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
"    : http://qiita.com/osamunmun/items/6fcabd8dff0d5fded559
"    : http://note103.hateblo.jp/entry/2016/03/16/172327
"    : https://github.com/maximbaz/lightline-ale

let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'compatible'
"set t_Co=256
let g:lightline = {
\  'colorscheme': 'wombat',
\  'mode_map': {'c': 'NORMAL'},
\  'active': {
\    'left': [
\      [ 'mode', 'paste' ],
\      [ 'fugitive', 'filename', 'ale' ]
\    ],
\    'right': [
\      [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\      [ 'syntastic', 'lineinfo' ],
\      [ 'percent' ],
\      [ 'fileformat', 'fileencoding', 'filetype', 'winform' ]
\    ]
\  },
\  'component_function': {
\    'modified': 'LightLineModified',
\    'readonly': 'LightLineReadonly',
\    'fugitive': 'LightLineFugitive',
\    'filename': 'LightLineFilename',
\    'fileformat': 'LightLineFileformat',
\    'filetype': 'LightLineFiletype',
\    'fileencoding': 'LightLineFileencoding',
\    'mode': 'LightLineMode',
\    'winform' : 'LightLineWinform',
\  },
\  'component_expand': {
\    'linter_checking': 'lightline#ale#checking',
\    'linter_warnings': 'lightline#ale#warnings',
\    'linter_errors': 'lightline#ale#errors',
\    'linter_ok': 'lightline#ale#ok'
\  },
\  'component_type': {
\    'linter_checking': 'left',
\    'linter_warnings': 'warning',
\    'linter_errors': 'error',
\    'linter_ok': 'left',
\  },
\  'separator': { 'left': '', 'right': '' },
\  'subseparator': { 'left': '|', 'right': '|' }
\}

" セパレート候補
" 今のところどれもうまくいかない
"\  'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"\  'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
"\  'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"\  'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"\  'separator': { 'left': '<U+2B80>', 'right': '<U+2B82>' },
"\  'subseparator': { 'left': '<U+2B81>', 'right': '<U+2B83>' }
"\  'separator': { 'left': "<U+2B80>", 'right': "<U+2B82>" },
"\  'subseparator': { 'left': "<U+2B81>", 'right': "<U+2B83>" }
"\  'separator': { 'left': '⮀', 'right': '⮂' },
"\  'subseparator': { 'left': '⮁', 'right': '⮃' }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  else
    return ''
  endif
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

