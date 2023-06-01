-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
-- telescope.load_extension('noice') -- FIXME: Error

-- ref: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-esc-to-quit-in-insert-mode
local telescope_actions = require('telescope.actions')
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<Esc>'] = telescope_actions.close,
      },
    },
  },
}

local telescope_builtin = require('telescope.builtin')

local function get_git_root()
  local filepath = vim.api.nvim_buf_get_name(0)
  local dirpath = vim.fs.dirname(filepath)
  return vim.fs.find('.git', { path = dirpath, upward = true })[2]
end

-- ref: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#live-grep-from-project-git-root-with-fallback
local function live_grep_from_git_root()
  local opts = {}
  if get_git_root() then
    opts = { cwd = get_git_root() }
  end

  telescope_builtin.live_grep(opts)
end

local function grep_string_from_git_root()
  local opts = {}
  if get_git_root() then
    opts = { cwd = get_git_root() }
  end

  telescope_builtin.grep_string(opts)
end

vim.keymap.set('n', '<Leader>f', telescope_builtin.git_files)
vim.keymap.set('n', '<Leader>g', live_grep_from_git_root)
vim.keymap.set('n', '<Leader>G', grep_string_from_git_root)
vim.keymap.set('n', '<Leader>b', telescope_builtin.buffers)
vim.keymap.set('n', '<Leader>h', telescope_builtin.help_tags)
vim.keymap.set('n', '<Leader>n', '<Cmd>Noice telescope<CR>')
