require('mason').setup {
  ui = {
    border = 'single',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup {
  ensure_installed = {
    'bashls',
    'cssls',
    'denols',
    'elmls',
    'gopls',
    'groovyls',
    'html',
    'kotlin_language_server',
    'lua_ls',
    'omnisharp',
    'rust_analyzer',
    'solargraph',
    'taplo',
    'tsserver',
    'vimls',
  },
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
    if server_name == 'lua_ls' then
      -- ref: https://github.com/neovim/nvim-lspconfig/blob/27e9e1d2638ffd133b06f314a49ac55825cb1017/doc/server_configurations.md#lua_ls
      --    : https://github.com/uga-rosa/dotfiles/blob/f2770a2b210cfdeec43c8a7508e88929f724ac34/nvim/rc/lsp.toml#L110-L133
      opts.settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
          format = {
            enable = false, -- Use StyLua
          },
        },
      }
    end
    require('lspconfig')[server_name].setup(opts)
  end,
}
