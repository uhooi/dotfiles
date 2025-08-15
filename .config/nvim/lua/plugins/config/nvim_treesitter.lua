local treesitter = require('nvim-treesitter')

treesitter.setup {}

treesitter.install {
  'bash',
  'c',
  'c_sharp',
  'css',
  'dart',
  'diff',
  'dockerfile',
  'elm',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'go',
  'graphql',
  'html',
  'java',
  'javascript',
  'json',
  'kotlin',
  'latex',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'nix',
  -- 'objc',
  'perl',
  'php',
  'pkl',
  'python',
  'query',
  'regex',
  'ruby',
  'rust',
  'sql',
  'swift',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

vim.api.nvim_create_autocmd('FileType', {
  -- TODO: Add more filetypes
  pattern = { 'lua', 'swift' },
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
