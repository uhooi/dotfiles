-- packer.nvim

-- ref: https://github.com/wbthomason/packer.nvim/blob/afab89594f4f702dc3368769c95b782dbdaeaf0a/README.md
--    : https://qiita.com/delphinus/items/8160d884d415d7425fcc
--    : https://github.com/wbthomason/dotfiles/blob/08e10d9cc8d2c5bdd2f947caa2c40206efde8db7/neovim/.config/nvim/lua/plugins.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/core/pack/load.lua
--    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/opt/init.lua
--    : https://github.com/craftzdog/dotfiles-public/blob/50344f53c96c241e6d0659ed19507c70771bd971/.config/nvim/lua/plugins.lua

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Plugin manager {{{
  use 'wbthomason/packer.nvim'
  -- }}}

  -- Basic {{{
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('indent_blankline').setup {
        show_current_context = true, -- Require treesitter
        --show_current_context_start = true, -- Require treesitter
      }
    end,
  }

  -- FIXME: Not work
  use {
    'haringsrob/nvim_context_vt',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'dart' },
    config = function() require('nvim_context_vt').setup {} end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      vim.opt.termguicolors = true
      require('colorizer').setup {}
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end,
  }

  use { 'tomtom/tcomment_vim' }

  -- use {
  --   'github/copilot.vim',
  --   config = function() require('plugins.config.copilot') end,
  -- }

  use {
    'petertriho/nvim-scrollbar',
    config = function() require('scrollbar').setup() end,
  }

  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function() require('plugins.config.toggleterm') end,
  }

  use {
    'vim-jp/vimdoc-ja',
    config = function()
      vim.opt.helplang = { 'ja', 'en' }
    end,
  }

  use { 'tweekmonster/helpful.vim' }
  -- }}}

  -- statusline {{{
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('plugins.config.lualine') end,
  }
  -- }}}

  -- Motion {{{
  use {
    'easymotion/vim-easymotion',
    config = function()
      vim.keymap.set('n', 'f', '<Plug>(easymotion-fl)')
      vim.keymap.set('n', 't', '<Plug>(easymotion-tl)')
      vim.keymap.set('n', 'F', '<Plug>(easymotion-Fl)')
      vim.keymap.set('n', 'T', '<Plug>(easymotion-Tl)')
    end,
  }
  --- }}}

  -- textobj {{{
  use { 'kana/vim-textobj-user' }
  use { 'kana/vim-textobj-entire', requires = { 'kana/vim-textobj-user' } }
  use { 'kana/vim-textobj-indent', requires = { 'kana/vim-textobj-user' } }
  use { 'sgur/vim-textobj-parameter', requires = { 'kana/vim-textobj-user' } }
  use { 'thinca/vim-textobj-between', requires = { 'kana/vim-textobj-user' } }
  -- }}}

  -- Git {{{
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.config.gitsigns') end,
  }

  -- FIXME: Not work
  use {
    'rhysd/committia.vim',
    ft = { 'gitcommit' },
  }
  --- }}}

  -- Fuzzy finder {{{
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'kyazdani42/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      use { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function() require('plugins.config.telescope') end,
  }
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

  -- Syntax {{{
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

  -- Denops {{{
  use { 'vim-denops/denops.vim' }
  use { 'vim-denops/denops-helloworld.vim', requires = { 'vim-denops/denops.vim' } }

  use { 'lambdalisue/gin.vim', requires = { 'vim-denops/denops.vim' } }
  -- }}}

  -- LSP {{{
  -- ref: https://github.com/wbthomason/dotfiles/blob/08e10d9cc8d2c5bdd2f947caa2c40206efde8db7/neovim/.config/nvim/lua/plugins.lua
  --    : https://github.com/delphinus/dotfiles/blob/e562d4f8e99793e6ae1cd330c9208dac1d29d407/.config/nvim/lua/modules/lsp/init.lua
  --    : https://zenn.dev/kawarimidoll/articles/367b78f7740e84
  --    : https://zenn.dev/botamotch/articles/21073d78bc68bf
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.config.nvim_lspconfig') end,
  }

  use {
    'williamboman/mason.nvim',
    requires = { 'williamboman/mason-lspconfig.nvim' },
    config = function() require('plugins.config.mason') end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.config.null_ls') end,
  }

  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function() require('plugins.config.lsp_lines') end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
      { 'onsails/lspkind.nvim' },
    },
    config = function() require('plugins.config.nvim_cmp') end,
  }
  -- }}}

  -- Preview {{{
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
  -- }}}

  -- Others {{{
  use {
    'thinca/vim-showtime',
    ft = { 'markdown' },
  }

  use {
    'thinca/vim-themis',
    ft = { 'vim' },
  }
  -- }}}

  -- Toy {{{
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
  -- }}}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
