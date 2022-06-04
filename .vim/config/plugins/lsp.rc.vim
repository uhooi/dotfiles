# ref: https://mattn.kaoriya.net/software/vim/20191231213507.htm
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

# ref: https://github.com/mattn/vim-lsp-icons/blob/409a0008d017a412166dbede92ca85f53b6903e2/plugin/lsp-icons.vim
let g:lsp_diagnostics_signs_enabled          = 1
let g:lsp_diagnostics_signs_error            = {'text': '✗'}
let g:lsp_diagnostics_signs_warning          = {'text': '‼'}
let g:lsp_diagnostics_signs_information      = {'text': 'i'}
let g:lsp_diagnostics_signs_hint             = {'text': '?'}
let g:lsp_document_code_action_signs_enabled = 1
let g:lsp_document_code_action_signs_hint    = {'text': '?'}

# ref: https://blog.ottijp.com/2021/01/10/sourcekit-lsp/
let g:lsp_settings = {
\  'sourcekit-lsp': {'cmd': ['xcrun', 'sourcekit-lsp']}
\}

