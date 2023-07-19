vim.api.nvim_set_hl(0, 'SkkeletonIndicatorEiji', { fg = '#9b9b9b', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorHira', { fg = '#ee8432', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorKata', { fg = '#82A64F', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorHankata', { fg = '#a481d0', bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'SkkeletonIndicatorZenkaku', { fg = '#F8D648', bg = 'none', bold = true })

require('skkeleton_indicator').setup {
  eijiText = ' ＠ ',
  hiraText = ' あ ',
  kataText = ' ア ',
  hankataText = ' ｶﾅ ',
  zenkakuText = ' 英 ',
  border = 'rounded',
  row = 1,
  col = 0,
}
