-- ref: https://github.com/willelz/nvim-lua-guide-ja/blob/1df9965cc2192aad67d23479cf064df7ced2f792/README.ja.md#vimkeymap
--    : https://neovim.io/doc/user/map.html#:map-arguments
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/core/options/mapping.lua
--    : https://github.com/craftzdog/dotfiles-public/blob/50344f53c96c241e6d0659ed19507c70771bd971/.config/nvim/lua/maps.lua

vim.keymap.set('', 'H', '0')
vim.keymap.set('', 'L', '$')
vim.keymap.set('', '0', 'H')
vim.keymap.set('', '$', 'L')

local arrow_keys_desc = 'Disable Arrow keys'
vim.keymap.set('', '<Left>', '<Nop>', { desc = arrow_keys_desc })
vim.keymap.set('', '<Down>', '<Nop>', { desc = arrow_keys_desc })
vim.keymap.set('', '<Up>', '<Nop>', { desc = arrow_keys_desc })
vim.keymap.set('', '<Right>', '<Nop>', { desc = arrow_keys_desc })

-- TODO: E81: スクリプト以外で<SID>が使われました
--vim.keymap.set('n', 'gj', 'gj<SID>g', { remap = true })
--vim.keymap.set('n', 'gk', 'gk<SID>g', { remap = true })
--vim.keymap.set('n', '<SID>gj', 'gj<SID>g', { script = true })
--vim.keymap.set('n', '<SID>gk', 'gk<SID>g', { script = true })
--vim.keymap.set('n', '<SID>g', '<Nop>', { remap = true })
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')

vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('n', 'p', ']p')
vim.keymap.set('n', 'P', ']P')
vim.keymap.set('n', ']p', 'p')
vim.keymap.set('n', ']P', 'P')

-- Use dial.nvim
-- vim.keymap.set('n', '+', '<C-a>')
-- vim.keymap.set('n', '-', '<C-x>')
vim.keymap.set('n', '<C-a>', '+')
vim.keymap.set('n', '<C-x>', '-')

-- Windows
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sw', '<C-w>w')
vim.keymap.set('n', 'sr', '<C-w>r')
vim.keymap.set('n', 'sH', '<C-w>H')
vim.keymap.set('n', 'sJ', '<C-w>J')
vim.keymap.set('n', 'sK', '<C-w>K')
vim.keymap.set('n', 'sL', '<C-w>L')
vim.keymap.set('n', 'ss', '<C-w>s')
vim.keymap.set('n', 'sv', '<C-w>v')
-- TODO: E81: スクリプト以外で<SID>が使われました
--vim.keymap.set('n', 's+', '<C-w>+', { remap = true })
--vim.keymap.set('n', 's-', '<C-w>-', { remap = true })
--vim.keymap.set('n', 's>', '<C-w>>', { remap = true })
--vim.keymap.set('n', 's<', '<C-w><', { remap = true })
--vim.keymap.set('n', 's', '<Nop>', { remap = true })
--vim.keymap.set('n', '<C-w>+', '<C-w>+<SID>ws', { remap = true })
--vim.keymap.set('n', '<C-w>-', '<C-w>-<SID>ws', { remap = true })
--vim.keymap.set('n', '<C-w>>', '<C-w>><SID>ws', { remap = true })
--vim.keymap.set('n', '<C-w><', '<C-w><<SID>ws', { remap = true })
--vim.keymap.set('n', '<SID>ws+', '<C-w>+<SID>ws', { script = true })
--vim.keymap.set('n', '<SID>ws-', '<C-w>-<SID>ws', { script = true })
--vim.keymap.set('n', '<SID>ws>', '<C-w>><SID>ws', { script = true })
--vim.keymap.set('n', '<SID>ws<', '<C-w><<SID>ws', { script = true })
--vim.keymap.set('n', '<SID>ws', '<Nop>', { remap = true })
vim.keymap.set('n', 's+', '<C-w>+')
vim.keymap.set('n', 's-', '<C-w>-')
vim.keymap.set('n', 's>', '<C-w>>')
vim.keymap.set('n', 's<', '<C-w><')
vim.keymap.set('n', 's', '<Nop>')

if vim.fn.has('mac') == 0 then
  vim.keymap.set('i', '<Left>', '<Nop>')
  vim.keymap.set('i', '<Down>', '<Nop>')
  vim.keymap.set('i', '<Up>', '<Nop>')
  vim.keymap.set('i', '<Right>', '<Nop>')
end

vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- vim: set foldmethod=marker:
