-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/lsp/config.lua#L440-L665

local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    -- ref: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8c90ccf7ffbdeb49da415837ec45e6ac457d5c60/doc/BUILTINS.md#textlint
    --    : https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8c90ccf7ffbdeb49da415837ec45e6ac457d5c60/doc/BUILTIN_CONFIG.md#using-local-executables
    --    : https://zenn.dev/koga1020/scraps/46a160c9aec061
    null_ls.builtins.diagnostics.textlint.with {
      filetypes = { 'markdown' },
      prefer_local = "node_modules/.bin",
    },
  },
}
