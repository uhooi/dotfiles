require('dropbar').setup {
  menu = {
    win_configs = {
      border = 'single',
    },
  },
}

vim.keymap.set('n', '<Leader>p', require('dropbar.api').pick)
