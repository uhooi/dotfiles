local treesitter_context = require('treesitter-context')

treesitter_context.setup()

vim.keymap.set('n', '[c', function()
  treesitter_context.go_to_context()
end)
