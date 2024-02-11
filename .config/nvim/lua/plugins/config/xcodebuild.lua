require('xcodebuild').setup()

vim.keymap.set('n', '<Leader>X', '<Cmd>XcodebuildPicker<CR>', { desc = 'Show All Xcodebuild Actions' })
vim.keymap.set('n', '<Leader>xf', '<Cmd>XcodebuildProjectManager<CR>', { desc = 'Show Project Manager Actions' })

vim.keymap.set('n', '<Leader>xb', '<Cmd>XcodebuildBuild<CR>', { desc = 'Build Project' })
vim.keymap.set('n', '<Leader>xB', '<Cmd>XcodebuildBuildForTesting<CR>', { desc = 'Build For Testing' })
vim.keymap.set('n', '<Leader>xr', '<Cmd>XcodebuildBuildRun<CR>', { desc = 'Build & Run Project' })
vim.keymap.set('n', '<Leader>xR', '<Cmd>XcodebuildRun<CR>', { desc = 'Run Project Without Building' })
vim.keymap.set('n', '<Leader>x.', '<Cmd>XcodebuildCancel<CR>', { desc = 'Cancel Currently Running Action' })

vim.keymap.set('n', '<Leader>xt', '<Cmd>XcodebuildTest<CR>', { desc = 'Run Tests' })
vim.keymap.set('v', '<Leader>xt', '<Cmd>XcodebuildTestSelected<CR>', { desc = 'Run Selected Tests' })
vim.keymap.set('n', '<Leader>xT', '<Cmd>XcodebuildTestClass<CR>', { desc = 'Run This Test Class' })

vim.keymap.set('n', '<Leader>xl', '<Cmd>XcodebuildToggleLogs<CR>', { desc = 'Toggle Xcodebuild Logs' })
vim.keymap.set('n', '<Leader>xc', '<Cmd>XcodebuildToggleCodeCoverage<CR>', { desc = 'Toggle Code Coverage' })
vim.keymap.set('n', '<Leader>xC', '<Cmd>XcodebuildShowCodeCoverageReport<CR>', { desc = 'Show Code Coverage Report' })
vim.keymap.set('n', '<Leader>xe', '<Cmd>XcodebuildTestExplorerToggle<CR>', { desc = 'Toggle Test Explorer' })
vim.keymap.set('n', '<Leader>xs', '<Cmd>XcodebuildFailingSnapshots<CR>', { desc = 'Show Failing Snapshots' })

vim.keymap.set('n', '<Leader>xd', '<Cmd>XcodebuildSelectDevice<CR>', { desc = 'Select Device' })
vim.keymap.set('n', '<Leader>xp', '<Cmd>XcodebuildSelectTestPlan<CR>', { desc = 'Select Test Plan' })
vim.keymap.set('n', '<Leader>xu', '<Cmd>XcodebuildUninstall<CR>', { desc = 'Uninstall App' })
vim.keymap.set('n', '<Leader>xo', '<Cmd>XcodebuildShowConfig<CR>', { desc = 'Print Current Project Configuration' })
vim.keymap.set('n', '<Leader>xq', '<Cmd>Telescope quickfix<CR>', { desc = 'Show QuickFix List' })
