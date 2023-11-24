local icon = require('plugins.config.shared.icon')
local skkeleton_util = require('plugins.config.shared.skkeleton_util')
local lsp_util = require('plugins.config.shared.lsp_util')
local char_util = require('plugins.config.shared.char_util')

-- {{{ Setup
require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { skkeleton_util.get_mode, skkeleton_util.get_state },
    lualine_c = { char_util.info },
    lualine_x = {},
    lualine_y = {
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = icon.fileformat.unix .. ' unix',
          dos = icon.fileformat.dos .. ' dos',
          mac = icon.fileformat.mac .. ' mac',
        },
      },
      'filetype',
    },
    lualine_z = {
      {
        'datetime',
        style = '%m/%d %H:%M',
      },
    },
  },
  tabline = {
    lualine_a = {
      'branch',
      {
        'diff',
        symbols = {
          added = icon.git.added .. ' ',
          modified = icon.git.modified .. ' ',
          removed = icon.git.removed .. ' ',
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { lsp_util.names },
    lualine_y = {},
    lualine_z = { 'diagnostics' },
  },
  -- dropbar.nvim uses winbar, so lualine does not use it
  -- winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
}
-- }}}
