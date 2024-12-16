local snacks = require('snacks')

snacks.setup {
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  notifier = { enabled = false }, -- Use nvim-notify
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}
