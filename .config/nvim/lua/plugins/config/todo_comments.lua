local todo_comments = require('todo-comments')

todo_comments.setup {
  keywords = {
    FIX = { icon = '󰶯 ', color = 'error', alt = { 'FIXME' } },
    TODO = { icon = ' ', color = 'info' },
    QUES = { icon = ' ', color = 'warning', alt = { 'QUESTION' } },
    NOTE = { icon = '󰉀 ', color = 'hint', alt = { 'MEMO' } },
    MARK = { icon = '󰃀 ' },
  },
  highlight = {
    after = '',
  },
}

vim.keymap.set('n', ']t', function()
  todo_comments.jump_next { keywords = { 'FIXME', 'TODO' } }
end)
vim.keymap.set('n', '[t', function()
  todo_comments.jump_prev { keywords = { 'FIXME', 'TODO' } }
end)
