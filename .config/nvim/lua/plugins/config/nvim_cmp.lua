-- ref: https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples
--    : https://github.com/hrsh7th/dotfiles/blob/477047a6280c2c1f858e94e9073fd20bab05c0c7/.config/nvim/init.vim#L767-L852
--    : https://github.com/hrsh7th/nvim-cmp/blob/f51dc68e1bb170fc49c2d7e13eb45e5ec83f5ee9/lua/cmp/config/mapping.lua
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      maxwidth = 50,
    },
  },
  completion = {
    keyword_length = 3,
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
  sources = cmp.config.sources {
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'emoji' },
    { name = 'vsnip' },
    { name = 'buffer' },
  },
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'path' },
    { name = 'cmdline' },
  },
})

-- Use nvim-autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
