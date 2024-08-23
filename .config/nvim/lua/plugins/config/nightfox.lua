vim.cmd([[
  autocmd VimEnter * ++nested colorscheme dayfox
]])

require('nightfox').setup {
  options = {},
}
