-- ref: https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples
--    : https://github.com/hrsh7th/dotfiles/blob/477047a6280c2c1f858e94e9073fd20bab05c0c7/.config/nvim/init.vim#L767-L852
--    : https://github.com/hrsh7th/nvim-cmp/blob/f51dc68e1bb170fc49c2d7e13eb45e5ec83f5ee9/lua/cmp/config/mapping.lua
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf

local cmp = require('cmp')
local cmp_types = require('cmp.types')
local lspkind = require('lspkind')
local icons = require('plugins.config.shared.icons')

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
        Text = icons.text,
        Method = icons.method,
        Function = icons.func,
        Constructor = icons.constructor,
        Field = icons.field,
        Variable = icons.variable,
        Class = icons.class,
        Interface = icons.interface,
        Module = icons.module,
        Property = icons.property,
        Unit = icons.unit,
        Value = icons.value,
        Enum = icons.enum,
        Keyword = icons.keyword,
        Snippet = icons.snippet,
        Color = icons.color,
        File = icons.file,
        Reference = icons.reference,
        Folder = icons.folder,
        EnumMember = icons.enum_member,
        Constant = icons.constant,
        Struct = icons.struct,
        Event = icons.event,
        Operator = icons.operator,
        TypeParameter = icons.type_parameter,
      },
    },
    before = function(entry, vim_item)
      local word = entry:get_insert_text()
      if entry.completion_item.insertTextFormat == cmp_types.lsp.InsertTextFormat.Snippet then
        word = vim.lsp.util.parse_snippet(word)
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
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    { name = 'ghq' },
    { name = 'latex_symbol' },
    { name = 'emoji' },
    { name = 'dynamic' },
    { name = 'calc' },
    { name = 'treesitter' },
    sources.visible_buffers,
  }, {
    { name = 'dictionary' },
  }),
}

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'skkeleton' },
    { name = 'buffer' },
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
