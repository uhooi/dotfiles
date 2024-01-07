require('textcase').setup {
  prefix = 'cr',
}

vim.keymap.set({ 'n', 'v' }, 'cr.', '<Cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
