-- ref: https://github.com/delphinus/dotfiles/blob/3dd1d9304114983a7ad00a3a04e964c861a99425/.config/nvim/lua/modules/cmp/config.lua
--    : https://github.com/uga-rosa/dotfiles/blob/60bb2d9c3d9f3b0d23138de6cda2b7d24f02ea3d/nvim/lua/rc/plugins/skk.lua

local skk_dictionaries_dir = '~/.config/nvim/lua/plugins/config/dictionaries/skk/'
vim.fn['skkeleton#config'] = {
  eggLikeNewline = true,
  globalDictionaries = {
    skk_dictionaries_dir .. 'SKK-JISYO.L',
    skk_dictionaries_dir .. 'SKK-JISYO.jinmei',
    skk_dictionaries_dir .. 'SKK-JISYO.geo',
    skk_dictionaries_dir .. 'SKK-JISYO.station',
    skk_dictionaries_dir .. 'SKK-JISYO.propernoun',
  },
  registerConvertResult = true,
}

vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
