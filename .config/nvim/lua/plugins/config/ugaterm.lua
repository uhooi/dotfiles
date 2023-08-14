-- ref: https://zenn.dev/uga_rosa/articles/76fc0848b4233d
--    : https://github.com/uga-rosa/dotfiles/blob/8b112e123d9b03e20e9b193751a068432f8e0c44/nvim/rc/plugins.toml#L54-L60
require('ugaterm').setup {}

vim.keymap.set({ 'n', 't' }, '<Leader>t', '<Cmd>UgatermOpen -toggle<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
