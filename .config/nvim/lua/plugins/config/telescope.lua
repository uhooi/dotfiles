-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

require('telescope').load_extension('fzf')

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', telescope_builtin.find_files, { noremap = true })
vim.keymap.set('n', '<Leader>fg', telescope_builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<Leader>fb', telescope_builtin.buffers, { noremap = true })
vim.keymap.set('n', '<Leader>fh', telescope_builtin.help_tags, { noremap = true })
vim.keymap.set('n', '<Leader>fp', telescope_builtin.planets, { noremap = true })
