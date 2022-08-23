-- ref: https://github.com/neovim/neovim/commit/a5bbb932f9094098bd656d3f6be3c58344576709
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' }
)
vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' }
)
vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' }
)
vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' }
)

-- ref: https://neovim.io/doc/user/lsp.html
--    : https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/lspconfig.txt#L444-L476
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)
