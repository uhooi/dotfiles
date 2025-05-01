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
  -- Use iOS SDK (UIKit etc.)
  -- ref: https://qiita.com/niusounds/items/5a39b65b54939814a9f9
  -- TODO: Make version dynamic
  cmd = {
    'sourcekit-lsp',
    '-Xswiftc',
    '-sdk',
    '-Xswiftc',
    -- '`xcrun --sdk iphonesimulator --show-sdk-path`',
    '/Applications/Xcode-16.3.0.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator18.4.sdk',
    '-Xswiftc',
    '-target',
    '-Xswiftc',
    -- 'x86_64-apple-ios`xcrun --sdk iphonesimulator --show-sdk-platform-version`-simulator',
    'x86_64-apple-ios18.4-simulator',
  },
}
