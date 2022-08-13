" ref: https://github.com/tyru/open-browser.vim/blob/80ec3f2bb0a86ac13c998e2f2c86e16e6d2f20bb/doc/openbrowser.txt

let g:netrw_nogx = 1 " disable netrw's gx mapping.

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

if has('win32') || has('win64')
  let g:openbrowser_browser_commands = [
  \  {
  \    'name': 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe',
  \    'args': ['start', '{browser}', '{uri}']}
  \  }
  \]
endif

