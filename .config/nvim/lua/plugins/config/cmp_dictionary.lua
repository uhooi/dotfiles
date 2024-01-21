require('cmp_dictionary').setup {
  paths = {
    vim.fs.joinpath(vim.fn.stdpath('config')--[[@as string]], 'lua', 'plugins', 'config', 'dictionaries', 'english.dict'),
  },
}
