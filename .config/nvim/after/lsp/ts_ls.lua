---@type vim.lsp.Config
return {
  -- ref: https://github.com/neovim/nvim-lspconfig/blob/94d0fec9135719e046903bbbbf8f39e3d3436d4e/lua/lspconfig/configs/ts_ls.lua
  -- ref: https://pawelgrzybek.com/reconcile-two-conflicting-lsp-servers-in-neovim-0-11/#update-neovim-0111-comes-with-workspace_required
  root_markers = { 'tsconfig.json', 'package.json' },
  workspace_required = true,
}
