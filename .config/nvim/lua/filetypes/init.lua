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
  command = 'setlocal filetype=gitconfig',
})

-- Swift
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = 'Package.resolved',
  command = 'setlocal filetype=json',
})

-- CocoaPods
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = { '*.podspec', 'Podfile' },
  command = 'setlocal filetype=ruby',
})

-- fastlane
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = 'Fastfile',
  command = 'setlocal filetype=ruby',
})

-- textlint
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'filetype',
  pattern = '.textlintrc',
  command = 'setlocal filetype=json',
})

