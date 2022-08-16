local fterm = require('FTerm')

fterm.setup {
  border = 'rounded',
}

vim.keymap.set({ 'n', 't' }, '<Leader>t', fterm.toggle, { noremap = true })

vim.api.nvim_create_user_command('FTermOpen', fterm.open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', fterm.close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', fterm.exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, { bang = true })
