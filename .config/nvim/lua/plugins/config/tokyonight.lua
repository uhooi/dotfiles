vim.cmd([[
  autocmd VimEnter * ++nested colorscheme tokyonight
]])

require('tokyonight').setup {
  style = 'moon',
}
