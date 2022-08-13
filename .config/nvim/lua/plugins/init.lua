-- packer.nvim

-- ref: https://github.com/wbthomason/packer.nvim/blob/afab89594f4f702dc3368769c95b782dbdaeaf0a/README.md
--    : https://github.com/wbthomason/dotfiles/blob/08e10d9cc8d2c5bdd2f947caa2c40206efde8db7/neovim/.config/nvim/lua/plugins.lua
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
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('plugins.config.lualine') end,
  }

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

  use { 'tweekmonster/helpful.vim' }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.config.gitsigns') end,
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

  -- textobj {{{
  use { 'kana/vim-textobj-user' }
  use { 'kana/vim-textobj-entire', requires = { 'kana/vim-textobj-user' } }
  use { 'kana/vim-textobj-indent', requires = { 'kana/vim-textobj-user' } }
  use { 'sgur/vim-textobj-parameter', requires = { 'kana/vim-textobj-user' } }
  use { 'thinca/vim-textobj-between', requires = { 'kana/vim-textobj-user' } }
  -- }}}

  -- Colorscheme {{{
  use {
    'cocopon/iceberg.vim',
    config = function()
      vim.cmd([[
        set background=dark
        autocmd VimEnter * ++nested colorscheme iceberg
      ]])
    end,
  }
  -- }}}

  -- syntax {{{
  use {
    'keith/swift.vim',
    ft = { 'swift' },
  }

  use {
    'keith/xcconfig.vim',
    cond = function() return vim.fn.expand('%:e') == 'xcconfig' end,
  }

  use {
    'udalov/kotlin-vim',
    ft = { 'kotlin' },
  }

  use {
    'dart-lang/dart-vim-plugin',
    ft = { 'dart' },
    config = function()
      vim.g.dart_html_in_string = true
      vim.g.dart_style_guide = 2
      vim.g.dart_format_on_save = true
    end,
  }

  use {
    'mechatroner/rainbow_csv',
    cond = function() return vim.fn.expand('%:e') == 'csv' end,
  }

  use {
    'cespare/vim-toml',
    ft = { 'toml' },
  }

  use {
    'aklt/plantuml-syntax',
    cond = function()
      local ext = vim.fn.expand('%:e')
      return ext == 'pu' or ext == 'uml' or ext == 'puml' or ext == 'iuml' or ext == 'plantuml'
    end,
  }

  use {
    'tokorom/vim-review',
    ft = { 'review' },
    config = function() require('plugins.config.vim_review') end,
  }

  use {
    'kylef/apiblueprint.vim',
    ft = { 'apiblueprint' },
  }

  use {
    'osyo-manga/vim-precious',
    requires = { 'Shougo/context_filetype.vim' },
    ft = { 'markdown', 'toml', 'help' },
  }

  use { 'Shougo/context_filetype.vim' }
  -- }}}

  use {
    'previm/previm',
    requires = { 'tyru/open-browser.vim' },
    ft = { 'markdown' },
    config = function() require('plugins.config.previm') end,
  }

  use {
    'tyru/open-browser.vim',
    keys = { '<Plug>(openbrowser-smart-search)' },
    config = function() require('plugins.config.open_browser') end,
  }

  use {
    'thinca/vim-showtime',
    ft = { 'markdown' },
  }

  use {
    'rhysd/committia.vim',
    ft = { 'gitcommit' },
  }

  -- Denops {{{
  use { 'vim-denops/denops.vim' }
  use { 'vim-denops/denops-helloworld.vim', requires = { 'vim-denops/denops.vim' }}

  use { 'lambdalisue/gin.vim', requires = { 'vim-denops/denops.vim' }}
  -- }}}

  use {
    'thinca/vim-themis',
    ft = { 'vim' },
  }

-- lsp {{{
-- ref: https://github.com/wbthomason/dotfiles/blob/08e10d9cc8d2c5bdd2f947caa2c40206efde8db7/neovim/.config/nvim/lua/plugins.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/lsp/init.lua
--    : https://zenn.dev/kawarimidoll/articles/367b78f7740e84
--    : https://zenn.dev/botamotch/articles/21073d78bc68bf
  use { 'neovim/nvim-lspconfig' }

  use {
    'williamboman/mason.nvim',
    requires = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      require('mason').setup()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup()
      mason_lspconfig.setup_handlers {
        function(server_name)
          local capabilities = require('cmp_nvim_lsp')
            .update_capabilities(
              vim.lsp.protocol.make_client_capabilities()
            )
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
          }
        end
      }
    end,
  }

  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
      vim.diagnostic.config {
        virtual_text = false,
      }
      vim.keymap.set(
        '',
        '<Leader>l',
        require('lsp_lines').toggle,
        { desc = 'Toggle lsp_lines' }
      )
    end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
    },
    config = function() require('plugins.config.nvim_cmp') end,
  }
-- }}}

-- ddu {{{

-- }}}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

