return {
  'ibhagwan/fzf-lua',

  -- version = '*',
  -- lazy = false,

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('fzf-lua').setup {}
  end,
}
