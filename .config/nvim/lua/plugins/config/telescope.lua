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

local function get_git_dirpath()
  local filepath = vim.api.nvim_buf_get_name(0)
  local dirpath = vim.fs.dirname(filepath)
  return vim.fs.find('.git', {
    path = dirpath,
    upward = true,
    stop = vim.loop.os_homedir(),
    type = 'directory',
  })[1]
end

-- ref: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
local function project_files()
  if get_git_dirpath() then
    return telescope_builtin.git_files()
  else
    return telescope_builtin.find_files()
  end
end

-- ref: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#live-grep-from-project-git-root-with-fallback
local function live_grep_from_project()
  local opts = {}
  local git_dirpath = get_git_dirpath()
  if git_dirpath then
    local git_root = vim.fs.dirname(git_dirpath)
    opts = { cwd = git_root }
  end

  telescope_builtin.live_grep(opts)
end

local function grep_string_from_project()
  local opts = {}
  local git_dirpath = get_git_dirpath()
  if git_dirpath then
    local git_root = vim.fs.dirname(git_dirpath)
    opts = { cwd = git_root }
  end

  telescope_builtin.grep_string(opts)
end

vim.keymap.set('n', '<Leader>F', project_files)
vim.keymap.set('n', '<Leader>f', live_grep_from_project) -- FIXME: Not searched recursively
vim.keymap.set('n', '<Leader>G', grep_string_from_project) -- FIXME: Not searched recursively
vim.keymap.set('n', '<Leader>b', telescope_builtin.buffers)
vim.keymap.set('n', '<Leader>h', telescope_builtin.help_tags)
vim.keymap.set('n', '<Leader>n', '<Cmd>Noice telescope<CR>')
vim.keymap.set('n', '<Leader>gc', telescope_builtin.git_commits)
vim.keymap.set('n', '<Leader>gf', telescope_builtin.git_bcommits)
vim.keymap.set('n', '<Leader>gb', telescope_builtin.git_branches)
vim.keymap.set('n', '<Leader>gs', telescope_builtin.git_status)
vim.keymap.set('n', '<Leader>gt', telescope_builtin.git_stash)
