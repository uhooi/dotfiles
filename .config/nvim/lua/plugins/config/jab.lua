local jab = require('jab')

-- Keymaps
vim.keymap.set({ 'n', 'x', 'o' }, 'f', jab.f, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'F', jab.F, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 't', jab.t, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'T', jab.T, { expr = true })
