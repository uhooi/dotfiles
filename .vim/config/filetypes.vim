" ref: https://github.com/apple/sourcekit-lsp/blob/b8d8181a8ceda1b705f2dba0cc6971061868d986/Editors/README.md#vim-lsp

augroup filetype
  " CocoaPods
  au! BufRead,BufNewFile *.podspec set ft=ruby
  au! BufRead,BufNewFile Podfile set ft=ruby

  " Swift
  au! BufRead,BufNewFile Package.resolved set ft=json
augroup END

