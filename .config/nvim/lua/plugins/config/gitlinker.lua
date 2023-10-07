local gitlinker = require('gitlinker')
local gitlinker_actions = require('gitlinker.actions')

gitlinker.setup {
  opts = {
    action_callback = gitlinker_actions.open_in_browser,
    print_url = false,
  },
  mappings = '<Leader>go',
}
