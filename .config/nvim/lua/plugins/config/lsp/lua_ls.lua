--    : https://github.com/neovim/nvim-lspconfig/blob/9bedcfed749755e43fc8bed46f85ce2044fe3b77/doc/server_configurations.md#lua_ls
--    : https://luals.github.io/wiki/settings/
--    : https://github.com/uga-rosa/dotfiles/blob/f2770a2b210cfdeec43c8a7508e88929f724ac34/nvim/rc/lsp.toml#L110-L133
return {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      checkThirdParty = 'Disable',
      library = {
        vim.env.VIMRUNTIME,
        '${3rd}/luv/library',
        '${3rd}/busted/library',
      },
      -- library = vim.api.nvim_get_runtime_file('', true), -- This is a lot slower
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
