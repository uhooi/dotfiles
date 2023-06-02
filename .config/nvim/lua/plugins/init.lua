-- lazy.nvim

-- Install {{{
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- Setup {{{
require('lazy').setup({
  -- Colorscheme {{{
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.config.tokyonight')
    end,
  },
  -- }}}

  -- API {{{
  { 'nvim-lua/plenary.nvim', lazy = true },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  { 'nvim-tree/nvim-web-devicons', lazy = true },
  -- }}}

  -- Basic {{{
  {
    'RRethy/vim-illuminate',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'lukas-reineke/virt-column.nvim',
    config = function()
      require('plugins.config.virt_column')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('plugins.config.treesitter_context')
    end,
  },

  -- FIXME: Not work
  {
    'haringsrob/nvim_context_vt',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'dart' },
    config = function()
      require('nvim_context_vt').setup {}
    end,
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.config.todo_comments')
    end,
  },

  {
    'delphinus/cellwidths.nvim',
    config = function()
      require('cellwidths').setup {
        name = 'default',
      }
    end,
  },

  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('plugins.config.ccc')
    end,
  },

  {
    'hrsh7th/nvim-insx',
    config = function()
      require('insx.preset.standard').setup()
    end,
  },

  { 'dkarter/bullets.vim' },

  { 'tomtom/tcomment_vim' },

  {
    'github/copilot.vim',
    config = function()
      require('plugins.config.copilot')
    end,
  },

  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
    end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.config.nvim_notify')
    end,
  },

  { 'MunifTanjim/nui.nvim', lazy = true },
  {
    'folke/noice.nvim',
    event = 'VimEnter',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('plugins.config.noice')
    end,
  },

  {
    'uga-rosa/ugaterm.nvim',
    config = function()
      require('plugins.config.ugaterm')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.config.nvim_tree')
    end,
  },

  { 'stevearc/dressing.nvim' },

  {
    'vim-jp/vimdoc-ja',
    config = function()
      vim.opt.helplang = { 'ja', 'en' }
    end,
  },

  { 'tweekmonster/helpful.vim' },
  -- }}}

  -- statusline {{{
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.config.lualine')
    end,
  },
  -- }}}

  -- Motion {{{
  {
    'phaazon/hop.nvim',
    config = function()
      require('plugins.config.hop')
    end,
  },
  --- }}}

  -- textobj {{{
  { 'kana/vim-textobj-user', lazy = true },
  { 'kana/vim-textobj-entire', dependencies = { 'kana/vim-textobj-user' } },
  { 'kana/vim-textobj-indent', dependencies = { 'kana/vim-textobj-user' } },
  { 'sgur/vim-textobj-parameter', dependencies = { 'kana/vim-textobj-user' } },
  { 'thinca/vim-textobj-between', dependencies = { 'kana/vim-textobj-user' } },
  -- }}}

  -- Git {{{
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.config.gitsigns')
    end,
  },

  { 'rhysd/committia.vim' },

  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'akinsho/git-conflict.nvim',
    config = true,
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.config.octo')
    end,
  },
  --- }}}

  -- Fuzzy finder {{{
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make',
  },
  { 'nvim-telescope/telescope-ui-select.nvim', lazy = true },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('plugins.config.telescope')
    end,
  },
  -- }}}

  -- Syntax {{{
  {
    'keith/swift.vim',
    ft = { 'swift' },
  },

  {
    'keith/xcconfig.vim',
    cond = function()
      return vim.fn.expand('%:e') == 'xcconfig'
    end,
  },

  {
    'udalov/kotlin-vim',
    ft = { 'kotlin' },
  },

  {
    'dart-lang/dart-vim-plugin',
    ft = { 'dart' },
    config = function()
      vim.g.dart_html_in_string = true
      vim.g.dart_style_guide = 2
      vim.g.dart_format_on_save = true
    end,
  },

  {
    'mechatroner/rainbow_csv',
    cond = function()
      return vim.fn.expand('%:e') == 'csv'
    end,
  },

  {
    'cespare/vim-toml',
    ft = { 'toml' },
  },

  {
    'aklt/plantuml-syntax',
    cond = function()
      local ext = vim.fn.expand('%:e')
      return ext == 'pu' or ext == 'uml' or ext == 'puml' or ext == 'iuml' or ext == 'plantuml'
    end,
  },

  {
    'tokorom/vim-review',
    ft = { 'review' },
    config = function()
      require('plugins.config.vim_review')
    end,
  },

  {
    'kylef/apiblueprint.vim',
    ft = { 'apiblueprint' },
  },

  { 'Shougo/context_filetype.vim', lazy = true },
  {
    'osyo-manga/vim-precious',
    dependencies = { 'Shougo/context_filetype.vim' },
    ft = { 'markdown', 'toml', 'help' },
  },
  -- }}}

  -- HTML {{{
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'typescript', 'vue', 'svelte', 'markdown' },
    config = function()
      vim.g.user_emmet_mode = 'i'
      vim.g.user_emmet_install_global = 0
    end,
  },
  -- }}}

  -- Denops {{{
  { 'vim-denops/denops.vim', lazy = true, enabled = false },
  { 'vim-denops/denops-helloworld.vim', enabled = false, dependencies = { 'vim-denops/denops.vim' } },
  { 'lambdalisue/gin.vim', enabled = false, dependencies = { 'vim-denops/denops.vim' } },
  -- }}}

  -- LSP {{{
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.nvim_lspconfig')
    end,
  },

  { 'williamboman/mason-lspconfig.nvim', lazy = true },
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      require('plugins.config.mason')
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.config.null_ls')
    end,
  },

  {
    url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('plugins.config.lsp_lines')
    end,
  },

  { 'hrsh7th/cmp-nvim-lsp', lazy = true },
  { 'hrsh7th/cmp-buffer', lazy = true },
  { 'hrsh7th/cmp-path', lazy = true },
  { 'hrsh7th/cmp-cmdline', lazy = true },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
  { 'hrsh7th/cmp-emoji', lazy = true },
  { 'hrsh7th/cmp-vsnip', lazy = true },
  { 'hrsh7th/vim-vsnip', lazy = true },
  { 'onsails/lspkind.nvim', lazy = true },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('plugins.config.nvim_cmp')
    end,
  },

  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.config.dropbar')
    end,
  },
  -- }}}

  -- Preview {{{
  {
    'tyru/open-browser.vim',
    keys = { '<Plug>(openbrowser-smart-search)' },
    config = function()
      require('plugins.config.open_browser')
    end,
  },

  {
    'previm/previm',
    dependencies = { 'tyru/open-browser.vim' },
    ft = { 'markdown' },
    config = function()
      require('plugins.config.previm')
    end,
  },
  -- }}}

  -- Others {{{
  {
    'thinca/vim-showtime',
    ft = { 'markdown' },
  },

  {
    'thinca/vim-themis',
    ft = { 'vim' },
  },
  -- }}}

  -- Toy {{{
  {
    'delphinus/nekokak.nvim',
    config = function()
      vim.opt.termguicolors = true
      require('nekokak').setup()
    end,
  },

  {
    'uhooi/uhooi.nvim',
    config = function()
      vim.opt.termguicolors = true
      require('uhooi').setup()
    end,
  },
  -- }}}
}, {
  -- Configuration {{{
  ui = {
    border = 'single',
  },
  -- }}}
})
-- }}}
