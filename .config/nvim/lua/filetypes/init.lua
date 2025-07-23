-- ref: https://neovim.io/doc/user/api.html#nvim_create_augroup()
--    : https://neovim.io/doc/user/api.html#nvim_create_autocmd()
--    : https://zenn.dev/link/comments/88476e46d84b4f

vim.api.nvim_create_augroup('filetype', {})

-- Git
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '.gitconfig.*',
  callback = function()
    vim.opt_local.filetype = 'gitconfig'
  end,
})

-- Swift
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = 'Package.resolved',
  callback = function()
    vim.opt_local.filetype = 'json'
  end,
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '*.xcstrings',
  callback = function()
    vim.opt_local.filetype = 'json'
  end,
})

-- APNs
-- ref: https://developer.apple.com/documentation/usernotifications/generating-a-remote-notification
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '*.apns',
  callback = function()
    vim.opt_local.filetype = 'json'
  end,
})

-- CocoaPods
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = { '*.podspec', 'Podfile' },
  callback = function()
    vim.opt_local.filetype = 'ruby'
  end,
})

-- fastlane
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = 'Fastfile',
  callback = function()
    vim.opt_local.filetype = 'ruby'
  end,
})

-- Mustache
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '*.mustache',
  callback = function()
    vim.opt_local.filetype = 'mustache'
  end,
})

-- textlint
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '.textlintrc',
  callback = function()
    vim.opt_local.filetype = 'json'
  end,
})

-- vim: set foldmethod=marker:
