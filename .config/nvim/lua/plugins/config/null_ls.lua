-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/lsp/config.lua#L440-L665

local null_ls = require('null-ls')

null_ls.setup {
  on_attach = function(_, bufnr)
    local bufopts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', 'gwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
  end,
  sources = {
    -- ref: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8c90ccf7ffbdeb49da415837ec45e6ac457d5c60/doc/BUILTINS.md
    --    : https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8c90ccf7ffbdeb49da415837ec45e6ac457d5c60/doc/BUILTIN_CONFIG.md#using-local-executables
    --    : https://zenn.dev/koga1020/scraps/46a160c9aec061
    null_ls.builtins.code_actions.eslint.with {
      prefer_local = 'node_modules/.bin',
    },
    null_ls.builtins.diagnostics.eslint.with {
      prefer_local = 'node_modules/.bin',
    },
    null_ls.builtins.formatting.eslint.with {
      prefer_local = 'node_modules/.bin',
    },
    null_ls.builtins.diagnostics.textlint.with {
      filetypes = { 'markdown' },
      prefer_local = 'node_modules/.bin',
    },
    null_ls.builtins.formatting.textlint.with {
      filetypes = { 'markdown' },
      prefer_local = 'node_modules/.bin',
    },
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.stylua, -- `brew install stylua`
  },
}
