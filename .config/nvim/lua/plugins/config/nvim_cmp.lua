-- ref: https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples
--    : https://github.com/hrsh7th/dotfiles/blob/477047a6280c2c1f858e94e9073fd20bab05c0c7/.config/nvim/init.vim#L767-L852
--    : https://github.com/hrsh7th/nvim-cmp/blob/f51dc68e1bb170fc49c2d7e13eb45e5ec83f5ee9/lua/cmp/config/mapping.lua
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf

local cmp = require('cmp')
local cmp_types = require('cmp.types')
local lspkind = require('lspkind')
local icon = require('plugins.config.shared.icon')

local sources = {
  -- ref: https://github.com/hrsh7th/cmp-buffer/blob/3022dbc9166796b644a841a02de8dd1cc1d311fa/README.md#visible-buffers
  visible_buffers = {
    name = 'buffer',
    option = {
      get_bufnrs = function()
        local bufs = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          bufs[vim.api.nvim_win_get_buf(win)] = true
        end
        return vim.tbl_keys(bufs)
      end,
    },
  },
}

cmp.setup {
  formatting = {
    -- ref: https://github.com/onsails/lspkind.nvim/pull/30
    fields = {
      cmp.ItemField.Kind,
      cmp.ItemField.Abbr,
      cmp.ItemField.Menu,
    },
    format = lspkind.cmp_format {
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '…',
      menu = {
        buffer = 'buffer',
        calc = 'calc',
        cmdline = 'cmdline',
        dictionary = 'dictionary',
        dynamic = 'dynamic',
        emoji = 'emoji',
        ghq = 'ghq',
        latex_symbol = 'latex',
        nvim_lsp = 'lsp',
        nvim_lua = 'lua',
        nvim_lsp_signature_help = 'signature',
        path = 'path',
        skkeleton = 'skkeleton',
        treesitter = 'treesitter',
        vsnip = 'vsnip',
      },
      symbol_map = {
        Text = icon.symbol.text,
        Method = icon.symbol.method,
        Function = icon.symbol.func,
        Constructor = icon.symbol.constructor,
        Field = icon.symbol.field,
        Variable = icon.symbol.variable,
        Class = icon.symbol.class,
        Interface = icon.symbol.interface,
        Module = icon.symbol.module,
        Property = icon.symbol.property,
        Unit = icon.symbol.unit,
        Value = icon.symbol.value,
        Enum = icon.symbol.enum,
        Keyword = icon.symbol.keyword,
        Snippet = icon.symbol.snippet,
        Color = icon.symbol.color,
        File = icon.symbol.file,
        Reference = icon.symbol.reference,
        Folder = icon.symbol.folder,
        EnumMember = icon.symbol.enum_member,
        Constant = icon.symbol.constant,
        Struct = icon.symbol.struct,
        Event = icon.symbol.event,
        Operator = icon.symbol.operator,
        TypeParameter = icon.symbol.type_parameter,
      },
    },
    before = function(entry, vim_item)
      local word = entry:get_insert_text()
      if entry.completion_item.insertTextFormat == cmp_types.lsp.InsertTextFormat.Snippet then
        word = vim.lsp.util.parse_snippet_grammar(word)
      end
      word = word:gsub('\n', '')
      if entry.completion_item.insertTextFormat == cmp_types.lsp.InsertTextFormat.Snippet then
        word = word .. '…'
      end
      vim_item.abbr = word
      return vim_item
    end,
  },
  completion = {
    keyword_length = 1,
  },
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered { border = 'rounded' },
    documentation = cmp.config.window.bordered { border = 'rounded' },
  },
  mapping = cmp.mapping.preset.insert {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<C-e>'] = cmp.mapping.abort(),
  },
  sources = cmp.config.sources({
    { name = 'skkeleton' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'latex_symbol' },
    { name = 'emoji' },
    { name = 'dynamic' },
    { name = 'calc' },
  }, {
    sources.visible_buffers,
  }, {
    { name = 'treesitter' },
    { name = 'ghq' },
    { name = 'wezterm' },
  }, {
    { name = 'dictionary' },
  }),
}

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'skkeleton' },
    { name = 'buffer' },
    { name = 'wezterm' },
  }, {
    { name = 'dictionary' },
  }),
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'skkeleton' },
    { name = 'path' },
    { name = 'cmdline' },
  }, {
    { name = 'dictionary' },
  }),
})
