-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>ff', '<Cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fg', '<Cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fb', '<Cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fh', '<Cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>pp', '<Cmd>lua require("telescope.builtin").planets()<CR>', { noremap = true })

