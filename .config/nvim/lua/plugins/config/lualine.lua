local icon = require('plugins.config.shared.icon')
local skkeleton_util = require('plugins.config.shared.skkeleton_util')
local lsp_util = require('plugins.config.shared.lsp_util')

-- {{{ Functions
-- ref: https://github.com/delphinus/dotfiles/blob/3dd1d9304114983a7ad00a3a04e964c861a99425/.config/nvim/lua/modules/start/config/lualine.lua#L282-L308
local function char_info()
  local characterize = require('characterize')
  local char = characterize.cursor_char()
  local results = characterize.info_table(char)
  if #results == 0 then
    return 'NUL'
  end
  local r = results[1]
  local escaped = r.char:gsub('%%', '%%%%')
  local sign = require('eaw').get(char)
  local text = ('<%s> %s %s'):format(escaped, r.codepoint, sign)
  if r.digraphs and #r.digraphs > 0 then
    text = text .. ', \\<C-K>' .. r.digraphs[1]
  end
  if r.description ~= '<unknown>' then
    text = text .. ', ' .. r.description
  end
  if r.shikakugoma then
    text = text .. ', ' .. r.shikakugoma
  end
  return text
end
-- }}}

-- {{{ Setup
require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { skkeleton_util.get_mode, skkeleton_util.get_state },
    lualine_c = { char_info },
    lualine_x = {},
    lualine_y = {
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = ' unix', -- nf-dev-linux
          dos = ' dos', -- nf-dev-windows
          mac = ' mac', -- nf-dev-apple
        },
      },
      'filetype',
    },
    lualine_z = {
      {
        'datetime',
        style = '%H:%M',
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
