vim.opt.cmdheight = 0

require('noice').setup {
  cmdline = {
    format = {
      cmdline = { pattern = '^:', icon = ' ', lang = 'vim' },
      search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
      search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
    },
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    lsp_doc_border = true,
  },
}
