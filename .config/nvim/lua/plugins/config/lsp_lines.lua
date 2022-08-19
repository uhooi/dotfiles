local lsp_lines = require('lsp_lines')

lsp_lines.setup()

vim.diagnostic.config {
  virtual_text = false,
}

vim.keymap.set('n', '<Leader>l', lsp_lines.toggle, { desc = 'Toggle lsp_lines' })
