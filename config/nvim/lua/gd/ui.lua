local vim = vim

local g = vim.g      -- a table to access global variables
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

-------------------- IDENT ------------------------------
cmd [[highlight b1 guifg=NONE guibg=#17202A gui=nocombine]]
cmd [[highlight b2 guifg=NONE guibg=NONE gui=nocombine]]
g.indent_blankline_space_char_highlight_list = {"b1", "b2"}
g.indent_blankline_char_highlight_list = {"b1", "b2"}
g.indent_blankline_char = " "
g.indent_blankline_space_char = " "
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_current_context = false

-------------------- UI -------------------------------
require('trouble').setup()
require('gitsigns').setup()
require('colorizer').setup()
require("focus").setup({excluded_filetypes = {"toggleterm"}})
require('fzf-lua').setup({})
require('nvim_comment').setup({comment_empty = false})
require"surround".setup{}

g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
g.lastplace_ignore_buftype = "quickfix,nofile,help"

require('nvim-peekup.config').on_keystroke["paste_reg"] = "\""

-- DIAL
local augend = require("dial.augend")

require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal,
    augend.date.alias["%m/%d"],
    augend.constant.alias.alpha,
  },
}

-- AUTOPAIRS
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
