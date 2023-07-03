local skk_utils = require('plugins.config.shared.skk_utils')

require('skkeleton_indicator').setup {
  eijiText = skk_utils.mode_texts.ascii,
  hiraText = skk_utils.mode_texts.hira,
  kataText = skk_utils.mode_texts.kata,
  hankataText = skk_utils.mode_texts.hankata,
  zenkakuText = skk_utils.mode_texts.zenkaku,
  -- border = 'rounded',
}
