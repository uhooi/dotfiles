-- packer.nvim

-- ref: https://github.com/wbthomason/packer.nvim/blob/afab89594f4f702dc3368769c95b782dbdaeaf0a/README.md
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/core/pack/load.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/opt/init.lua
--    : https://github.com/craftzdog/dotfiles-public/blob/50344f53c96c241e6d0659ed19507c70771bd971/.config/nvim/lua/plugins.lua

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      vim.opt.termguicolors = true
      require('colorizer').setup {}
    end,
  }

  use {
    'easymotion/vim-easymotion',
    config = function()
      vim.keymap.set('', 'f', '<Plug>(easymotion-fl)')
      vim.keymap.set('', 't', '<Plug>(easymotion-tl)')
      vim.keymap.set('', 'F', '<Plug>(easymotion-Fl)')
      vim.keymap.set('', 'T', '<Plug>(easymotion-Tl)')
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        show_current_context = true, -- Require treesitter
        --show_current_context_start = true, -- Require treesitter
      }
    end,
  }

  use {
    'vim-jp/vimdoc-ja',
    config = function()
      vim.opt.helplang = { 'ja', 'en' }
    end,
  }

  use {
    'delphinus/nekokak.nvim',
    config = function()
      vim.opt.termguicolors = true
      require('nekokak').setup {}
    end,
  }

use {
  'uhooi/uhooi.nvim',
  config = function()
    vim.opt.termguicolors = true
    require('uhooi').setup {}
  end,
}

  -- Colorscheme
  use {
    'cocopon/iceberg.vim',
    config = function()
      vim.cmd([[
        set background=dark
        autocmd VimEnter * ++nested colorscheme iceberg
      ]])
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

