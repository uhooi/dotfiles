local color = require('plugins.config.shared.color')

require('colorful-winsep').setup {
  -- ref: https://github.com/gen740/SmoothCursor.nvim/blob/8c2c5d61899a5c0ecc1dc34827a6eda1270cebdf/lua/smoothcursor/utils.lua#L137
  highlight = {
    fg = color.accent,
  },
  -- ref: https://github.com/neovim/neovim/blob/df87266b23b32b96d1e3d4d26eb721a9dd63c2a4/src/nvim/api/win_config.c#L527
  symbols = { '─', '│', '╭', '╮', '╰', '╯' },
}
