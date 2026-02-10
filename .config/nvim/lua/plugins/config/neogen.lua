local neogen = require('neogen')

neogen.setup()

vim.keymap.set('n', 'cd', neogen.generate)
