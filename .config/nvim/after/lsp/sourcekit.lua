local cmd = { 'sourcekit-lsp' }

-- Use iOS SDK (UIKit etc.)
-- ref: https://qiita.com/niusounds/items/5a39b65b54939814a9f9
local sdk_path = vim.trim(vim.fn.system { 'xcrun', '--sdk', 'iphonesimulator', '--show-sdk-path' })
if vim.v.shell_error == 0 then
  local sdk_version = vim.trim(vim.fn.system { 'xcrun', '--sdk', 'iphonesimulator', '--show-sdk-platform-version' })
  local arch = vim.uv.os_uname().machine
  vim.list_extend(cmd, {
    '-Xswiftc',
    '-sdk',
    '-Xswiftc',
    sdk_path,
    '-Xswiftc',
    '-target',
    '-Xswiftc',
    arch .. '-apple-ios' .. sdk_version .. '-simulator',
  })
end

---@type vim.lsp.Config
return {
  -- ref: https://github.com/neovim/nvim-lspconfig/blob/6806370929cf6a35be6e5e0e74588515a4356e4d/doc/server_configurations.md#sourcekit
  -- ref: https://www.swift.org/documentation/articles/zero-to-swift-nvim.html
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  cmd = cmd,
}
