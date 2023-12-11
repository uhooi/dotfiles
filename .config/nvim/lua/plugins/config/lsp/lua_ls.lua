-- ref: https://github.com/neovim/nvim-lspconfig/blob/27e9e1d2638ffd133b06f314a49ac55825cb1017/doc/server_configurations.md#lua_ls
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
        -- ref: https://vim-jp.slack.com/archives/CJMV3MSLR/p1700204138510059
        -- vim.fs.normalize('~/.local/nvim/share/nvim/runtime'), -- FIXME: Not work
      },
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
