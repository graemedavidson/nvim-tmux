FROM python:3.12.0
# https://hub.docker.com/_/python

LABEL version="0.0.1"

## APT #################################################################################################################################
# https://www.debian.org/distrib/packages#search_packages | `apt list <package> -a`
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential=12.9 \
  fzf=0.24.3-1+b6 \
  ripgrep=12.1.1-1+b1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

## Install Tmux ######################################################################################################################
# https://github.com/tmux/tmux/releases
ARG TMUX_VERSION=3.3a

RUN mkdir /opt/tmux
WORKDIR /opt/tmux
RUN wget --progress=dot:giga https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz && \
  tar xzf tmux-${TMUX_VERSION}.tar.gz
WORKDIR /opt/tmux/tmux-${TMUX_VERSION}
RUN ./configure && \
  make && \
  make install && \
  ln -s /opt/tmux/tmux-${TMUX_VERSION}/tmux /usr/bin/tmux

## Install FPP #########################################################################################################################
RUN mkdir /opt/fpp && \
  git clone https://github.com/facebook/PathPicker.git /opt/fpp && \
  ln -s /opt/fpp/fpp /usr/bin/fpp

## Install Neovim ######################################################################################################################
# https://github.com/neovim/neovim/releases
ARG NEOVIM_VERSION=v0.8.3

RUN mkdir /opt/nvim
WORKDIR /opt/nvim
RUN wget --progress=dot:giga https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz
RUN tar xzf nvim-linux64.tar.gz && \
  ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/bin/nvim && \
  ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/bin/vim

# Install Packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

## LSP Servers (Which do not auto install) #############################################################################################
# LUA: https://github.com/sumneko/lua-language-server/releases
ARG LUA_LS_URL=https://github.com/sumneko/lua-language-server/releases/download
ARG LUA_LS_BUILD=linux-x64
ARG LUA_LS_VERSION=3.6.13

RUN mkdir /opt/lua-ls
WORKDIR /opt/lua-ls

RUN wget --progress=dot:giga ${LUA_LS_URL}/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-${LUA_LS_BUILD}.tar.gz
RUN tar zxf lua-language-server-${LUA_LS_VERSION}-${LUA_LS_BUILD}.tar.gz && \
  ln -s /opt/lua-ls/bin/lua-language-server /usr/bin/lua-language-server

# Terraform: https://github.com/hashicorp/terraform-ls/releases
# Ensure release version has zip asset
ARG TF_LS_URL=https://github.com/hashicorp/terraform-ls/releases/download
ARG TF_LS_BUILD=linux_amd64
ARG TF_LS_VERSION=0.30.1

RUN mkdir /opt/terraform-ls
WORKDIR /opt/terraform-ls

RUN wget --progress=dot:giga ${TF_LS_URL}/v${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_${TF_LS_BUILD}.zip
RUN unzip terraform-ls_${TF_LS_VERSION}_${TF_LS_BUILD}.zip && \
  ln -s /opt/terraform-ls/terraform-ls /usr/bin/terraform-ls

## User ################################################################################################################################
RUN useradd -ms /bin/bash developer && \
  usermod -aG sudo developer
USER developer
WORKDIR /home/developer

## Config + Install Plugins ############################################################################################################
# Tmux
COPY ./config/tmux/.tmux.conf /home/developer/
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

# Neovim
RUN mkdir -p /home/developer/.config/nvim
COPY ./config/nvim/ /home/developer/.config/nvim/
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# RUN nvim --headless +TSUpdate +qall - # install treesitter libraries

## Entry ###############################################################################################################################
ENTRYPOINT ["bash"]
