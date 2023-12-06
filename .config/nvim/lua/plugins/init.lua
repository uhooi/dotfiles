-- lazy.nvim

-- Install {{{
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- Setup {{{
require('lazy').setup({
  -- Plugin manager {{{
  { 'folke/lazy.nvim' },
  -- }}}

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

  -- Tree-sitter {{{
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('plugins.config.nvim_treesitter')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('plugins.config.treesitter_context')
    end,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('ts_context_commentstring').setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('plugins.config.treesitter_textobjects')
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  -- }}}

  -- Library {{{
  { 'nvim-lua/plenary.nvim', lazy = true },

  { 'nvim-tree/nvim-web-devicons', lazy = true },

  { 'MunifTanjim/nui.nvim', lazy = true },
  -- }}}

  -- Basic {{{
  {
    'RRethy/vim-illuminate',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'tzachar/highlight-undo.nvim',
    config = function()
      require('plugins.config.highlight_undo')
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      require('plugins.config.rainbow_delimiters')
    end,
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
      require('ibl').setup {
        indent = {
          char = '│',
        },
      }
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
    enabled = false,
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
      require('insx.preset.standard').setup {
        cmdline = {
          enabled = true,
        },
      }
    end,
  },

  { 'dkarter/bullets.vim' },

  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'monaqa/dial.nvim',
    config = function()
      require('plugins.config.dial')
    end,
  },

  {
    'github/copilot.vim',
    config = function()
      require('plugins.config.copilot')
    end,
  },

  {
    'lewis6991/satellite.nvim',
    -- ref: https://github.com/delphinus/dotfiles/blob/a6670cd510c4e5f6bd731186431723be6002a794/.config/nvim/lua/lazies/opt.lua#L610-L623
    --    : https://github.com/lewis6991/satellite.nvim/blob/22c8cc5283c9533677e4b86b9d25d3beeca04667/lua/satellite.lua#L45-L69
    event = {
      'BufWinEnter',
      'CmdwinLeave',
      'TabEnter',
      'TermEnter',
      'TextChanged',
      'VimResized',
      'WinEnter',
      'WinScrolled',
    },
    dependencies = { 'lewis6991/gitsigns.nvim' },
    config = function()
      require('plugins.config.satellite')
    end,
  },

  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('plugins.config.smooth_cursor')
    end,
  },

  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.config.nvim_notify')
    end,
  },

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
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    config = function()
      require('plugins.config.which_key')
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

  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('plugins.config.symbols_outline')
    end,
  },

  {
    'nvim-focus/focus.nvim',
    config = function()
      require('focus').setup()
    end,
  },

  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'WinNew',
    config = function()
      require('plugins.config.colorful_winsep')
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

  {
    'folke/neodev.nvim',
    enabled = false,
    config = function()
      require('neodev').setup {
        library = { plugins = { 'nvim-dap-ui' }, types = true },
      }
    end,
  },
  -- }}}

  -- statusline {{{
  {
    'nvim-lualine/lualine.nvim',
    enabled = false, -- Use nougat.nvim
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'delphinus/characterize.nvim',
      'delphinus/eaw.nvim',
    },
    config = function()
      require('plugins.config.lualine')
    end,
  },

  {
    'delphinus/characterize.nvim',
    lazy = true,
    config = function()
      require('characterize').setup {}
    end,
  },
  { 'delphinus/eaw.nvim', lazy = true },

  {
    'mawkler/modicator.nvim',
    enabled = false,
    event = 'ModeChanged',
    dependencies = {
      'folke/tokyonight.nvim',
      'nvim-lualine/lualine.nvim',
    },
    config = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
      require('modicator').setup()
    end,
  },

  {
    'MunifTanjim/nougat.nvim',
    dependencies = {
      'delphinus/characterize.nvim',
      'delphinus/eaw.nvim',
    },
    config = function()
      require('plugins.config.nougat')
    end,
  },
  -- }}}

  -- winbar {{{
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      require('plugins.config.dropbar')
    end,
  },
  -- }}}

  -- Motion {{{
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
      require('flash').setup()
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
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugins.config.gitlinker')
    end,
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },
    config = function()
      require('neogit').setup()
    end,
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
  { 'nvim-telescope/telescope-fzf-native.nvim', lazy = true, build = 'make' },
  { 'nvim-telescope/telescope-ui-select.nvim', lazy = true },
  { 'nvim-telescope/telescope-frecency.nvim', lazy = true },
  { 'nvim-telescope/telescope-ghq.nvim', lazy = true },
  { 'fdschmidt93/telescope-egrepify.nvim', lazy = true },
  { 'piersolenski/telescope-import.nvim', lazy = true },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-frecency.nvim',
      'nvim-telescope/telescope-ghq.nvim',
      'fdschmidt93/telescope-egrepify.nvim',
      'piersolenski/telescope-import.nvim',
    },
    config = function()
      require('plugins.config.telescope')
    end,
  },

  -- Must run `brew install fzf`
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('fzf-lua').setup()
    end,
  },
  -- }}}

  -- Search {{{
  {
    'cshuaimin/ssr.nvim',
    config = function()
      require('plugins.config.ssr')
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

  {
    'mustache/vim-mustache-handlebars',
    cond = function()
      local ext = vim.fn.expand('%:e')
      return ext == 'mustache' or ext == 'hbs'
    end,
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
  { 'vim-denops/denops.vim', lazy = true },

  { 'vim-denops/denops-helloworld.vim', dependencies = { 'vim-denops/denops.vim' } },

  { 'lambdalisue/gin.vim', dependencies = { 'vim-denops/denops.vim' } },

  {
    'lambdalisue/kensaku.vim',
    lazy = true,
    dependencies = {
      'vim-denops/denops.vim',
    },
  },
  { 'lambdalisue/kensaku-command.vim', dependencies = { 'lambdalisue/kensaku.vim' } },
  {
    'lambdalisue/kensaku-search.vim',
    dependencies = { 'lambdalisue/kensaku.vim' },
    config = function()
      require('plugins.config.kensaku_search')
    end,
  },

  {
    'delphinus/skkeleton_indicator.nvim',
    lazy = true,
    config = function()
      require('plugins.config.skkeleton_indicator')
    end,
  },
  {
    'vim-skk/skkeleton',
    dependencies = {
      'vim-denops/denops.vim',
      'delphinus/skkeleton_indicator.nvim',
    },
    config = function()
      require('plugins.config.skkeleton')
    end,
  },

  { 'willelz/skk-tutorial.vim', dependencies = { 'vim-denops/denops.vim' } },
  -- }}}

  -- LSP {{{
  -- ref: https://github.com/wookayin/dotfiles/blob/ad1b4f90f58f922b85860095830fe6625814bbf2/nvim/lua/plugins/ide.lua#L27-L38
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('plugins.config.nvim_lspconfig')
    end,
  },

  { 'williamboman/mason-lspconfig.nvim', lazy = true },
  {
    'williamboman/mason.nvim',
    lazy = true,
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    build = ':MasonUpdate',
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

  {
    'soulis-1256/hoverhints.nvim',
    enabled = false,
    config = function()
      require('plugins.config.hoverhints')
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = function()
      require('lsp_signature').setup()
    end,
  },

  {
    'VidocqH/lsp-lens.nvim',
    config = function()
      require('plugins.config.lsp_lens')
    end,
  },

  {
    'kosayoda/nvim-lightbulb',
    enabled = false,
    config = function()
      require('plugins.config.nvim_lightbulb')
    end,
  },
  -- }}}

  -- DAP {{{
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'wojciech-kulik/xcodebuild.nvim',
    },
    config = function()
      require('plugins.config.nvim_dap')
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('plugins.config.nvim_dap_ui')
    end,
  },

  {
    'wojciech-kulik/xcodebuild.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('plugins.config.xcodebuild')
    end,
  },
  -- }}}

  -- Completion {{{
  { 'hrsh7th/cmp-nvim-lsp', lazy = true },
  { 'hrsh7th/cmp-nvim-lua', lazy = true },
  { 'hrsh7th/cmp-buffer', lazy = true },
  { 'hrsh7th/cmp-path', lazy = true },
  { 'hrsh7th/cmp-cmdline', lazy = true },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
  { 'hrsh7th/cmp-emoji', lazy = true },
  { 'hrsh7th/cmp-calc', lazy = true },
  { 'hrsh7th/cmp-vsnip', lazy = true },
  { 'ray-x/cmp-treesitter', lazy = true },
  {
    'delphinus/cmp-ghq',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    config = function()
      require('cmp_ghq').setup {}
    end,
  },
  { 'uga-rosa/cmp-latex-symbol', lazy = true },
  {
    'uga-rosa/cmp-dictionary',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    config = function()
      require('plugins.config.cmp_dictionary')
    end,
  },
  {
    'uga-rosa/cmp-dynamic',
    lazy = true,
    config = function()
      require('plugins.config.cmp_dynamic')
    end,
  },
  { 'uga-rosa/cmp-skkeleton', lazy = true },
  { 'onsails/lspkind.nvim', lazy = true },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
      'ray-x/cmp-treesitter',
      'delphinus/cmp-ghq',
      'uga-rosa/cmp-latex-symbol',
      'uga-rosa/cmp-dictionary',
      'uga-rosa/cmp-dynamic',
      'uga-rosa/cmp-skkeleton',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('plugins.config.nvim_cmp')
    end,
  },
  -- }}}

  -- Snippet {{{
  { 'hrsh7th/vim-vsnip', lazy = true },
  { 'rafamadriz/friendly-snippets', lazy = true },
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
    'dstein64/vim-startuptime',
  },

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

  { 'seandewar/nvimesweeper' },

  {
    'alanfortlink/blackjack.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('blackjack').setup {
        card_style = 'large',
        suit_style = 'black',
      }
    end,
  },
  -- }}}
}, {
  -- Configuration {{{
  ui = {
    border = 'rounded',
  },
  -- }}}
})
-- }}}
