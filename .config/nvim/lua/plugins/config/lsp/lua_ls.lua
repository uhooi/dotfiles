--    : https://github.com/neovim/nvim-lspconfig/blob/9bedcfed749755e43fc8bed46f85ce2044fe3b77/doc/server_configurations.md#lua_ls
--    : https://luals.github.io/wiki/settings/
--    : https://github.com/uga-rosa/dotfiles/blob/f2770a2b210cfdeec43c8a7508e88929f724ac34/nvim/rc/lsp.toml#L110-L133

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Neovimのランタイムファイルとlazy.nvimのパスを取得
local runtime_files = vim.api.nvim_get_runtime_file("", true)
local lazy_nvim_path = vim.fn.stdpath("data") -- lazy.nvimの実際のパスを指定
local library_paths = { lazy_nvim_path }

-- Neovimのランタイムファイルを追加
for _, file in ipairs(runtime_files) do
  table.insert(library_paths, file)
end

return {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      library = library_paths,
    },
    telemetry = {
      enable = false,
    },
    format = {
      enable = false, -- Use StyLua
    },
    -- ref: https://github.com/LuaLS/lua-language-server/wiki/Tips#inlay-hints
    --    : https://github.com/LuaLS/lua-language-server/wiki/Settings#hint
    hint = {
      enable = true,
    },
  },
}
