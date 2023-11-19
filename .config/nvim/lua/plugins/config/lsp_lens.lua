require('lsp-lens').setup {
  sections = {
    definition = false,
    references = function(count)
      if count == 1 then
        return count .. ' reference'
      else
        return count .. ' references'
      end
    end,
    implements = function(count)
      if count == 1 then
        return count .. ' implement'
      else
        return count .. ' implements'
      end
    end,
    git_authors = true,
  },
}

vim.keymap.set('n', 'gs', '<Cmd>LspLensToggle<CR>')
