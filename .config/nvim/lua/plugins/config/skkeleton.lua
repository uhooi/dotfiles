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
    dictionaries_dir .. 'SKK-JISYO.jawiki',
  },
  keepState = false,
  markerHenkan = '▽ ',
  markerHenkanSelect = '▼ ',
  registerConvertResult = true,
  showCandidatesCount = 1,
  userJisyo = skkeleton_dir .. 'user_jisyo.txt',
}

vim.fn['skkeleton#register_kanatable']('rom', {
  -- [' '] = { '　', '' }, -- Cannot convert
  ['@'] = { '＠', '' },
  ['~'] = { '〜', '' },
  ['('] = { '（', '' },
  [')'] = { '）', '' },
  ['{'] = { '｛', '' },
  ['<'] = { '＜', '' },
  ['>'] = { '＞', '' },
  ['}'] = { '｝', '' },
  ['0'] = { '０', '' },
  ['1'] = { '１', '' },
  ['2'] = { '２', '' },
  ['3'] = { '３', '' },
  ['4'] = { '４', '' },
  ['5'] = { '５', '' },
  ['6'] = { '６', '' },
  ['7'] = { '７', '' },
  ['8'] = { '８', '' },
  ['9'] = { '９', '' },
  -- 丸数字
  -- ref: https://ja.wikipedia.org/wiki/丸数字
  ['z1'] = { '①', '' },
  ['z2'] = { '②', '' },
  ['z3'] = { '③', '' },
  ['z4'] = { '④', '' },
  ['z5'] = { '⑤', '' },
  ['z6'] = { '⑥', '' },
  ['z7'] = { '⑦', '' },
  ['z8'] = { '⑧', '' },
  ['z9'] = { '⑨', '' },
})

vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
