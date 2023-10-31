require('lsp-lens').setup {
  sections = {
    definition = false,
    references = true,
    implements = true,
    git_authors = true,
  },
}

vim.keymap.set('n', 'gs', '<Cmd>LspLensToggle<CR>')
