local M = {}

-- ref: https://github.com/delphinus/skkeleton_indicator.nvim/issues/17#issuecomment-1616243044
--    : https://github.com/vim-skk/skkeleton/blob/581c7e66c465381cfbb64300440679891b64d59d/doc/skkeleton.jax#L143-L152
function M:get_mode()
  if vim.api.nvim_get_mode().mode ~= 'i' then
    return ''
  end

  local mode = vim.g['skkeleton#mode']
  if mode == 'hira' then
    return 'かな'
  elseif mode == 'kata' then
    return 'カナ'
  elseif mode == 'hankata' then
    return '半ｶﾅ'
  elseif mode == 'zenkaku' then
    return '全英'
  elseif mode == 'abbrev' then
    return 'abbrev'
  else
    return 'ASCII'
  end
end

-- ref: https://github.com/vim-skk/skkeleton/blob/581c7e66c465381cfbb64300440679891b64d59d/doc/skkeleton.jax#L154-L163
function M:get_state()
  if vim.api.nvim_get_mode().mode ~= 'i' then
    return ''
  end

  local phase = vim.g['skkeleton#state'].phase
  if phase == 'input' then
    return '直接入力'
  elseif phase == 'input:okurinasi' then
    return '送りなし入力'
  elseif phase == 'input:okuriari' then
    return '送りあり入力'
  elseif phase == 'henkan' then
    return '変換'
  else
    return ''
  end
end

return M
