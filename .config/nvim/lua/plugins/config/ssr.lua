local ssr = require('ssr')

ssr.setup {
  keymaps = {
    close = '<Esc>',
  },
}

vim.keymap.set({ 'n', 'x' }, '<Leader>sr', ssr.open)
