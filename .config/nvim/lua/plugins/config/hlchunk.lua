require('hlchunk').setup {
  chunk = {
    chars = {
      horizontal_line = '─',
      vertical_line = '│',
      left_top = '╭',
      left_bottom = '╰',
      right_arrow = '─',
    },
    style = {
      { fg = '#806d9c' },
      { fg = '#c21f30' }, -- This fg is used to highlight wrong chunk
    },
  },
  line_num = {
    style = '#806d9c',
  },
  indent = {
    chars = { '│' },
  },
  blank = {
    enable = false,
  },
}
