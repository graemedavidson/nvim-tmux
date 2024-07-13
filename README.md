# Neovim + Tmux setup

This repo contains an opinionated implementation of Tmux and Neovim. The intention of this repo was for testing new
plugins and setups in isolation. Setup not intended for use or reference of a good approach :).

- [Bindings](#bindings)
- [Tmux](#tmux)
- [Neovim](#neovim)
- [Docker Build](#docker-build)

## Bindings

Tmux command prefix: `C-a`

Review [Key Bindings](./key-bindings.md) for a list of common and custom key bindings made available in this config.

Review bindings:

- [which-key](https://github.com/folke/which-key.nvim)

### Tmux

- `<leader>`: the bound leader key (`ctrl-a`)

| Binding                   | Description
| ---                       | ---
| `ctrl <leader> $`         | Name a session
| `ctrl <leader> s`         | Change session
| `ctrl <leader> |`         | Add vertical split
| `ctrl <leader> -`         | Add horizontal split
| `ctrl <leader> z`         | Focus on highlighted split
| `ctrl <leader> ,`         | Name tab
| `ctrl <leader> c`         | Add new tab
| `shift left`              | Switch to next left tab
| `shift right`             | Switch to next right tab
| `ctrl shift left`         | move tab to the left
| `ctrl shift right`        | Move tab to the right
| `ctrl <leader> =`         | Show buffers
| `ctrl <leader> f`         | Select and open a file listed as a path on active screen
| `ctrl <leader> u`         | Select and open a URL listed on the active screen
| `ctrl <leader> shift T`   | Plugin: tmux-pane-focus: Show options menu

### Nvim

| Binding                   | Description
| ---                       | ---
| `ctrl v`                  | Highlight current line
| `shift v`                 | Enter visual mode and highlight area
| `g c`                     | Toggle comment
| `ctrl +`                  | Increment number
| `ctrl -`                  | Decrement number

#### Commands

| Command                   | Description
| ---                       | ---
| `:Tabularize /<char>`     | add tabs based on inputted character for alignment
| `:StripWhitespace`        | Strips tailing whitespace
| `:Mason`                  | Show installed linters and LSP servers
| `:WhichKey`               | Show keyboard shortcuts, shows when starting commands

## Tmux

### Plugins

Plugins installed via TPM as part of [docker build](#docker-build) process.

- [Tmux config](./config/tmux/.tmux.conf)

| Plugin                                                                                            | Description
| ---                                                                                               | ---
| [tpm](https://github.com/tmux-plugins/tpm)                                                        | Tmux Plugin Manager
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)                                    | basic tmux settings everyone can agree on
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)                                  | Persists tmux environment across system restarts.
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)                                  | Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on.
| [tmux-open](https://github.com/tmux-plugins/tmux-open)                                            | Tmux key bindings for quick opening of a highlighted file or URL
| [tmux-fpp](https://github.com/tmux-plugins/tmux-fpp)                                              | Quickly open any path on your terminal
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank)                                            | Copying to system clipboard
| [tmux-fzf-session-switch (Deactivated)](https://github.com/thuanpham2311/tmux-fzf-session-switch) | Switch session using FZF popup
| [tmux-pane-focus](https://github.com/graemedavidson/tmux-pane-focus)                              | Pane focus

## Neovim

Neovim config built on top of [LazyVim](https://github.com/nvim-lua/kickstart.nvim) template utilising the
[modular framework](https://github.com/dam9000/kickstart-modular.nvim) for improved readability.

- [Nvim config](./config/nvim/)
    - [Kickstart default plugins](./config/nvim/lua/kickstart/plugins/)
    - [Custom plugins](./config/nvim/lua/custom/plugins/)

### Plugins

Kickstart installs and configures a selection of [standard plugins](https://github.com/dam9000/kickstart-modular.nvim/tree/master/lua/kickstart/plugins).
Custom plugins added by adding a `<plugin>.lua` file to the [`./config/nvim/lua/custom/plugins/`](./config/nvim/lua/custom/plugins/).

| Plugin                                                                            | Description
| ---                                                                               | ---
| [better-whitespace.lua](https://github.com/ntpeters/vim-better-whitespace)        | Highlight and remove trailing whitespaces
| [colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)                   | Colour highlighter
| [editorconfig.lua](https://github.com/gpanders/editorconfig.nvim)                 | Editorconfig support
| [focus.lua](https://github.com/nvim-focus/focus.nvim)                             | Pane select focus resize
| [fzf.lua](https://github.com/junegunn/fzf.vim)                                    | FZF support
| [go.lua](https://github.com/ray-x/go.nvim)                                        | GO support
| [ident-blankline.lua](https://github.com/lukas-reineke/indent-blankline.nvim)     | Indentation guides
| [jqx.lua](https://github.com/gennaro-tedesco/nvim-jqx)                            | JQ support
| [lastplace.lua](https://github.com/ethanholz/nvim-lastplace)                      | Open files with cursor in place where file closed
| [null-ls.lua](https://github.com/jose-elias-alvarez/null-ls.nvim)                 | **ARCHIVED**: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
| [rainbow-delimiters.lua](https://github.com/HiPhish/rainbow-delimiters.nvim)      | Rainbow parentheses
| [tabular.lua](https://github.com/godlygeek/tabular)                               | Reformat text by tabs
| [trouble.lua](https://github.com/folke/trouble.nvim)                              | A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
| [ts-autotag.lua](https://github.com/windwp/nvim-ts-autotag)                       | Use treesitter to autoclose and autorename html tag
| [undotree.lua](https://github.com/mbbill/undotree)                                | Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches

Plugins to review:

| Plugin                                                                            | Description
| ---                                                                               | ---
| [guihua.lua](https://github.com/ray-x/guihua.lua)                                 | Guihua: A Lua Gui and util library for nvim plugins
| [dial.lua](https://github.com/monaqa/dial.nvim)                                   | Increment/Decrement different types, still in dev
| [octo.lua](https://github.com/pwntester/octo.nvim)                                | GitHub support. Looking to show PR comments in vim

### Custom Config

Custom configuration overriding default kickstart and custom plugins.

| Change                                | Local Path | Original Src
| ---                                   | ---        | ---
| Changes code complete to use enter    | [`./config/nvim/lua/kickstart/plugins/cmp.lua`](./config/nvim/lua/kickstart/plugins/cmp.lua) | [Default](https://github.com/dam9000/kickstart-modular.nvim/blob/master/lua/kickstart/plugins/cmp.lua#L56)

### Colour Scheme

- [Tokyonight](https://github.com/folke/tokyonight.nvim)
- [Plugin install](./config/nvim/lua/kickstart/plugins/tokyonight.lua)
    - [Configuration Options](https://www.lazyvim.org/plugins/colorscheme#tokyonightnvim)

### LSPs, Linters and More

Installed via [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [Mason](https://github.com/williamboman/mason.nvim)
plugins installed as part of default kickstart config.

## Docker Build

Testing setup based on running stack within Docker container for isolation and experimentation.

- [Dockerfile](./build/Dockerfile)

Build local container with default `latest` tag:

```bash
docker-compose build
# docker build -t test-nvim-tmux -f build/Dockerfile .
```

```bash
docker-compose run -it tmux-nvim
# docker run -it test-nvim-tmux:latest
```

Run `tmux` to start new tmux session.

```bash
tmux
```

Start vim:

```bash
vim
```

### Base Image

Currently base image using latest [Python image](https://hub.docker.com/_/python) as tool chain requires it.

### Installs

| Software                                          | Description
| ---                                               | ---
| [Tmux](https://github.com/tmux/tmux/wiki)         | wget: Terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.
| [Neovim](https://neovim.io/)                      | wget: hyperextensible Vim-based text editor
| [Bison](https://github.com/BurntSushi/ripgrep)    | apt: dependency for nvim build
| [Git](https://git-scm.com/)                       | pre-installed on docker image: Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
| [Python](https://www.python.org)                  | pre-installed on docker image: Python interpreter
| [FZF](https://github.com/junegunn/fzf)            | apt: A command-line fuzzy findeR
| [Ripgrep](https://github.com/BurntSushi/ripgrep)  | apt: ripgrep recursively searches directories for a regex pattern while respecting your gitignore
| [NodeJS](https://nodejs.org/en)                   | apt: required for installing linters
| [Vale](https://github.com/errata-ai/vale)         | wget: A markup-aware linter for prose built with speed and extensibility in mind.
