vim.opt.updatetime = 200

require('barbecue').setup {
  attach_navic = false,
  create_autocmd = false,
}

vim.api.nvim_create_autocmd({
  'WinResized',
  'BufWinEnter',
  'CursorHold',
  'InsertLeave',
}, {
  group = vim.api.nvim_create_augroup('barbecue.updater', {}),
  callback = function()
    require('barbecue.ui').update()
  end,
})
