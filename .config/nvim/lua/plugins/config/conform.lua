local conform = require('conform')
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

conform.setup {
  formatters_by_ft = {
    css = prettier,
    html = prettier,
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
  },
}

vim.keymap.set('n', 'cf', conform.format)
