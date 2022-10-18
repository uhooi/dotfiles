-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
-- FIXME: Error
--telescope.load_extension('noice')

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', telescope_builtin.find_files)
vim.keymap.set('n', '<Leader>g', telescope_builtin.live_grep)
vim.keymap.set('n', '<Leader>b', telescope_builtin.buffers)
vim.keymap.set('n', '<Leader>h', telescope_builtin.help_tags)
vim.keymap.set('n', '<Leader>p', telescope_builtin.planets)
vim.keymap.set('n', '<Leader>n', '<Cmd>Noice telescope<CR>')
