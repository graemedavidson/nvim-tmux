local vim = vim

-- vim.g.mapleader = ' '
vim.g.colors_name = 'material'
vim.g.material_style = "deep ocean"

local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g      -- a table to access global variables
-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

o.termguicolors = true
o.background = 'dark'
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = true
o.incsearch = true
o.hidden = true
o.completeopt='menu,menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.ignorecase = true

o.joinspaces = false
o.scrolloff = 4 -- Lines of context
o.shiftround = true -- Round indent
o.sidescrolloff = 8 -- Columns of context
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
wo.list = true -- Show some invisible characters (tabs...)

o.updatetime = 1000 -- testing ui diagnostic pop up time

g.strip_whitespace_on_save=1
g.strip_whitespace_confirm=0

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true -- display line numbers
wo.signcolumn = 'yes'
wo.wrap = false

g.NERDTreeShowHidden = 1
g.NERDTreeWinPos = "right"
g.NERDSpaceDelims = 1

-- Backups
o.backup = true
o.directory = vim.fn.stdpath('config') .. '/swap'
o.undofile = true
o.undodir = vim.fn.stdpath('config') .. '/undo'
o.writebackup = true
o.backupdir = vim.fn.stdpath('config') .. '/backup'
o.backupdir = '/home/gd/.nvim/backup//'
bo.swapfile = false

require'gd'
