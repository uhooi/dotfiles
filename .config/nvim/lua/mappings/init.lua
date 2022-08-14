-- ref: https://github.com/willelz/nvim-lua-guide-ja/blob/1df9965cc2192aad67d23479cf064df7ced2f792/README.ja.md#vimkeymap
--    : https://neovim.io/doc/user/map.html#:map-arguments
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/core/options/mapping.lua
--    : https://github.com/craftzdog/dotfiles-public/blob/50344f53c96c241e6d0659ed19507c70771bd971/.config/nvim/lua/maps.lua

vim.keymap.set('', 'H', '0', { noremap = true })
vim.keymap.set('', 'L', '$', { noremap = true })
vim.keymap.set('', '0', 'H', { noremap = true })
vim.keymap.set('', '$', 'L', { noremap = true })

-- Disable Arrow keys
vim.keymap.set('', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Down>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Right>', '<Nop>', { noremap = true })

-- TODO: E81: スクリプト以外で<SID>が使われました
--vim.keymap.set('n', 'gj', 'gj<SID>g')
--vim.keymap.set('n', 'gk', 'gk<SID>g')
--vim.keymap.set('n', '<SID>gj', 'gj<SID>g', { noremap = true, script = true })
--vim.keymap.set('n', '<SID>gk', 'gk<SID>g', { noremap = true, script = true })
--vim.keymap.set('n', '<SID>g', '<Nop>')
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'gj', 'j', { noremap = true })
vim.keymap.set('n', 'gk', 'k', { noremap = true })

vim.keymap.set('n', 'Y', 'y$', { noremap = true })

vim.keymap.set('n', 'p', ']p', { noremap = true })
vim.keymap.set('n', 'P', ']P', { noremap = true })
vim.keymap.set('n', ']p', 'p', { noremap = true })
vim.keymap.set('n', ']P', 'P', { noremap = true })

vim.keymap.set('n', '+', '<C-a>', { noremap = true })
vim.keymap.set('n', '-', '<C-x>', { noremap = true })
vim.keymap.set('n', '<C-a>', '+', { noremap = true })
vim.keymap.set('n', '<C-x>', '-', { noremap = true })

-- Windows
vim.keymap.set('n', 'sh', '<C-w>h', { noremap = true })
vim.keymap.set('n', 'sj', '<C-w>j', { noremap = true })
vim.keymap.set('n', 'sk', '<C-w>k', { noremap = true })
vim.keymap.set('n', 'sl', '<C-w>l', { noremap = true })
vim.keymap.set('n', 'sw', '<C-w>w', { noremap = true })
vim.keymap.set('n', 'sr', '<C-w>r', { noremap = true })
vim.keymap.set('n', 'sH', '<C-w>H', { noremap = true })
vim.keymap.set('n', 'sJ', '<C-w>J', { noremap = true })
vim.keymap.set('n', 'sK', '<C-w>K', { noremap = true })
vim.keymap.set('n', 'sL', '<C-w>L', { noremap = true })
vim.keymap.set('n', 'ss', '<C-w>s', { noremap = true })
vim.keymap.set('n', 'sv', '<C-w>v', { noremap = true })
-- TODO: E81: スクリプト以外で<SID>が使われました
--vim.keymap.set('n', 's+', '<C-w>+')
--vim.keymap.set('n', 's-', '<C-w>-')
--vim.keymap.set('n', 's>', '<C-w>>')
--vim.keymap.set('n', 's<', '<C-w><')
--vim.keymap.set('n', 's', '<Nop>')
--vim.keymap.set('n', '<C-w>+', '<C-w>+<SID>ws')
--vim.keymap.set('n', '<C-w>-', '<C-w>-<SID>ws')
--vim.keymap.set('n', '<C-w>>', '<C-w>><SID>ws')
--vim.keymap.set('n', '<C-w><', '<C-w><<SID>ws')
--vim.keymap.set('n', '<SID>ws+', '<C-w>+<SID>ws', { noremap = true, script = true })
--vim.keymap.set('n', '<SID>ws-', '<C-w>-<SID>ws', { noremap = true, script = true })
--vim.keymap.set('n', '<SID>ws>', '<C-w>><SID>ws', { noremap = true, script = true })
--vim.keymap.set('n', '<SID>ws<', '<C-w><<SID>ws', { noremap = true, script = true })
--vim.keymap.set('n', '<SID>ws', '<Nop>')
vim.keymap.set('n', 's+', '<C-w>+', { noremap = true })
vim.keymap.set('n', 's-', '<C-w>-', { noremap = true })
vim.keymap.set('n', 's>', '<C-w>>', { noremap = true })
vim.keymap.set('n', 's<', '<C-w><', { noremap = true })
vim.keymap.set('n', 's', '<Nop>', { noremap = true })

vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true })
if vim.fn.has('mac') == 0 then
  vim.keymap.set('i', '<Left>', '<Nop>', { noremap = true })
  vim.keymap.set('i', '<Down>', '<Nop>', { noremap = true })
  vim.keymap.set('i', '<Up>', '<Nop>', { noremap = true })
  vim.keymap.set('i', '<Right>', '<Nop>', { noremap = true })
end

vim.keymap.set('x', '<', '<gv', { noremap = true })
vim.keymap.set('x', '>', '>gv', { noremap = true })

