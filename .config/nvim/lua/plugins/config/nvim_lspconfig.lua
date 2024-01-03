local lspconfig = require('lspconfig')
local icon = require('plugins.config.shared.icon')

local server_names = {
  'bashls',
  'cssls',
  'denols',
  'elmls',
  'gopls',
  'groovyls',
  'html',
  'jsonls',
  'kotlin_language_server',
  'lua_ls',
  'omnisharp',
  'perlnavigator',
  'pyright',
  'rust_analyzer',
  'solargraph',
  'taplo',
  'tsserver',
  'vimls',
  -- 'yamlls',
}

-- mason.nvim {{{
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
-- }}}

-- mason-lspconfig.nvim {{{
require('mason-lspconfig').setup {
  ensure_installed = server_names,
}
-- }}}

-- Language servers {{{
-- Managed by mason-lspconfig.nvim {{{
for _, server_name in pairs(server_names) do
  local opts = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }
  -- LuaLS {{{
  if server_name == 'lua_ls' then
    opts.settings = require('plugins.config.lsp.lua_ls')
  end
  -- }}}
  lspconfig[server_name].setup(opts)
end
-- }}}

-- Not Managed by mason-lspconfig.nvim {{{
-- SourceKit-LSP {{{
lspconfig.sourcekit.setup {
  -- Use iOS SDK (UIKit etc.)
  -- ref: https://qiita.com/niusounds/items/5a39b65b54939814a9f9
  -- TODO: Make version dynamic
  cmd = {
    'sourcekit-lsp',
    '-Xswiftc',
    '-sdk',
    '-Xswiftc',
    -- '`xcrun --sdk iphonesimulator --show-sdk-path`',
    '/Applications/Xcode-15.0.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator17.0.sdk',
    '-Xswiftc',
    '-target',
    '-Xswiftc',
    -- 'x86_64-apple-ios`xcrun --sdk iphonesimulator --show-sdk-platform-version`-simulator',
    'x86_64-apple-ios17.0-simulator',
  },
}
-- }}}
-- }}}
-- }}}

-- Signs {{{
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
}
-- }}}

-- Keymaps {{{
-- ref: https://neovim.io/doc/user/lsp.html
--    : https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/lspconfig.txt#L444-L476
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)
-- }}}

-- LspAttach {{{
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
    if supports_inlay_hint or client.name == 'sourcekit' then
      if supports_inlay_hint then
        vim.lsp.inlay_hint.enable(bufnr, true)
      end

      vim.keymap.set('n', 'gh', function()
        vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
      end, bufopts)
    end
    -- }}}
  end,
})
-- }}}

-- UI {{{
require('lspconfig.ui.windows').default_options.border = 'rounded'
-- }}}
