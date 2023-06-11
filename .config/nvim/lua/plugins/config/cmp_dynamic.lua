local Date = require('cmp_dynamic.utils.date')

require('cmp_dynamic').register {
  -- {{{ Date
  {
    label = 'today',
    insertText = function()
      return os.date('%Y/%m/%d')
    end,
  },
  {
    label = 'tomorrow',
    insertText = function()
      return Date.new():add_date(1):day(1):format('%Y/%m/%d')
    end,
  },
  {
    label = 'now',
    insertText = function()
      return os.date('%H:%M')
    end,
  },
  -- }}}
}
