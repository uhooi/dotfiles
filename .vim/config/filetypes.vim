" ref: https://github.com/apple/sourcekit-lsp/blob/b8d8181a8ceda1b705f2dba0cc6971061868d986/Editors/README.md#vim-lsp

augroup filetype
  autocmd!

  " Git
  autocmd BufRead,BufNewFile .gitconfig.* setlocal filetype=gitconfig

  " Swift
  autocmd BufRead,BufNewFile Package.resolved setlocal filetype=json
  autocmd BufRead,BufNewFile *.xcstrings setlocal filetype=json

  " CocoaPods
  autocmd BufRead,BufNewFile *.podspec setlocal filetype=ruby
  autocmd BufRead,BufNewFile Podfile setlocal filetype=ruby

  " fastlane
  autocmd BufRead,BufNewFile Fastfile setlocal filetype=ruby

  " Mustache
  autocmd BufRead,BufNewFile *.mustache setlocal filetype=mustache

  " textlint
  autocmd BufRead,BufNewFile .textlintrc setlocal filetype=json
augroup END

