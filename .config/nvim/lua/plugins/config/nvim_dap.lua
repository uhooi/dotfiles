local dap = require('dap')
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
    command = '~/codelldb-aarch64-darwin/extension/adapter/codelldb',
    args = {
      '--port',
      '13000',
      '--liblldb',
      '/Applications/Xcode-15.2.0.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB',
    },
  },
}

vim.keymap.set('n', '<Leader>R', function()
  xcodebuild_dap.build_and_debug(function()
    dap.continue()
  end)
end)

vim.keymap.set('n', '<Leader>dd', xcodebuild_dap.build_and_debug, { desc = 'Build & Debug' })
vim.keymap.set('n', '<Leader>dr', xcodebuild_dap.debug_without_build, { desc = 'Debug Without Building' })
vim.keymap.set('n', '<Leader>dt', xcodebuild_dap.debug_tests, { desc = 'Debug Tests' })
