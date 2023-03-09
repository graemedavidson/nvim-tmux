local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return packer.startup(function()
  local use = use

  -- LSP ---------------------------------------------------------------------
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'anott03/nvim-lspinstall'
  use 'ojroques/nvim-lspfuzzy'

  -- UI ---------------------------------------------------------------------
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/lsp-status.nvim'
  -- use 'nvim-lua/popup.nvim'
  use 'nvim-lua/telescope.nvim'
  use {'kyazdani42/nvim-web-devicons'}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'folke/trouble.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'farmergreg/vim-lastplace'
  use 'terryma/vim-multiple-cursors'
  use 'kevinhwang91/nvim-bqf'
  use 'gennaro-tedesco/nvim-peekup'
  use 'simrat39/symbols-outline.nvim'
  use 'beauwilliams/focus.nvim'

  -- UI: Themes ---------------------------------------------------------------------
  use 'marko-cerovac/material.nvim'
  use 'tjdevries/colorbuddy.nvim'
  use 'p00f/nvim-ts-rainbow'
  use 'folke/lsp-colors.nvim'

  -- Treesitter ---------------------------------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate'
  }

  -- CMP Autocomplete ---------------------------------------------------------------------
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  -- Snip (required for cmp above to function with some lsp servers) ---------------------------------------------------------------------
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Language ---------------------------------------------------------------------
  use 'nvim-lua/plenary.nvim'
  use 'editorconfig/editorconfig-vim'
  use'gennaro-tedesco/nvim-jqx'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Util ---------------------------------------------------------------------
  use 'mbbill/undotree'
  use 'windwp/nvim-autopairs'
  use 'nvim-treesitter/playground'
  use 'ntpeters/vim-better-whitespace'
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "sandwich"}
    end
  }
  use 'terrortylor/nvim-comment'
  use 'monaqa/dial.nvim'
  use 'godlygeek/tabular'
  use 'ibhagwan/fzf-lua'

  end
)
