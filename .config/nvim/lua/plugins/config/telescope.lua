-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
-- FIXME: Error
--telescope.load_extension('noice')

-- ref: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#live-grep-from-project-git-root-with-fallback
local function live_grep_from_git_root()
  local filepath = vim.api.nvim_buf_get_name(0)
  local dirpath = vim.fs.dirname(filepath)
  local git_root = vim.fs.find('.git', { path = dirpath, upward = true })[2]

  local opts = {}
  if git_root then
    opts = { cwd = git_root }
  end

  require('telescope.builtin').live_grep(opts)
end

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', telescope_builtin.git_files)
vim.keymap.set('n', '<Leader>g', live_grep_from_git_root)
vim.keymap.set('n', '<Leader>b', telescope_builtin.buffers)
vim.keymap.set('n', '<Leader>h', telescope_builtin.help_tags)
vim.keymap.set('n', '<Leader>n', '<Cmd>Noice telescope<CR>')
