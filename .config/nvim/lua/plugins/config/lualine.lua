local lsp_names = function()
  local clients = {}
  for _, client in ipairs(vim.lsp.get_active_clients { bufnr = 0 }) do
    if client.name == 'null-ls' then
      local sources = {}
      for _, source in ipairs(require('null-ls.sources').get_available(vim.bo.filetype)) do
        table.insert(sources, source.name)
      end
      table.insert(clients, 'null-ls(' .. table.concat(sources, ', ') .. ')')
    else
      table.insert(clients, client.name)
    end
  end
  return ' ' .. table.concat(clients, ', ')
end

require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {},
    lualine_x = { lsp_names },
    lualine_y = { 'encoding', 'fileformat', 'filetype' },
    lualine_z = { 'progress', 'location' },
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' },
  },
  -- dropbar.nvim uses winbar, so lualine does not use it
  -- winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
}
