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

vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = 'edit',
  pattern = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  callback = function()
    vim.opt_local.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
})
