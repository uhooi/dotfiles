-- lazy.nvim

-- Install {{{
local lazypath = vim.fs.joinpath(vim.fn.stdpath('data')--[[@as string]], 'lazy', 'lazy.nvim')
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

  {
    'EdenEast/nightfox.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.config.nightfox')
    end,
  },
  -- }}}

  -- Tree-sitter {{{
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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
      require('plugins.config.ts_context_commentstring')
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
      require('plugins.config.ts_autotag')
    end,
  },
  -- }}}

  -- Library {{{
  { 'nvim-lua/plenary.nvim', lazy = true },

  { 'nvim-tree/nvim-web-devicons', lazy = true },

  { 'MunifTanjim/nui.nvim', lazy = true },

  { 'nvim-neotest/nvim-nio', lazy = true },

  -- }}}

  -- Basic {{{
  {
    'RRethy/vim-illuminate',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cond = function()
      return vim.fn.expand('%:e') ~= 'pkl' -- FIXME: Error in tree-sitter
    end,
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
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('plugins.config.hlchunk')
    end,
  },

  {
    '0xAdk/full_visual_line.nvim',
    keys = 'V',
    config = function()
      require('plugins.config.full_visual_line')
    end,
  },

  {
    'andersevenrud/nvim_context_vt',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'dart' },
    config = function()
      require('plugins.config.context_vt')
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
      require('plugins.config.cellwidths')
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
      require('plugins.config.insx')
    end,
  },

  { 'dkarter/bullets.vim' },

  {
    'monaqa/dial.nvim',
    config = function()
      require('plugins.config.dial')
    end,
  },

  {
    'johmsalas/text-case.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'folke/which-key.nvim',
    },
    config = function()
      require('plugins.config.textcase')
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
      require('plugins.config.neoscroll')
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
    'tris203/hawtkeys.nvim',
    config = function()
      require('plugins.config.hawtkeys')
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
    enabled = false,
    config = function()
      require('plugins.config.focus')
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

  { 'tyru/capture.vim' },

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
      require('plugins.config.characterize')
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
      require('plugins.config.modicator')
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
      require('plugins.config.flash')
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
    config = function()
      require('plugins.config.git_conflict')
    end,
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
      require('plugins.config.neogit')
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
      'johmsalas/text-case.nvim',
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
      require('plugins.config.fzf_lua')
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
    'apple/pkl-neovim',
    cond = function()
      return vim.fn.expand('%:e') == 'pkl'
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },

  {
    'udalov/kotlin-vim',
    ft = { 'kotlin' },
  },

  {
    'dart-lang/dart-vim-plugin',
    ft = { 'dart' },
    config = function()
      require('plugins.config.dart_vim_plugin')
    end,
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
      require('plugins.config.emmet_vim')
    end,
  },
  -- }}}

  -- Markdown {{{
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',
    enabled = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('plugins.config.render_markdown')
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

  {
    'willelz/skk-tutorial.vim',
    enabled = false,
    dependencies = { 'vim-denops/denops.vim' },
  },
  -- }}}

  -- LSP {{{
  -- ref: https://github.com/wookayin/dotfiles/blob/ad1b4f90f58f922b85860095830fe6625814bbf2/nvim/lua/plugins/ide.lua#L27-L38
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.nvim_lspconfig')
    end,
  },

  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.config.none_ls')
    end,
  },

  {
    'soulis-1256/eagle.nvim',
    config = function()
      require('plugins.config.eagle')
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = function()
      require('plugins.config.lsp_signature')
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
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('plugins.config.nvim_dap_ui')
    end,
  },

  {
    'wojciech-kulik/xcodebuild.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-tree.lua',
    },
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
  },
  { 'delphinus/cmp-wezterm', lazy = true },
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
    'toppair/peek.nvim',
    event = 'VeryLazy',
    build = 'deno task --quiet build:fast',
    ft = { 'markdown' },
    config = function()
      require('plugins.config.peek')
    end,
  },
  -- }}}

  -- Others {{{
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('plugins.config.snacks')
    end,
  },

  {
    'dstein64/vim-startuptime',
  },

  {
    'sotte/presenting.nvim',
    cmd = { 'Presenting' },
    ft = { 'markdown' },
    config = function()
      require('plugins.config.presenting')
    end,
  },

  {
    'NStefan002/screenkey.nvim',
    config = function()
      require('plugins.config.screenkey')
    end,
  },

  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand('~') .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/uhooi/**.md',
      'BufNewFile ' .. vim.fn.expand('~') .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/uhooi/**.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('plugins.config.obsidian')
    end,
  },

  {
    'thinca/vim-themis',
    ft = { 'vim' },
  },
  -- }}}

  -- Toy {{{
  {
    'delphinus/nekokak.nvim',
    init = function()
      vim.opt.termguicolors = true
    end,
    config = function()
      require('plugins.config.nekokak')
    end,
  },

  {
    'uhooi/uhooi.nvim',
    init = function()
      vim.opt.termguicolors = true
    end,
    config = function()
      require('plugins.config.uhooi')
    end,
  },

  { 'seandewar/nvimesweeper' },

  {
    'alanfortlink/blackjack.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.config.blackjack')
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

-- vim: set foldmethod=marker:
