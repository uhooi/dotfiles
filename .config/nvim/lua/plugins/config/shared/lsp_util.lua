local M = {}

function M:names()
  local icon = require('plugins.config.shared.icon')
  local clients = vim
    .iter(vim.lsp.get_clients { bufnr = 0 })
    :map(function(client)
      if client.name == 'null-ls' then
        return ('null-ls[%s](' .. client.id .. ')'):format(table.concat(
          vim
            .iter(require('null-ls.sources').get_available(vim.bo.filetype))
            :map(function(source)
              return source.name
            end)
            :totable(),
          ' '
        ))
      else
        return client.name .. '(' .. client.id .. ')'
      end
    end)
    :totable()
  if not next(clients) then
    return ''
  else
    return icon.lsp .. ' ' .. table.concat(clients, ' ')
  end
end

return M
