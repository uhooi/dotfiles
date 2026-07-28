local snacks = require('snacks')

snacks.setup {
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = true },
  image = { enabled = true }, -- For xcodebuild.nvim
  indent = { enabled = false }, -- Use hlchunk.nvim
  input = { enabled = true },
  picker = { enabled = false }, -- Use Telescope.nvim
  notifier = { enabled = false }, -- Use nvim-notify
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

-- Keymaps
vim.keymap.set('n', '<Leader>e', snacks.picker.explorer)
