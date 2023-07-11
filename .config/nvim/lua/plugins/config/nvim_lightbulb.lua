local text = '󰌶'
require('nvim-lightbulb').setup {
  sign = {
    enabled = false,
    text = text,
  },
  virtual_text = {
    enabled = true,
    text = text,
  },
  float = {
    enabled = false,
    text = ' ' .. text .. ' ',
    win_opts = {
      border = 'rounded',
    },
  },
  status_text = {
    enabled = false,
    text = text,
  },
  number = {
    enabled = false,
  },
  line = {
    enabled = false,
  },
  autocmd = {
    enabled = true,
    updatetime = 200,
  },
}
