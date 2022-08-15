--FIXME: Not work
-- ref: https://www.reddit.com/r/neovim/comments/oiyq17/lsp_diagnostic_icons_in_gutter/
--    : https://github.com/LunarVim/LunarVim/blob/359b6fd8e44bc2ad5088aada3f9c037fb85b19af/lua/lsp/init.lua#L2-L17
vim.fn.sign_define(
  'LspDiagnosticsSignError',
  { text = '', texthl = 'LspDiagnosticsSignError', numhl = 'LspDiagnosticsSignError' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignWarning',
  { text = '', texthl = 'LspDiagnosticsSignWarning', numhl = 'LspDiagnosticsSignWarning' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignHint',
  { text = '', texthl = 'LspDiagnosticsSignHint', numhl = 'LspDiagnosticsSignHint' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignInformation',
  { text = '', texthl = 'LspDiagnosticsSignInformation', numhl = 'LspDiagnosticsSignInformation' }
)

-- ref: https://zenn.dev/botamotch/articles/21073d78bc68bf
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true})
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true})
vim.keymap.set('n', 'gf', '<Cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true})
vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true})
vim.keymap.set('n', 'gn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true})
vim.keymap.set('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true})
vim.keymap.set('n', 'g]', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')

