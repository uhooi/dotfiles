vim.g.copilot_no_maps = true
vim.g.copilot_hide_during_completion = 0

-- TODO: Use `vim.keymap.set()`
vim.cmd([[
  inoremap <script><silent><nowait><expr> <C-g> copilot#Accept()
]])
