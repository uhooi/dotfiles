require('xcodebuild').setup()

vim.keymap.set('n', '<Leader>xl', '<Cmd>XcodebuildToggleLogs<CR>', { desc = 'Toggle Xcodebuild Logs' })
vim.keymap.set('n', '<Leader>xb', '<Cmd>XcodebuildBuild<CR>', { desc = 'Build Project' })
vim.keymap.set('n', '<Leader>xr', '<Cmd>XcodebuildBuildRun<CR>', { desc = 'Build & Run Project' })
vim.keymap.set('n', '<Leader>xR', '<Cmd>XcodebuildRun<CR>', { desc = 'Run Project Without Building' })
vim.keymap.set('n', '<Leader>xc', '<Cmd>XcodebuildCancel<CR>', { desc = 'Cancel Currently Running Action' })
vim.keymap.set('n', '<Leader>xt', '<Cmd>XcodebuildTest<CR>', { desc = 'Run Tests' })
vim.keymap.set('n', '<Leader>xT', '<Cmd>XcodebuildTestClass<CR>', { desc = 'Run This Test Class' })
vim.keymap.set('n', '<Leader>X', '<Cmd>XcodebuildPicker<CR>', { desc = 'Show All Xcodebuild Actions' })
vim.keymap.set('n', '<Leader>xd', '<Cmd>XcodebuildSelectDevice<CR>', { desc = 'Select Device' })
vim.keymap.set('n', '<Leader>xp', '<Cmd>XcodebuildSelectTestPlan<CR>', { desc = 'Select Test Plan' })
vim.keymap.set('n', '<Leader>xu', '<Cmd>XcodebuildUninstall<CR>', { desc = 'Uninstall App' })
vim.keymap.set('n', '<Leader>xs', '<Cmd>XcodebuildShowConfig<CR>', { desc = 'Print Current Project Configuration' })
vim.keymap.set('n', '<Leader>xq', '<Cmd>Telescope quickfix<CR>', { desc = 'Show QuickFix List' })