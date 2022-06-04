" ref: http://hanagurotanuki.blogspot.jp/2015/03/windowsopen-browservimchrome.html

let g:netrw_nogx = 1
nnoremap gx (openbrowser-smart-search)
vnoremap gx (openbrowser-smart-search)

" Windowsの場合、ブラウザにChromeを指定する
if has('win32') || has('win64')
  let g:openbrowser_browser_commands = [
  \  {
  \    "name": "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
  \    "args": ["{browser}", "{uri}"]
  \  }
  \]
endif

