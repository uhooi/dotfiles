" ref: https://github.com/apple/sourcekit-lsp/blob/b8d8181a8ceda1b705f2dba0cc6971061868d986/Editors/README.md#vim-lsp

augroup filetype
  autocmd!

  " Swift
  autocmd! BufRead,BufNewFile Package.resolved set ft=json

  " CocoaPods
  autocmd! BufRead,BufNewFile *.podspec set ft=ruby
  autocmd! BufRead,BufNewFile Podfile set ft=ruby
augroup END

