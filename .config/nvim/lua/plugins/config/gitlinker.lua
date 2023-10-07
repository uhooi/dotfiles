require('gitlinker').setup {
  opts = {
    action_callback = require('gitlinker.actions').open_in_browser,
    print_url = false,
  },
  mappings = '<Leader>go',
}
