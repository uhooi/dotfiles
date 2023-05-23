local lsp_names = {
  function()
    local servers = vim
        .iter(vim.lsp.get_active_clients { bufnr = 0 })
        :map(function(server)
          if server.name == 'null-ls' then
            return ('null-ls(%s)'):format(table.concat(
              vim
              .iter(require('null-ls.sources').get_available(vim.bo.filetype))
              :map(function(source)
                return source.name
              end)
              :totable(),
              ','
            ))
          else
            return server.name
          end
        end)
        :totable()
    return table.concat(servers, ', ')
  end,
}

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
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      'navic',
      color_correction = nil,
      navic_opts = nil,
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
