local color = require('plugins.config.shared.color')

require('colorful-winsep').setup {
  border = 'rounded',
  indicator_for_2wins = {
    position = false,
  },
  colors = color.accent,
}
