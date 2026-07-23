-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/lsp/config.lua#L440-L665
local null_ls = require('null-ls')

-- プロジェクトの `.swiftlint.yml` があればそれを使い、なければ Loki の設定にフォールバックする
local function swiftlint_config_path()
  local project_config = vim.fn.findfile('.swiftlint.yml', '.;')
  if project_config ~= '' then
    return vim.fn.fnamemodify(project_config, ':p')
  end
  return vim.fn.expand('~/ghq/github.com/uhooi/Loki/.swiftlint.yml')
end

null_ls.setup {
  border = 'rounded',
  sources = {
    -- ref: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8c90ccf7ffbdeb49da415837ec45e6ac457d5c60/doc/BUILTINS.md
    --    : https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8c90ccf7ffbdeb49da415837ec45e6ac457d5c60/doc/BUILTIN_CONFIG.md#using-local-executables
    --    : https://zenn.dev/koga1020/scraps/46a160c9aec061
    -- FIXME: eslint is not working
    -- null_ls.builtins.code_actions.eslint.with {
    --   prefer_local = 'node_modules/.bin',
    -- },
    -- null_ls.builtins.diagnostics.eslint.with {
    --   prefer_local = 'node_modules/.bin',
    -- },
    -- null_ls.builtins.formatting.eslint.with {
    --   prefer_local = 'node_modules/.bin',
    -- },
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
      prefer_local = '.mint/lib/packages/github.com_realm_SwiftLint/build/0.55.0', -- TODO: Make version dynamic
      args = {
        '--reporter',
        'json',
        '--use-stdin',
        '--quiet',
        '--config',
        swiftlint_config_path(),
      },
    },
    null_ls.builtins.formatting.swiftlint.with {
      prefer_local = '.mint/lib/packages/github.com_realm_SwiftLint/build/0.55.0', -- TODO: Make version dynamic
      args = {
        '--use-stdin',
        '--fix',
        '--format',
        '--config',
        swiftlint_config_path(),
      },
    },
  },
}
