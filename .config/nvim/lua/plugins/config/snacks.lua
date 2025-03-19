local snacks = require('snacks')

snacks.setup {
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = false }, -- Use nvim-notify
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

-- Keymaps {{{
-- Top Pickers & Explorer
vim.keymap.set('n', '<Leader><Space>', snacks.picker.smart)
-- vim.keymap.set('n', '<Leader>,', snacks.picker.buffers)
vim.keymap.set('n', '<Leader>/', snacks.picker.grep)
vim.keymap.set('n', '<Leader>:', snacks.picker.command_history)
-- vim.keymap.set('n', '<Leader>n', snacks.picker.notifications) -- TODO: Conflicting keymap
vim.keymap.set('n', '<Leader>e', snacks.picker.explorer)
-- Find
vim.keymap.set('n', '<Leader>fb', snacks.picker.buffers)
vim.keymap.set('n', '<Leader>fc', snacks.picker.smart)
vim.keymap.set('n', '<Leader>ff', snacks.picker.smart)
vim.keymap.set('n', '<Leader>fg', snacks.picker.git_files)
vim.keymap.set('n', '<Leader>fp', snacks.picker.projects)
vim.keymap.set('n', '<Leader>fr', snacks.picker.recent)
-- Git
vim.keymap.set('n', '<Leader>gb', snacks.picker.git_branches)
vim.keymap.set('n', '<Leader>gl', snacks.picker.git_log)
vim.keymap.set('n', '<Leader>gL', snacks.picker.git_log_line)
vim.keymap.set('n', '<Leader>gs', snacks.picker.git_status)
vim.keymap.set('n', '<Leader>gS', snacks.picker.git_stash)
vim.keymap.set('n', '<Leader>gd', snacks.picker.git_diff)
vim.keymap.set('n', '<Leader>gf', snacks.picker.git_log_file)
-- Grep
vim.keymap.set('n', '<Leader>sb', snacks.picker.lines)
vim.keymap.set('n', '<Leader>sB', snacks.picker.grep_buffers)
vim.keymap.set('n', '<Leader>sg', snacks.picker.grep)
vim.keymap.set('n', '<Leader>sw', snacks.picker.grep_word)
-- Search
-- vim.keymap.set('n', '<Leader>s', snacks.picker.registers)
vim.keymap.set('n', '<Leader>s/', snacks.picker.search_history)
vim.keymap.set('n', '<Leader>sa', snacks.picker.autocmds)
vim.keymap.set('n', '<Leader>sb', snacks.picker.lines)
vim.keymap.set('n', '<Leader>sc', snacks.picker.command_history)
vim.keymap.set('n', '<Leader>sC', snacks.picker.commands)
vim.keymap.set('n', '<Leader>sd', snacks.picker.diagnostics)
-- vim.keymap.set('n', '<Leader>sD', snacks.picker.diagnostics_buffer) -- FIXME: No results found for 'diagnostics_buffer'
vim.keymap.set('n', '<Leader>sh', snacks.picker.help)
vim.keymap.set('n', '<Leader>sH', snacks.picker.highlights)
vim.keymap.set('n', '<Leader>si', snacks.picker.icons)
vim.keymap.set('n', '<Leader>sj', snacks.picker.jumps)
vim.keymap.set('n', '<Leader>sk', snacks.picker.keymaps)
-- vim.keymap.set('n', '<Leader>sl', snacks.picker.loclist) -- FIXME: No results found for 'loclist'
vim.keymap.set('n', '<Leader>sm', snacks.picker.marks)
vim.keymap.set('n', '<Leader>sM', snacks.picker.man)
-- vim.keymap.set('n', '<Leader>sp', snacks.picker.lazy) -- FIXME: No results found for 'lazy'
vim.keymap.set('n', '<Leader>sq', snacks.picker.qflist) -- FIXME: No results found for 'qflist'
vim.keymap.set('n', '<Leader>sR', snacks.picker.resume)
vim.keymap.set('n', '<Leader>su', snacks.picker.undo)
vim.keymap.set('n', '<Leader>uC', snacks.picker.colorschemes)
-- Other
-- vim.keymap.set('n', '<Leader>z', snacks.zen) -- FIXME: Not found
vim.keymap.set('n', '<Leader>Z', snacks.zen.zoom)
-- vim.keymap.set('n', '<Leader>.', snacks.scratch)
vim.keymap.set('n', '<Leader>S', snacks.scratch.select) -- FIXME: No results found for 'select'
-- vim.keymap.set('n', '<Leader>n', snacks.notifier.show_history) -- TODO: Conflicting keymap
-- vim.keymap.set('n', '<Leader>bd', snacks.bufdelete) -- FIXME: Not found
vim.keymap.set('n', '<Leader>cR', snacks.rename.rename_file)
-- vim.keymap.set('n', '<Leader>gB', snacks.gitbrowse) -- FIXME: Not found
-- vim.keymap.set('n', '<Leader>gg', snacks.lazygit) -- FIXME: Not found
vim.keymap.set('n', '<Leader>un', snacks.notifier.hide)
-- vim.keymap.set('n', '<C-/>', snacks.terminal) -- FIXME: Not found
-- vim.keymap.set('n', '<C-_>', snacks.terminal) -- FIXME: Not found
