-- ref: https://github.com/MunifTanjim/nougat.nvim/blob/5f6ee8ebe28496b9976f838d9df32b05e611835a/examples/bubbly.lua

-- modules {{{
local Bar = require('nougat.bar')
local bar_util = require('nougat.bar.util')
local Item = require('nougat.item')
local sep = require('nougat.separator')
local icon = require('plugins.config.shared.icon')
local skkeleton_util = require('plugins.config.shared.skkeleton_util')
local lsp_util = require('plugins.config.shared.lsp_util')
local char_util = require('plugins.config.shared.char_util')
-- }}}

-- nut {{{
local nut = {
  buf = {
    diagnostic_count = require('nougat.nut.buf.diagnostic_count').create,
    filetype = require('nougat.nut.buf.filetype').create,
  },
  git = {
    branch = require('nougat.nut.git.branch').create,
    status = require('nougat.nut.git.status'),
  },
  mode = require('nougat.nut.mode').create,
  spacer = require('nougat.nut.spacer').create,
  truncation_point = require('nougat.nut.truncation_point').create,
}
-- }}}

-- color {{{
local color = {
  bg = '#1d2021',
  bg0_h = '#1d2021',
  bg0 = '#282828',
  bg0_s = '#32302f',
  bg1 = '#3c3836',
  bg2 = '#504945',
  bg3 = '#665c54',
  bg4 = '#7c6f64',

  gray = '#928374',

  fg = '#ebdbb2',
  fg0 = '#fbf1c7',
  fg1 = '#ebdbb2',
  fg2 = '#d5c4a1',
  fg3 = '#bdae93',
  fg4 = '#a89984',

  lightgray = '#a89984',

  red = '#fb4934',
  green = '#b8bb26',
  yellow = '#fabd2f',
  blue = '#83a598',
  purple = '#d3869b',
  aqua = '#8ec07c',
  orange = '#f38019',

  accent = {
    red = '#cc241d',
    green = '#98971a',
    yellow = '#d79921',
    blue = '#458588',
    purple = '#b16286',
    aqua = '#689d6a',
    orange = '#d65d0e',
  },
}
-- }}}

-- mode {{{
local mode = nut.mode {
  sep_left = sep.left_half_circle_solid(true),
  sep_right = sep.right_half_circle_solid(true),
  config = {
    highlight = {
      normal = {
        bg = 'fg',
        fg = color.bg,
      },
      visual = {
        bg = color.orange,
        fg = color.bg,
      },
      insert = {
        bg = color.blue,
        fg = color.bg,
      },
      replace = {
        bg = color.purple,
        fg = color.bg,
      },
      commandline = {
        bg = color.green,
        fg = color.bg,
      },
      terminal = {
        bg = color.accent.green,
        fg = color.bg,
      },
      inactive = {},
    },
  },
}
-- }}}

-- skkeleton {{{
local skkeleton = (function()
  local item = Item {
    sep_left = sep.left_half_circle_solid(true),
    hidden = function(_, _)
      return vim.api.nvim_get_mode().mode ~= 'i'
    end,
    content = {
      Item {
        hl = { bg = color.orange, fg = color.bg },
        content = skkeleton_util.get_mode,
        suffix = ' ',
      },
      Item {
        hl = { bg = color.yellow, fg = color.bg },
        prefix = ' ',
        content = skkeleton_util.get_state,
      },
    },
    sep_right = sep.right_half_circle_solid(true),
  }

  return item
end)()
-- }}}

-- file status {{{
local file_status = (function()
  local item = Item {
    prepare = function(_, ctx)
      local bufnr, data = ctx.bufnr, ctx.ctx
      data.readonly = vim.api.nvim_buf_get_option(bufnr, 'readonly')
      data.modifiable = vim.api.nvim_buf_get_option(bufnr, 'modifiable')
      data.modified = vim.api.nvim_buf_get_option(bufnr, 'modified')
    end,
    sep_left = sep.left_half_circle_solid(true),
    content = {
      Item {
        hl = { bg = color.bg4, fg = color.fg },
        hidden = function(_, ctx)
          return not ctx.ctx.readonly
        end,
        content = 'RO',
      },
      Item {
        hl = { bg = color.bg4, fg = color.fg },
        hidden = function(_, ctx)
          return ctx.ctx.modifiable
        end,
        content = '',
      },
      Item {
        hl = { bg = color.bg4, fg = color.fg },
        hidden = function(_, ctx)
          return not ctx.ctx.modified
        end,
        content = '+',
      },
    },
    sep_right = sep.right_half_circle_solid(true),
  }

  return item
end)()
-- }}}

-- datetime {{{
local datetime = (function()
  local item = Item {
    sep_left = sep.left_half_circle_solid(true),
    content = {
      Item {
        hl = { bg = color.green, fg = color.bg },
        content = function()
          return vim.fn.strftime('%H:%M')
        end,
      },
    },
    sep_right = sep.right_half_circle_solid(true),
  }

  return item
end)()
-- }}}

