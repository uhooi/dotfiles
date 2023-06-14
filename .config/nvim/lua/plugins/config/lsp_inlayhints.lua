require('lsp-inlayhints').setup()

vim.keymap.set('n', '<Leader>i', require('lsp-inlayhints').toggle)
