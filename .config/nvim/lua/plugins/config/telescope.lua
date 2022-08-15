-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', telescope_builtin.find_files, { noremap = true })
vim.keymap.set('n', '<Leader>g', telescope_builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<Leader>b', telescope_builtin.buffers, { noremap = true })
vim.keymap.set('n', '<Leader>h', telescope_builtin.help_tags, { noremap = true })
vim.keymap.set('n', '<Leader>p', telescope_builtin.planets, { noremap = true })
