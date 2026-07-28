require('aerial').setup {
  on_attach = function(bufnr)
    local bufopts = { buffer = bufnr }
    vim.keymap.set('n', '{', '<Cmd>AerialPrev<CR>', bufopts)
    vim.keymap.set('n', '}', '<Cmd>AerialNext<CR>', bufopts)
  end,
}

vim.keymap.set('n', '<Leader>a', '<Cmd>AerialToggle!<CR>')
