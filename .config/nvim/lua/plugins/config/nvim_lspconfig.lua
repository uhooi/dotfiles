-- Language servers not managed by mason-lspconfig
local lspconfig = require('lspconfig')
lspconfig.sourcekit.setup {}

-- ref: https://github.com/neovim/neovim/commit/a5bbb932f9094098bd656d3f6be3c58344576709
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' }
)
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignHint', { text = '󰌶', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })

-- ref: https://neovim.io/doc/user/lsp.html
--    : https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/lspconfig.txt#L444-L476
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local bufopts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', 'gwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
  end,
})
