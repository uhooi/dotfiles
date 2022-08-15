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
    opts.on_attach = function(_, bufnr)
      local bufopts = { noremap = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', 'gwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, bufopts)
    end
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
