-- local parsers = require'nvim-treesitter.parsers'
local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'dot',
    'graphql',
    'help',
    'html',
    'json',
    'lua',
    'make',
    'markdown',
    'regex',
    'scss',
    'todotxt',
    'vim',
    'yaml',
    'go',
    'python',
  },
  highlight = {
    enable = true,
    disable = { "bash", "markdown" },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}
