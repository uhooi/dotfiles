local M = {}

function M:destination()
  if vim.g.xcodebuild_platform == nil then
    return ''
  end

  if vim.g.xcodebuild_platform == 'macOS' then
    return '  macOS'
  else
    if vim.g.xcodebuild_device_name == nil or vim.g.xcodebuild_os == nil then
      return ' No device selected'
    else
      return ' ' .. vim.g.xcodebuild_device_name .. ' (' .. vim.g.xcodebuild_os .. ')'
    end
  end
end

return M
