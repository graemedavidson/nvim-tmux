return {
  'nvim-focus/focus.nvim',
  version = false,
  lazy = false,
  config = function()
    require('focus').setup {}
  end,
}
