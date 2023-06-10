local cmp_dictionary = require('cmp_dictionary')

cmp_dictionary.setup {
  async = true,
}

cmp_dictionary.switcher {
  spelllang = {
    en = '~/.config/nvim/lua/plugins/config/dictionaries/english.dict',
  },
}
