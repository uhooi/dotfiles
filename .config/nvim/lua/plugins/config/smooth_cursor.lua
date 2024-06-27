require('smoothcursor').setup {
  cursor = '▷',
  disable_float_win = true,
}

-- ref: https://github.com/delphinus/dotfiles/blob/2ac7f4685f4d753bddc688766ca7b8018bd52d94/.config/nvim/lua/lazies/start.lua#L96-L113
vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
  callback = function()
    local current_mode = vim.fn.mode()
    if current_mode == 'n' then
      vim.fn.sign_define('smoothcursor', { text = '▷' })
    elseif current_mode == 'i' then
      vim.fn.sign_define('smoothcursor', { text = '▶' })
    elseif current_mode == 'v' then
      vim.fn.sign_define('smoothcursor', { text = '═' })
    elseif current_mode == 'V' then
      vim.fn.sign_define('smoothcursor', { text = '║' })
    elseif current_mode == '' then
      vim.fn.sign_define('smoothcursor', { text = '╬' })
    elseif current_mode == 'R' then
      vim.fn.sign_define('smoothcursor', { text = '⟩' })
    end
  end,
})
