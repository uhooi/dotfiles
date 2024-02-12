local dap = require('dap')
local dap_ui_widgets = require('dap.ui.widgets')
local xcodebuild_dap = require('xcodebuild.dap')

dap.configurations.swift = {
  {
    name = 'iOS App Debugger',
    type = 'codelldb',
    request = 'attach',
    program = xcodebuild_dap.get_program_path,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    waitFor = true,
  },
}

dap.adapters.codelldb = {
  type = 'server',
  port = '13000',
  executable = {
    command = vim.fn.exepath('codelldb'),
    args = {
      '--port',
      '13000',
      '--liblldb',
      '/Applications/Xcode-15.2.0.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB',
    },
  },
}

vim.api.nvim_set_hl(0, 'DapIcon', { fg = '#179FFF' })
vim.api.nvim_set_hl(0, 'DapStopped', { bg = '#003D66' })
vim.fn.sign_define('DapBreakpoint', { text = '󰜴', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-arrow_right_bold
vim.fn.sign_define('DapBreakpointCondition', { text = '󰁗', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-arrow_right_bold_circle_outline
vim.fn.sign_define('DapLogPoint', { text = '󰜶', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-arrow_right_bold_box_outline
vim.fn.sign_define('DapStopped', { text = '❯', texthl = 'DapIcon', linehl = 'DapStopped', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '󰧂', texthl = 'DapIcon', linehl = '', numhl = '' }) -- nf-md-arrow_right_bold_outline

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

vim.keymap.set('n', '<Leader>dd', xcodebuild_dap.build_and_debug, { desc = 'Build & Debug' })
vim.keymap.set('n', '<Leader>dR', xcodebuild_dap.debug_without_build, { desc = 'Debug Without Building' })
vim.keymap.set('n', '<Leader>dt', xcodebuild_dap.debug_tests, { desc = 'Debug Tests' })
