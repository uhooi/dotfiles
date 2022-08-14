require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
  function(server_name)
    local capabilities = require('cmp_nvim_lsp')
      .update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
    }
  end
}

