-- ref: https://neovim.io/doc/user/api.html#nvim_create_augroup()
--    : https://neovim.io/doc/user/api.html#nvim_clear_autocmds()
--    : https://neovim.io/doc/user/api.html#nvim_create_autocmd()
--    : https://zenn.dev/link/comments/88476e46d84b4f

vim.api.nvim_create_augroup('filetype', {})
vim.api.nvim_clear_autocmds { group = 'filetype' }

-- Git
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '.gitconfig.*',
  callback = function() vim.opt_local.filetype = 'gitconfig' end,
})

-- Swift
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = 'Package.resolved',
  callback = function() vim.opt_local.filetype = 'json' end,
})

-- CocoaPods
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = { '*.podspec', 'Podfile' },
  callback = function() vim.opt_local.filetype = 'ruby' end,
})

-- fastlane
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = 'Fastfile',
  callback = function() vim.opt_local.filetype = 'ruby' end,
})

-- textlint
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '.textlintrc',
  callback = function() vim.opt_local.filetype = 'json' end,
})

