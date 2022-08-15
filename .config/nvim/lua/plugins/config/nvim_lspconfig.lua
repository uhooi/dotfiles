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

-- ref: https://neovim.io/doc/user/lsp.html
--    : https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/lspconfig.txt#L444-L476
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
local opts = { noremap = true }
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist, opts)
