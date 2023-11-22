local M = {}

-- ref: https://github.com/delphinus/dotfiles/blob/3dd1d9304114983a7ad00a3a04e964c861a99425/.config/nvim/lua/modules/start/config/lualine.lua#L282-L308
function M:info()
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

return M
