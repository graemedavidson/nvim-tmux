# Neovim + Tmux setup

This repo contains an opinionated implementation of Tmux and Neovim. The intention of this repo was for testing new
plugins and setups in isolation. Setup not intended for use or reference of a good approach :). The current
configuration is a mix up of many other developers setups and requires refining as some config unused or commented out.
Work to make the changes described using [GitHub Issues](https://github.com/graemedavidson/nvim-tmux/issues).

- [Local Setup](#local-setup)
- [Debugging](#debugging)
- [Bindings](#bindings)
- [Installs](#installs)
  - [Tmux](#tmux)
  - [Neovim](#neovim)
  - [Colour Schemes](#colour-schemes)
  - [Review](#review)
  - [Deactivated](#deactivated)
- [Dependabot](#dependabot)
- [Links](#links)

## Local Setup

Build local container with default `latest` tag:

```bash
docker build -t test-nvim-tmux -f build/Dockerfile .
```

```bash
docker run -it test-nvim-tmux:latest
```

Run `tmux` to start new tmux session.

```bash
tmux
```

## Debugging

Neovim Plugins installed in standard directory:

```
docker run -it test:nv ls ~/.local/share/nvim/site/pack/paqs/start
```

## Bindings

Review [Key Bindings](./key-bindings.md).

## Base Image

Currently base image using latest [Python image](https://hub.docker.com/_/python) as tool chain requires it.

Underlying OS: `Debian GNU/Linux 11 (bullseye)`.

## Installs

| Software                                          | Description
| ---                                               | ---
| [Tmux](https://github.com/tmux/tmux/wiki)         | Terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.
| [Neovim](https://neovim.io/)                      | hyperextensible Vim-based text editor
| [Git](https://git-scm.com/)                       | Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
| [FZF](https://github.com/junegunn/fzf)            | A command-line fuzzy finder
| [Ripgrep](https://github.com/BurntSushi/ripgrep)  | ripgrep recursively searches directories for a regex pattern while respecting your gitignore

### Tmux

| Plugin                                                                                            | Description
| ---                                                                                               | ---
| [tpm](https://github.com/tmux-plugins/tpm)                                                        | Tmux Plugin Manager
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)                                    | basic tmux settings everyone can agree on
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)                                  | Persists tmux environment across system restarts.
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)                                  | Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on.
| [tmux-open](https://github.com/tmux-plugins/tmux-open)                                            | Tmux key bindings for quick opening of a highlighted file or url
| [tmux-fpp](https://github.com/tmux-plugins/tmux-fpp)                                              | Quickly open any path on your terminal
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank)                                            | Tmux plugin for copying to system clipboard
| [tmux-fzf-session-switch (Deactivated)](https://github.com/thuanpham2311/tmux-fzf-session-switch) | Switch session using fzf popup
| [tmux-keyboard-layout](https://github.com/imomaliev/tmux-keyboard-layout)                         | Tmux plugin to show current keyboard layout

### Neovim

| Plugin                                                                          | Category          | Description
| ---                                                                             | ---               | ---
| [Packer](https://github.com/wbthomason/packer.nvim)                             | -                 | plugin/package management for Neovim used to install all other plugins listed
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                      | LSP               | Configs for the Nvim LSP client (:help lsp).
| [nvim-lspinstall](https://github.com/anott03/nvim-lspinstall)                   | LSP               | Recently, neovim removed the :LspInstall function. It made it really easy to install language servers for its built in lsp
| [nvim-lspfuzzy](https://github.com/ojroques/nvim-lspfuzzy)                      | LSP               | This plugin makes the Neovim LSP client use FZF to display results and navigate the code. It works by redefining your LSP handlers so that they call FZF.
| [lspkind-nvim](https://github.com/onsails/lspkind.nvim)                         | UI                | This tiny plugin adds vscode-like pictograms to neovim built-in lsp:
| [lsp-status.nvim](https://github.com/nvim-lua/lsp-status.nvim)                  | UI                | This is a Neovim plugin/library for generating statusline components from the built-in LSP client.
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)              | UI                | highly extendable fuzzy finder over lists
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)            | UI                | provides the same icons as well as colors for each icon.
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                    | UI                | A blazing fast and easy to configure Neovim statusline written in Lua.
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | UI                | This plugin adds indentation guides to all lines (including empty lines).
| [trouble.nvim](https://github.com/folke/trouble.nvim)                           | UI                | A pretty list for showing diagnostics, references, telescope results, quick fix and location lists to help you solve all the trouble your code is causing.
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                     | UI                | Super fast git decorations implemented purely in lua/teal.
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)            | UI                | A high-performance color highlighter
| [vim-lastplace](https://github.com/farmergreg/vim-lastplace)                    | UI                | Intelligently reopen files at your last edit position.
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi)                   | UI                | Multiple cursors
| [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)                            | UI                | The goal of nvim-bqf is to make Neovim's quick fix window better.
| [nvim-peekup](https://github.com/gennaro-tedesco/nvim-peekup)                   | UI                | Finally vim registers made easy and fun
| [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)        | UI                | A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
| [focus.nvim](https://github.com/beauwilliams/focus.nvim)                        | UI                | Auto-Resizing Focused Splits/Windows for Neovim
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                             | CMP Autocomplete  | nvim-cmp source for buffer words.
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)                           | CMP Autocomplete  | nvim-cmp source for vim's cmdline.
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                         | CMP Autocomplete  | nvim-cmp source for neovim's built-in language server client.
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)                         | CMP Autocomplete  | nvim-cmp source for neovim Lua API.
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                 | CMP Autocomplete  | nvim-cmp source for filesystem paths.
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                 | CMP Autocomplete  | A completion engine plugin for neovim written in Lua.
| [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)                               | CMP Autocomplete  | nvim-cmp source for vim-vsnip
| [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)                               | CMP Autocomplete  | VSCode(LSP)'s snippet feature in vim.
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                        | Utility           | All the lua functions I don't want to write twice.
| [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)            | Language          | EditorConfig plugin for Vim
| [nvim-jqx](https://github.com/gennaro-tedesco/nvim-jqx)                         | Language          | browser and preview json files
| [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)              | Language          | Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
| [undotree](https://github.com/mbbill/undotree)                                  | Utility           | The undo history visualizer for VIM
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                      | Utility           | auto pairs for neovim written by lua
| [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)      | Utility           | Better whitespace highlighting for Vim
| [surround.nvim](https://github.com/ur4ltz/surround.nvim)                        | Utility           | A surround text object plugin for neovim written in lua
| [nvim-comment](https://github.com/terrortylor/nvim-comment)                     | Utility           | A comment toggler for Neovim, written in Lua
| [dial.nvim](https://github.com/monaqa/dial.nvim)                                | Utility           | enhanced increment/decrement plugin for Neovim
| [tabular](https://github.com/godlygeek/tabular)                                 | Utility           | Vim script for text filtering and alignment
| [fzf-lua](https://github.com/ibhagwan/fzf-lua)                                  | Utility           | Improved fzf.vim written in lua

The following binaries are also installed within the docker image to support neovim:

- [Lua language Server](https://github.com/sumneko/lua-language-server)
- [Terraform language server](https://github.com/hashicorp/terraform-ls)

### Colour Schemes

| Plugin                                                                          | Category          | Description
| ---                                                                             | ---               | ---
| [material.nvim](https://github.com/marko-cerovac/material.nvim)                 | UI: themes        | A port of Material color scheme
| [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim)                 | UI: themes        | A color scheme helper for Neovim.
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                      | UI: themes        | Rainbow parentheses for neovim using tree-sitter. This is a module for nvim-treesitter, not a standalone plugin. It requires and is configured via nvim-treesitter
| [lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim)                     | UI: themes        | Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)           | Treesitter        | The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim

### Review

List of plugins identified for testing

| Plugin                                                                          | Category          | Description
| ---                                                                             | ---               | ---
| [Harpoon](https://github.com/ThePrimeagen/harpoon)                              | Utility           | Add bookmarks to high traffic files with ability to switch between
| [playground](https://github.com/nvim-treesitter/playground)                     | Utility           | Treesitter playground integrated into Neovim

### Deactivated

| Plugin                                                                          | Category          | Description
| ---                                                                             | ---               | ---
| [vim-polyglot](https://github.com/sheerun/vim-polyglot)                         | Language          | A collection of language packs for Vim.
| [vim-ripgrep](https://github.com/jremmen/vim-ripgrep)                           | Utility           | Use Ripgrep in Vim and display results in a quick fix list
| [vim-rooter](https://github.com/airblade/vim-rooter)                            | Utility           | Changes Vim working directory to project root.
| [nerdtree](https://github.com/preservim/nerdtree)                               | Utility           | A tree explorer plugin for vim

## Dependabot

> Monitor vulnerabilities in dependencies used in your project and keep your dependencies up-to-date with Dependabot.

[Documentation](https://docs.github.com/en/code-security/dependabot)

[Repository configuration](./.github/dependabot.yml)

### Configurations

https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file

## Links

- <https://framal.xyz/why-ive-spent-my-easter-break-customizing-neovim/>
- <https://vim.rtorr.com/>
- <https://bryankegley.me/posts/nvim-getting-started/>
  - <https://github.com/bkegley/dotfiles>
