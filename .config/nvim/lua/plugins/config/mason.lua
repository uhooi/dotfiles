require('mason').setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }
    if server_name == 'sumneko_lua' then
      -- ref: https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/server_configurations.md#sumneko_lua
      opts.settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          -- Very slow
          --workspace = {
          --  library = vim.api.nvim_get_runtime_file('', true),
          --},
          telemetry = {
            enable = false,
          },
        },
      }
    end
    require('lspconfig')[server_name].setup(opts)
  end
}

