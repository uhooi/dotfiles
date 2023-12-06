-- ref: https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/init.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/telescope/config.lua

local telescope = require('telescope')

-- Setup {{{
-- ref: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-esc-to-quit-in-insert-mode
local telescope_actions = require('telescope.actions')
telescope.setup {
  defaults = {
    winblend = 10,
    prompt_prefix = '❯❯❯ ',
    selection_caret = '❯ ',
    dynamic_preview_title = true,
    mappings = {
      i = {
        ['<Esc>'] = telescope_actions.close,
      },
    },
    -- ref: https://github.com/nvim-telescope/telescope.nvim/issues/1173
    --    : https://github.com/nvim-telescope/telescope.nvim/blob/9a82b5b73eba8c8d71bacedd062d20fe6d3c791a/doc/telescope.txt#L529-L547
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
  },
  extensions = {
    frecency = {
      show_scores = true,
    },
    import = {
      insert_at_top = false,
      custom_languages = {
        {
          regex = [[^import\s+(\w+)\s*$]],
          filetypes = { 'swift' },
          extensions = { 'swift' },
        },
      },
    },
  },
}
-- }}}

-- Functions {{{
local telescope_builtin = require('telescope.builtin')

local function get_git_dirpath()
  local filepath = vim.api.nvim_buf_get_name(0)
  local dirpath = vim.fs.dirname(filepath)
  return vim.fs.find('.git', {
    path = dirpath,
    upward = true,
    stop = vim.uv.os_homedir(),
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

  telescope.extensions.egrepify.egrepify(opts)
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
-- }}}

-- Keymaps {{{
vim.keymap.set('n', '<Leader>F', project_files)
vim.keymap.set('n', '<Leader>f', live_grep_from_project)
vim.keymap.set('n', '<Leader>G', grep_string_from_project)
vim.keymap.set('n', '<Leader>b', telescope_builtin.buffers)
vim.keymap.set('n', '<Leader>r', telescope.extensions.frecency.frecency)
vim.keymap.set('n', '<Leader>hc', telescope_builtin.command_history)
vim.keymap.set('n', '<Leader>hs', telescope_builtin.search_history)
vim.keymap.set('n', '<Leader>H', telescope_builtin.help_tags)
vim.keymap.set('n', '<Leader>n', '<Cmd>Telescope notify<CR>')
vim.keymap.set('n', '<Leader>gc', telescope_builtin.git_commits)
vim.keymap.set('n', '<Leader>gf', telescope_builtin.git_bcommits)
vim.keymap.set('n', '<Leader>gb', telescope_builtin.git_branches)
vim.keymap.set('n', '<Leader>gs', telescope_builtin.git_status)
vim.keymap.set('n', '<Leader>gt', telescope_builtin.git_stash)
vim.keymap.set('n', '<Leader>gl', '<Cmd>Telescope ghq list<CR>')
vim.keymap.set('n', '<Leader>i', '<Cmd>Telescope import<CR>')
--- }}}

-- Extensions {{{
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('frecency')
telescope.load_extension('ghq')
telescope.load_extension('egrepify')
telescope.load_extension('import')
-- }}}
