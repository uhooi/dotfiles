vim.scriptencoding = 'utf-8'

-- ref: https://github.com/wbthomason/dotfiles/blob/08e10d9cc8d2c5bdd2f947caa2c40206efde8db7/neovim/.config/nvim/init.lua
--    : https://github.com/craftzdog/dotfiles-public/blob/50344f53c96c241e6d0659ed19507c70771bd971/.config/nvim/lua/base.lua

vim.g.mapleader = [[,]]
vim.keymap.set('', '\\', ',', { noremap = true })

require('basics')
require('filetypes')
require('mappings')
require('plugins')
require('highlights')
