-- ref: https://github.com/MunifTanjim/nougat.nvim/blob/5f6ee8ebe28496b9976f838d9df32b05e611835a/examples/bubbly.lua

-- modules {{{
local core = require('nougat.core')
local Bar = require('nougat.bar')
local bar_util = require('nougat.bar.util')
local Item = require('nougat.item')
local sep = require('nougat.separator')
local icons = require('plugins.config.shared.icons')
-- }}}

-- nut {{{
local nut = {
  buf = {
    diagnostic_count = require('nougat.nut.buf.diagnostic_count').create,
    filename = require('nougat.nut.buf.filename').create,
    filetype = require('nougat.nut.buf.filetype').create,
  },
  git = {
    branch = require('nougat.nut.git.branch').create,
    status = require('nougat.nut.git.status'),
  },
  tab = {
    tablist = {
      tabs = require('nougat.nut.tab.tablist').create,
      close = require('nougat.nut.tab.tablist.close').create,
      icon = require('nougat.nut.tab.tablist.icon').create,
      label = require('nougat.nut.tab.tablist.label').create,
      modified = require('nougat.nut.tab.tablist.modified').create,
    },
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

-- filename {{{
local filename = (function()
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
        suffix = ' ',
        content = 'RO',
      },
      Item {
        hl = { bg = color.bg4, fg = color.fg },
        hidden = function(_, ctx)
          return ctx.ctx.modifiable
        end,
        content = '',
        suffix = ' ',
      },
      nut.buf.filename {
        hl = { bg = color.fg, fg = color.bg },
        prefix = function(_, ctx)
          local data = ctx.ctx
          if data.readonly or not data.modifiable then
            return ' '
          end
          return ''
        end,
        suffix = function(_, ctx)
          local data = ctx.ctx
          if data.modified then
            return ' '
          end
          return ''
        end,
      },
      Item {
        hl = { bg = color.bg4, fg = color.fg },
        hidden = function(_, ctx)
          return not ctx.ctx.modified
        end,
        prefix = ' ',
        content = '+',
      },
    },
    sep_right = sep.right_half_circle_solid(true),
  }

  return item
end)()
-- }}}

-- ruler {{{
local ruler = (function()
  local scroll_hl = {
    [true] = { bg = color.bg3 },
    [false] = { bg = color.bg4 },
  }

  local item = Item {
    content = {
      Item {
        hl = { bg = color.bg4 },
        sep_left = sep.left_half_circle_solid(true),
        content = core.group({
          core.code('l'),
          ':',
          core.code('c'),
        }, { align = 'left', min_width = 8 }),
        suffix = ' ',
      },
      Item {
        hl = function(_, ctx)
          return scroll_hl[ctx.is_focused]
        end,
        prefix = ' ',
        content = core.code('P'),
        sep_right = sep.right_half_circle_solid(true),
      },
    },
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
stl:add_item(nut.git.branch {
  hl = { bg = color.purple, fg = color.bg },
  sep_left = sep.left_half_circle_solid(true),
  prefix = ' ',
  sep_right = sep.right_half_circle_solid(true),
})
stl:add_item(sep.space())
local gitstatus = stl:add_item(nut.git.status.create {
  hl = { fg = color.bg },
  sep_left = sep.left_half_circle_solid(true),
  content = {
    nut.git.status.count('added', {
      hl = { bg = color.green },
      prefix = icons.git.added .. ' ',
      suffix = function(_, ctx)
        return (ctx.gitstatus.changed > 0 or ctx.gitstatus.removed > 0) and ' ' or ''
      end,
    }),
    nut.git.status.count('changed', {
      hl = { bg = color.blue },
      prefix = function(_, ctx)
        return ctx.gitstatus.added > 0 and ' ' .. icons.git.modified .. ' ' or icons.git.modified .. ' '
      end,
      suffix = function(_, ctx)
        return ctx.gitstatus.removed > 0 and ' ' or ''
      end,
    }),
    nut.git.status.count('removed', {
      hl = { bg = color.red },
      prefix = function(_, ctx)
        return (ctx.gitstatus.added > 0 or ctx.gitstatus.changed > 0) and ' ' .. icons.git.removed .. ' ' or icons.git.removed .. ' '
      end,
    }),
  },
  sep_right = sep.right_half_circle_solid(true),
})
stl:add_item(paired_space(gitstatus))
stl:add_item(filename)
stl:add_item(sep.space())
stl:add_item(nut.spacer())
stl:add_item(nut.truncation_point())
stl:add_item(nut.buf.filetype {
  hl = { bg = color.blue, fg = color.bg },
  sep_left = sep.left_half_circle_solid(true),
  sep_right = sep.right_half_circle_solid(true),
})
stl:add_item(sep.space())
local diagnostic_count = stl:add_item(nut.buf.diagnostic_count {
  hl = { bg = color.bg4 },
  sep_left = sep.left_half_circle_solid(true),
  sep_right = sep.right_half_circle_solid(true),
  config = {
    error = { prefix = ' ', fg = color.red },
    warn = { prefix = ' ', fg = color.yellow },
    info = { prefix = ' ', fg = color.blue },
    hint = { prefix = ' ', fg = color.green },
  },
})
stl:add_item(paired_space(diagnostic_count))
stl:add_item(ruler)
stl:add_item(sep.space())

local stl_inactive = Bar('statusline')
stl_inactive:add_item(mode)
stl_inactive:add_item(sep.space())
stl_inactive:add_item(filename)
stl_inactive:add_item(sep.space())
stl_inactive:add_item(nut.spacer())
stl_inactive:add_item(ruler)
stl_inactive:add_item(sep.space())

bar_util.set_statusline(function(ctx)
  return ctx.is_focused and stl or stl_inactive
end)
-- }}}

-- tabline {{{
local tal = Bar('tabline')
tal:add_item(nut.tab.tablist.tabs {
  active_tab = {
    hl = { bg = color.bg0_h, fg = color.blue },
    prefix = ' ',
    suffix = ' ',
    content = {
      nut.tab.tablist.icon { suffix = ' ' },
      nut.tab.tablist.label {},
      nut.tab.tablist.modified { prefix = ' ', config = { text = '●' } },
      nut.tab.tablist.close { prefix = ' ', config = { text = '󰅖' } },
    },
    sep_left = sep.left_half_circle_solid { bg = 'bg', fg = color.bg0_h },
    sep_right = sep.right_half_circle_solid { bg = 'bg', fg = color.bg0_h },
  },
  inactive_tab = {
    hl = { bg = color.bg2, fg = color.fg2 },
    prefix = ' ',
    suffix = ' ',
    content = {
      nut.tab.tablist.icon { suffix = ' ' },
      nut.tab.tablist.label {},
      nut.tab.tablist.modified { prefix = ' ', config = { text = '●' } },
      nut.tab.tablist.close { prefix = ' ', config = { text = '󰅖' } },
    },
    sep_left = sep.left_half_circle_solid { bg = 'bg', fg = color.bg2 },
    sep_right = sep.right_half_circle_solid { bg = 'bg', fg = color.bg2 },
  },
})
bar_util.set_tabline(tal)
-- }}}
