" ref: https://github.com/apple/sourcekit-lsp/blob/b8d8181a8ceda1b705f2dba0cc6971061868d986/Editors/README.md#vim-lsp

augroup filetype
  autocmd!

  " Git
  autocmd BufRead,BufNewFile .gitconfig.* setlocal filetype=gitconfig

  " Swift
  autocmd BufRead,BufNewFile Package.resolved setlocal filetype=json

  " CocoaPods
  autocmd BufRead,BufNewFile *.podspec setlocal filetype=ruby
  autocmd BufRead,BufNewFile Podfile setlocal filetype=ruby

  " textlint
  autocmd BufRead,BufNewFile .textlintrc setlocal filetype=json
augroup END

