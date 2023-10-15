local ssr = require('ssr')

ssr.setup()

vim.keymap.set({ 'n', 'x' }, '<Leader>sr', ssr.open)
