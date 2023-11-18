require('colorful-winsep').setup {
  highlight = {
    fg = '#FF0000',
  },
  -- ref: https://github.com/neovim/neovim/blob/df87266b23b32b96d1e3d4d26eb721a9dd63c2a4/src/nvim/api/win_config.c#L527
  symbols = { '─', '│', '╭', '╮', '╰', '╯' },
}
