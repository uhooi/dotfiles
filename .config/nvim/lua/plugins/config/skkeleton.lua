-- ref: https://github.com/delphinus/dotfiles/blob/3dd1d9304114983a7ad00a3a04e964c861a99425/.config/nvim/lua/modules/cmp/config.lua
--    : https://github.com/delphinus/dotfiles/blob/a6670cd510c4e5f6bd731186431723be6002a794/.config/nvim/lua/lazies/cmp.lua#L115-L165
--    : https://github.com/uga-rosa/dotfiles/blob/60bb2d9c3d9f3b0d23138de6cda2b7d24f02ea3d/nvim/lua/rc/plugins/skk.lua

local dictionaries_dir = '~/Library/Application Support/AquaSKK/'
local skkeleton_dir = '~/.skkeleton/'

vim.fn['skkeleton#config'] {
  completionRankFile = skkeleton_dir .. 'completion_rank.txt',
  eggLikeNewline = true,
  globalDictionaries = {
    dictionaries_dir .. 'SKK-JISYO.L',
    dictionaries_dir .. 'SKK-JISYO.jinmei',
    dictionaries_dir .. 'SKK-JISYO.geo',
    dictionaries_dir .. 'SKK-JISYO.station',
    dictionaries_dir .. 'SKK-JISYO.propernoun',
  },
  keepState = false,
  markerHenkan = '▽ ',
  markerHenkanSelect = '▼ ',
  registerConvertResult = true,
  showCandidatesCount = 1,
  userJisyo = skkeleton_dir .. 'user_jisyo.txt',
}

vim.fn['skkeleton#register_kanatable']('rom', {
  [' '] = { '　', '' },
  ['~'] = { '〜', '' },
  ['('] = { '（', '' },
  [')'] = { '）', '' },
  ['{'] = { '｛', '' },
  ['}'] = { '｝', '' },
})

vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
