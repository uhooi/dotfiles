require('screenkey').setup {
  win_opts = {
    border = 'rounded',
  },
  compress_after = 999,
  group_mappings = true,
  show_leader = false,
  -- ref: https://support.apple.com/ja-jp/guide/mac-help/cpmh0011/mac
  --    : https://qiita.com/re3turn/items/91acc6efb6114d810b68
  keys = {
    ['<TAB>'] = '⇥',
    ['<CR>'] = '↩',
    ['<ESC>'] = '⎋',
    ['<SPACE>'] = '␣',
    ['<BS>'] = '⌫',
    ['<DEL>'] = '⌦',
    ['<LEFT>'] = '←',
    ['<RIGHT>'] = '→',
    ['<UP>'] = '↑',
    ['<DOWN>'] = '↓',
    ['<HOME>'] = '↖',
    ['<END>'] = '↘',
    ['<PAGEUP>'] = '⇞',
    ['<PAGEDOWN>'] = '⇟',
    ['<INSERT>'] = 'Ins',
    ['<F1>'] = '󱊫',
    ['<F2>'] = '󱊬',
    ['<F3>'] = '󱊭',
    ['<F4>'] = '󱊮',
    ['<F5>'] = '󱊯',
    ['<F6>'] = '󱊰',
    ['<F7>'] = '󱊱',
    ['<F8>'] = '󱊲',
    ['<F9>'] = '󱊳',
    ['<F10>'] = '󱊴',
    ['<F11>'] = '󱊵',
    ['<F12>'] = '󱊶',
    ['CTRL'] = '⌃',
    ['ALT'] = '⌥',
    ['SUPER'] = '⌘',
    ['<leader>'] = '<leader>',
  },
}
