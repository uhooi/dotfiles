local dap = require('dap')
local xcodebuild_dap = require('xcodebuild.dap')

dap.configurations.swift = {
  {
    name = 'iOS App Debugger',
    type = 'codelldb',
    request = 'attach',
    pid = xcodebuild_dap.wait_for_pid,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
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
      '/Applications/Xcode-15.0.1.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB',
    },
  },
}

vim.keymap.set('n', '<leader>R', function()
  xcodebuild_dap.build_and_run(function()
    dap.continue()
  end)
end)
