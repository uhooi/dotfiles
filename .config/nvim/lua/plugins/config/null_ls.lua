-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/lsp/config.lua#L440-L665
local null_ls = require('null-ls')

null_ls.setup {
  border = 'rounded',
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
    -- null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.stylua, -- `brew install stylua`
    -- null_ls.builtins.diagnostics.vint, -- `brew install vint`
    null_ls.builtins.diagnostics.swiftlint.with {
      prefer_local = '.mint/lib/packages/github.com_realm_SwiftLint/build/0.52.2', -- TODO: Make version dynamic
    },
    null_ls.builtins.formatting.swiftlint.with {
      prefer_local = '.mint/lib/packages/github.com_realm_SwiftLint/build/0.52.2', -- TODO: Make version dynamic
    },
  },
}
