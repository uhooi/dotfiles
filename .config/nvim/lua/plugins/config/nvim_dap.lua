local dap = require('dap')
local dap_ui_widgets = require('dap.ui.widgets')
local xcodebuild = require('xcodebuild.integrations.dap')

xcodebuild.setup('')
dap.adapters.codelldb = xcodebuild.get_codelldb_adapter(
  vim.fn.exepath('codelldb'),
  '/Applications/Xcode-16.2.0.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB'
)

-- TokyoNight
-- vim.api.nvim_set_hl(0, 'DapIcon', { fg = '#179FFF' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { bg = '#003D66' })

-- Dayfox
vim.cmd([[highlight link DapIcon Text]])
vim.cmd([[highlight link DapStopped CursorLine]])

vim.fn.sign_define('DapBreakpoint', { text = '󰌕', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-label
vim.fn.sign_define('DapBreakpointCondition', { text = '󰌖', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-label_outline
vim.fn.sign_define('DapLogPoint', { text = '󱋪', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-label_percent
vim.fn.sign_define('DapStopped', { text = '󰜴', texthl = 'DapIcon', linehl = 'DapStopped', numhl = '' }) -- nf-md-arrow_right_bold
vim.fn.sign_define('DapBreakpointRejected', { text = '󰫋', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-label_off

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>dB', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<Leader>dr', dap.repl.open)
vim.keymap.set('n', '<Leader>dl', dap.run_last)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', dap_ui_widgets.hover)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', dap_ui_widgets.preview)
vim.keymap.set('n', '<Leader>df', function()
  dap_ui_widgets.centered_float(dap_ui_widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
end)

vim.keymap.set('n', '<Leader>dd', xcodebuild.build_and_debug, { desc = 'Build & Debug' })
vim.keymap.set('n', '<Leader>dR', xcodebuild.debug_without_build, { desc = 'Debug Without Building' })
vim.keymap.set('n', '<Leader>dt', xcodebuild.debug_tests, { desc = 'Debug Tests' })
vim.keymap.set('n', '<Leader>dT', xcodebuild.debug_class_tests, { desc = 'Debug Class Tests' })
vim.keymap.set('n', '<Leader>dx', xcodebuild.terminate_session, { desc = 'Terminate Debugger' })
