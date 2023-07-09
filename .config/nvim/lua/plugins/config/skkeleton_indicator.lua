local skk_utils = require('plugins.config.shared.skk_utils')

vim.api.nvim_set_hl(0, 'SkkeletonIndicatorEiji', { fg = '#88c0d0', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorHira', { fg = '#a3be8c', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorKata', { fg = '#ebcb8b', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorHankata', { fg = '#b48ead', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorZenkaku', { fg = '#88c0d0', bg = 'none', bold = true })

require('skkeleton_indicator').setup {
  eijiText = skk_utils.mode_texts.ascii,
  hiraText = skk_utils.mode_texts.hira,
  kataText = skk_utils.mode_texts.kata,
  hankataText = skk_utils.mode_texts.hankata,
  zenkakuText = skk_utils.mode_texts.zenkaku,
  border = 'rounded',
  row = 1,
  col = 0,
}
