-- Language servers (Not managed by mason-lspconfig) {{{
local lspconfig = require('lspconfig')
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
    '/Applications/Xcode-15.0.0-Release.Candidate.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator17.0.sdk',
    '-Xswiftc',
    '-target',
    '-Xswiftc',
    -- 'x86_64-apple-ios`xcrun --sdk iphonesimulator --show-sdk-platform-version`-simulator',
    'x86_64-apple-ios17.0-simulator',
  },
}
-- }}}
-- }}}

-- Signs {{{
-- ref: https://github.com/neovim/neovim/commit/a5bbb932f9094098bd656d3f6be3c58344576709
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' }
)
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignHint', { text = '󰌶', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })
-- }}}

-- Keymaps {{{
-- ref: https://neovim.io/doc/user/lsp.html
--    : https://github.com/neovim/nvim-lspconfig/blob/da7461b596d70fa47b50bf3a7acfaef94c47727d/doc/lspconfig.txt#L444-L476
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)
-- }}}

-- Functions {{{
-- ref: https://github.com/lvimuser/lsp-inlayhints.nvim/blob/d981f65c9ae0b6062176f0accb9c151daeda6f16/lua/lsp-inlayhints/config.lua#L1-L20
local function set_lsp_inlay_hint_hl()
  local hl = vim.api.nvim_get_hl(0, { name = 'Comment' })
  local foreground = string.format('#%06x', hl['fg'] or 0)
  if #foreground < 3 then
    foreground = ''
  end

  hl = vim.api.nvim_get_hl(0, { name = 'CursorLine' })
  local background = string.format('#%06x', hl['bg'] or 0)
  if #background < 3 then
    background = ''
  end

  vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = foreground, bg = background })
end
-- }}}

-- LspAttach {{{
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufnr = ev.buf
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

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

    -- Inlay hints {{{
    -- ref: https://github.com/neovim/neovim/pull/23984
    --    : https://github.com/lvimuser/lsp-inlayhints.nvim/blob/d981f65c9ae0b6062176f0accb9c151daeda6f16/README.md?plain=1#L19-L37
    --    : https://github.com/delphinus/dotfiles/commit/a37126f4cabfab7f22b8d031a111b36087a17a00
    --    : https://github.com/uga-rosa/dotfiles/blob/37f49735f3720ca984b165c883f48f3c55bbb8c6/nvim/lua/rc/plugins/lsp.lua#L87-L98
    --    : https://github.com/apple/sourcekit-lsp/issues/757
    --    : https://github.com/neovim/neovim/issues/24183
    if not (ev.data and ev.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local supports_inlay_hint = client.server_capabilities.inlayHintProvider
    if supports_inlay_hint or client.name == 'sourcekit' then
      set_lsp_inlay_hint_hl()

      if supports_inlay_hint then
        vim.lsp.inlay_hint(bufnr, true)
      end

      vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
          vim.lsp.inlay_hint(bufnr, true)
        end,
      })
      vim.api.nvim_create_autocmd('InsertEnter', {
        callback = function()
          vim.lsp.inlay_hint(bufnr, false)
        end,
      })

      vim.keymap.set('n', 'gh', function()
        vim.lsp.inlay_hint(bufnr)
      end, bufopts)
    end
    -- }}}
  end,
})
-- }}}

-- UI {{{
require('lspconfig.ui.windows').default_options.border = 'rounded'
-- }}}
