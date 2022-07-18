call ddc#custom#patch_global('sources', ['around', 'nextword', 'vim-lsp'])

call ddc#custom#patch_global('sourceOptions', {
\  '_': {
\    'matchers': ['matcher_head'],
\    'sorters': ['sorter_rank'],
\  },
\  'around': {
\    'mark': 'A',
\  },
\  'nextword': {
\    'mark': 'nextword',
\  },
\  'vim-lsp': {
\    'mark': 'lsp',
\  },
\})

" Mappings
" <TAB>: completion.
inoremap <silent><expr> <TAB>
\  ddc#map#pum_visible() ? '<C-n>' :
\  (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\  '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

call ddc#enable()
