vim.opt.termguicolors = true

local ccc = require('ccc')
ccc.setup {
  highlight_mode = 'virtual',
  virtual_symbol = '󱓻 ', -- nf-md-square_rounded
  virtual_pos = 'inline-left',
  highlighter = {
    auto_enable = true,
  },
  pickers = {
    ccc.picker.hex,
    ccc.picker.css_rgb,
    ccc.picker.css_hsl,
    ccc.picker.css_hwb,
    ccc.picker.css_lab,
    ccc.picker.css_lch,
    ccc.picker.css_oklab,
    ccc.picker.css_oklch,
    ccc.picker.css_name,
  },
}
