local icons = require('plugins.config.shared.icons')

local lsp_names = function()
  local clients = vim
    .iter(vim.lsp.get_active_clients { bufnr = 0 })
    :map(function(client)
      if client.name == 'null-ls' then
        return ('null-ls(%s)'):format(table.concat(
          vim
            .iter(require('null-ls.sources').get_available(vim.bo.filetype))
            :map(function(source)
              return source.name
            end)
            :totable(),
          ', '
        ))
      else
        return client.name
      end
    end)
    :totable()
  return icons.lsp .. ' ' .. table.concat(clients, ', ')
end

-- ref: https://github.com/delphinus/dotfiles/blob/3dd1d9304114983a7ad00a3a04e964c861a99425/.config/nvim/lua/modules/start/config/lualine.lua#L282-L308
local char_info = function()
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

require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diagnostics' },
    lualine_c = { char_info },
    lualine_x = { lsp_names },
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
    lualine_z = { 'progress', 'location' },
  },
  tabline = {
    lualine_a = {
      'branch',
      {
        'diff',
        symbols = {
          added = '󰐖 ', -- nf-md-plus_box
          modified = '󱗜 ', -- nf-md-circle_box
          removed = '󰍵 ', -- nf-md-minus_box
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
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
