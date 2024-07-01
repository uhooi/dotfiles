local color = require('plugins.config.shared.color')

require('hlchunk').setup {
  chunk = {
    enable = true,
    style = {
      { fg = color.accent },
      { fg = '#c21f30' }, -- This fg is used to highlight wrong chunk
    },
    use_treesitter = true,
    chars = {
      horizontal_line = '─',
      vertical_line = '│',
      left_top = '╭',
      left_bottom = '╰',
      right_arrow = '─',
    },
  },
  indent = {
    enable = true,
    use_treesitter = true,
    chars = { '│' },
  },
  line_num = {
    enable = true,
    style = color.accent,
    use_treesitter = true,
  },
  blank = {
    enable = false,
  },
}
