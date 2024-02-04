--    : https://github.com/neovim/nvim-lspconfig/blob/9bedcfed749755e43fc8bed46f85ce2044fe3b77/doc/server_configurations.md#lua_ls
--    : https://luals.github.io/wiki/settings/
--    : https://github.com/uga-rosa/dotfiles/blob/f2770a2b210cfdeec43c8a7508e88929f724ac34/nvim/rc/lsp.toml#L110-L133

-- ref: https://zenn.dev/uga_rosa/articles/afe384341fc2e1#lazy.nvim-の場合
---@param name string
---@return string
local function get_plugin_path(name)
  local plugins = require('lazy.core.config').plugins
  if plugins[name] then
    return vim.fs.joinpath(plugins[name].dir, 'lua')
  else
    vim.notify('Invalid plugin name: ' .. name, vim.log.levels.WARN)
    return ''
  end
end

return {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      -- pathStrict = true, -- TODO: Comment in when library is worked on
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      checkThirdParty = 'Disable',
      -- FIXME: Not work
      -- ref: https://zenn.dev/uga_rosa/articles/afe384341fc2e1
      --    : https://github.com/LuaLS/lua-language-server/tree/f836d90eb629c22219cbcdff9bfcd7f45f1751f3/meta/3rd
      library = {
        vim.fs.joinpath(vim.env.VIMRUNTIME, 'lua'),
        '${3rd}/busted/library',
        '${3rd}/luassert/library',
        '${3rd}/luv/library',
        get_plugin_path('lazy.nvim'),
        get_plugin_path('nvim-cmp'),
        get_plugin_path('nvim-dap-ui'),
        get_plugin_path('nvim-insx'),
        get_plugin_path('nougat.nvim'),
        vim.fs.joinpath(vim.fn.stdpath('config')--[[@as string]], 'lua'),
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