-- lsp info {{{
local lsp_info = (function()
  local item = Item {
    sep_left = sep.left_half_circle_solid(true),
    content = {
      Item {
        hl = { bg = color.aqua, fg = color.bg },
        hidden = function(_, _)
          return lsp_util.names == ''
        end,
        content = lsp_util.names,
      },
    },
    sep_right = sep.right_half_circle_solid(true),
  }

  return item
end)()
-- }}}

-- char info {{{
local char_info = (function()
  local item = Item {
    sep_left = sep.left_half_circle_solid(true),
    content = {
      Item {
        hl = { bg = color.fg, fg = color.bg },
        hidden = function(_, _)
          return char_util.info == ''
        end,
        content = char_util.info,
      },
    },
    sep_right = sep.right_half_circle_solid(true),
  }

  return item
end)()
-- }}}

-- functions {{{
-- renders space only when item is rendered
---@param item NougatItem
local function paired_space(item)
  return Item {
    content = sep.space().content,
    hidden = item,
  }
end
-- }}}

-- statusline {{{
local stl = Bar('statusline')
stl:add_item(mode)
stl:add_item(sep.space())
stl:add_item(skkeleton)
stl:add_item(sep.space())
stl:add_item(char_info)
stl:add_item(sep.space())
stl:add_item(nut.spacer())
stl:add_item(nut.truncation_point())
stl:add_item(file_status)
stl:add_item(sep.space())
stl:add_item(nut.buf.filetype {
  hl = { bg = color.blue, fg = color.bg },
  sep_left = sep.left_half_circle_solid(true),
  sep_right = sep.right_half_circle_solid(true),
})
stl:add_item(sep.space())
stl:add_item(datetime)
stl:add_item(sep.space())

local stl_inactive = Bar('statusline')
stl_inactive:add_item(mode)
stl_inactive:add_item(sep.space())
stl_inactive:add_item(nut.spacer())
stl_inactive:add_item(nut.truncation_point())
stl_inactive:add_item(file_status)
stl_inactive:add_item(sep.space())
stl_inactive:add_item(datetime)
stl_inactive:add_item(sep.space())

bar_util.set_statusline(function(ctx)
  return ctx.is_focused and stl or stl_inactive
end)
-- }}}

-- tabline {{{
vim.opt.showtabline = 2
local tal = Bar('tabline')
tal:add_item(nut.git.branch {
  hl = { bg = color.purple, fg = color.bg },
  sep_left = sep.left_half_circle_solid(true),
  prefix = ' ',
  sep_right = sep.right_half_circle_solid(true),
})
tal:add_item(sep.space())
local gitstatus = tal:add_item(nut.git.status.create {
  hl = { fg = color.bg },
  sep_left = sep.left_half_circle_solid(true),
  content = {
    nut.git.status.count('added', {
      hl = { bg = color.green },
      prefix = icon.git.added .. ' ',
      suffix = function(_, ctx)
        return (ctx.gitstatus.changed > 0 or ctx.gitstatus.removed > 0) and ' ' or ''
      end,
    }),
    nut.git.status.count('changed', {
      hl = { bg = color.blue },
      prefix = function(_, ctx)
        return ctx.gitstatus.added > 0 and ' ' .. icon.git.modified .. ' ' or icon.git.modified .. ' '
      end,
      suffix = function(_, ctx)
        return ctx.gitstatus.removed > 0 and ' ' or ''
      end,
    }),
    nut.git.status.count('removed', {
      hl = { bg = color.red },
      prefix = function(_, ctx)
        return (ctx.gitstatus.added > 0 or ctx.gitstatus.changed > 0) and ' ' .. icon.git.removed .. ' '
          or icon.git.removed .. ' '
      end,
    }),
  },
  sep_right = sep.right_half_circle_solid(true),
})
tal:add_item(paired_space(gitstatus))
tal:add_item(sep.space())
tal:add_item(nut.spacer())
tal:add_item(nut.truncation_point())
tal:add_item(lsp_info)
tal:add_item(sep.space())
local diagnostic_count = tal:add_item(nut.buf.diagnostic_count {
  hl = { bg = color.bg4 },
  sep_left = sep.left_half_circle_solid(true),
  sep_right = sep.right_half_circle_solid(true),
  config = {
    error = { prefix = icon.diagnostic.error .. ' ', fg = color.red },
    warn = { prefix = icon.diagnostic.warn .. ' ', fg = color.yellow },
    info = { prefix = icon.diagnostic.info .. ' ', fg = color.blue },
    hint = { prefix = icon.diagnostic.hint .. ' ', fg = color.green },
  },
})
tal:add_item(paired_space(diagnostic_count))
bar_util.set_tabline(tal)
-- }}}
