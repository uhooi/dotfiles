-- ref: https://github.com/nvim-tree/nvim-tree.lua/blob/48d53a5934fbd51b655d03db7dad35551838f2c9/README.md#setup
--    : https://github.com/nvim-tree/nvim-tree.lua/blob/48d53a5934fbd51b655d03db7dad35551838f2c9/doc/nvim-tree-lua.txt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>')

require('nvim-tree').setup {
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
}
