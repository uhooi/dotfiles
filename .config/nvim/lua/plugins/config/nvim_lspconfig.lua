local icon = require('plugins.config.shared.icon')

-- mason.nvim
require('mason').setup {
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

-- mason-lspconfig.nvim
require('mason-lspconfig').setup {
  ensure_installed = {
    'bashls',
    'copilot',
    'cssls',
    'denols',
    'elmls',
    'gopls',
    'groovyls',
    'html',
    'jsonls',
    'kotlin_language_server',
    'lua_ls',
    'nil_ls',
    'omnisharp',
    'perlnavigator',
    'pyright',
    'ruby_lsp',
    'rust_analyzer',
    'taplo',
    'ts_ls',
    'vimls',
    -- 'yamlls',
  },
}

-- ref: https://www.reddit.com/r/neovim/comments/pqssf1/autocomplete_plugins_what_is_surrounding/
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Language servers (Not managed by mason-lspconfig)
vim.lsp.enable {
  'sourcekit',
  'dartls',
}

-- Signs
-- ref: https://github.com/neovim/neovim/pull/26193
--    : https://github.com/neovim/neovim/pull/26555
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icon.diagnostic.error,
      [vim.diagnostic.severity.WARN] = icon.diagnostic.warn,
      [vim.diagnostic.severity.INFO] = icon.diagnostic.info,
      [vim.diagnostic.severity.HINT] = icon.diagnostic.hint,
    },
  },
  virtual_lines = true,
}

-- Keymaps
-- ref: https://neovim.io/doc/user/lsp.html
--    : https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/lspconfig.txt#L444-L476
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
--    : https://github.com/neovim/neovim/pull/31959
vim.keymap.set('n', 'g]', function()
  vim.diagnostic.jump { count = 1, float = true }
end)
vim.keymap.set('n', 'g[', function()
  vim.diagnostic.jump { count = -1, float = true }
end)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config { virtual_lines = new_config }
end, { desc = 'Toggle diagnostic virtual_lines' })

-- LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local bufnr = args.buf
    local bufopts = { buffer = bufnr }
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
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, bufopts)

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    -- Inlay hints {{{
    -- ref: https://github.com/neovim/neovim/pull/23984
    --    : https://github.com/lvimuser/lsp-inlayhints.nvim/blob/d981f65c9ae0b6062176f0accb9c151daeda6f16/README.md?plain=1#L19-L37
    --    : https://github.com/delphinus/dotfiles/commit/a37126f4cabfab7f22b8d031a111b36087a17a00
    --    : https://github.com/uga-rosa/dotfiles/blob/37f49735f3720ca984b165c883f48f3c55bbb8c6/nvim/lua/rc/plugins/lsp.lua#L87-L98
    --    : https://github.com/apple/sourcekit-lsp/issues/757
    --    : https://github.com/neovim/neovim/issues/24183
    local supports_inlay_hint = client.server_capabilities.inlayHintProvider
    -- FIXME: Error when enabling inlay hints in sourcekit-lsp
    --      : https://x.com/the_uhooi/status/1826297399884878193
    --      : https://github.com/neovim/neovim/issues/26926
    -- if supports_inlay_hint or client.name == 'sourcekit' or client.name == 'dartls' then
    if supports_inlay_hint then
      if supports_inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr })
      end

      vim.keymap.set('n', 'gh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
      end, bufopts)
    end
    -- }}}

    -- Document color
    -- ref: https://neovim.io/doc/user/lsp.html#lsp-document_color
    --    : https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_documentColor
    local supports_document_color = client.server_capabilities.colorProvider
    if supports_document_color then
      local dc_opts = { style = '󱓻 ' } -- nf-md-square_rounded
      vim.lsp.document_color.enable(true, bufnr, dc_opts)
      vim.keymap.set('n', '<Leader>c', function()
        vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled(bufnr), bufnr, dc_opts)
      end, bufopts)
    end

    -- Inline completion
    -- ref: https://github.com/neovim/neovim/issues/32421
    --    : https://neovim.io/doc/user/lsp.html#_lua-module:-vim.lsp.inline_completion
    --    : https://microsoft.github.io/language-server-protocol/specifications/lsp/3.18/specification/#textDocument_inlineCompletion
    local supports_inline_completion = client.server_capabilities.inlineCompletionProvider
    if supports_inline_completion then
      if client.name == 'copilot' then
        vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
        vim.keymap.set('i', '<C-g>', function()
          if not vim.lsp.inline_completion.get() then
            return '<C-g>'
          end
        end, { expr = true, buffer = bufnr })
      end
    end
  end,
})

-- UI
require('lspconfig.ui.windows').default_options.border = 'rounded'
