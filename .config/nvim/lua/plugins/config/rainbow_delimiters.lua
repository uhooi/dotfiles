-- ref: https://gist.github.com/Yarakashi-Kikohshi/278028cb6fe003c22cc64b72237b6671
--    : https://code.visualstudio.com/api/references/theme-color#editor-colors
--    : https://github.com/microsoft/vscode/blob/b1cddfafe0c054fbeb346a3d3dc9a58f504eb55b/src/vs/editor/common/core/editorColorRegistry.ts#L72-L77
require('rainbow-delimiters.setup').setup {
  highlight = {
    'RainbowDelimiterYellow',
    'RainbowDelimiterRed',
    'RainbowDelimiterBlue',
  },
}

vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#FFD700' })
vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#DA70D6' })
vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#179FFF' })
