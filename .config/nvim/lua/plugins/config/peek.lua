local peek = require('peek')

peek.setup {
  theme = 'light',
}

vim.keymap.set('n', '<C-p>', peek.open)

vim.api.nvim_create_user_command('PeekOpen', peek.open, {})
vim.api.nvim_create_user_command('PeekClose', peek.close, {})
