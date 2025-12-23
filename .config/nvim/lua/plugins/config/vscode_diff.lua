require('vscode-diff').setup {
  highlights = {
    line_insert = 'DiffAdd',
    line_delete = 'DiffDelete',
    char_insert = nil,
    char_delete = nil,
    char_brightness = nil,
  },
  diff = {
    disable_inlay_hints = true,
    max_computation_time_ms = 5000,
  },
  explorer = {
    position = 'left',
    width = 40,
    height = 15,
    indent_markers = true,
    icons = {
      folder_closed = '',
      folder_open = '',
    },
    view_mode = 'list',
    file_filter = {
      ignore = {},
    },
  },
  keymaps = {
    view = {
      quit = 'q',
      toggle_explorer = '<leader>b',
      next_hunk = ']c',
      prev_hunk = '[c',
      next_file = ']f',
      prev_file = '[f',
      diff_get = 'do',
      diff_put = 'dp',
    },
    explorer = {
      select = '<CR>',
      hover = 'K',
      refresh = 'R',
      toggle_view_mode = 'i',
    },
  },
}
