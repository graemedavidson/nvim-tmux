FROM python:3.12.4
# https://hub.docker.com/_/python

LABEL version="0.1.0"

## APT #################################################################################################################################
# https://www.debian.org/distrib/packages#search_packages | `apt list <package> -a`
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential=12.9 \
  fzf=0.38.0-1+b1 \
  ripgrep=13.0.0-4+b2 \
  bison=2:3.8.2+dfsg-1+b1 \
  nodejs=18.19.0+dfsg-6~deb12u2 \
  npm=9.2.0~ds1-1 \
  golang-go=2:1.19~1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

## Install Tmux ######################################################################################################################
# https://github.com/tmux/tmux/releases
ARG TMUX_VERSION=3.4

RUN mkdir /opt/tmux
WORKDIR /opt/tmux
RUN wget --progress=dot:giga \
  https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz \
  && tar xzf tmux-${TMUX_VERSION}.tar.gz
WORKDIR /opt/tmux/tmux-${TMUX_VERSION}
RUN ./configure && make && make install \
  && ln -s /opt/tmux/tmux-${TMUX_VERSION}/tmux /usr/bin/tmux

## Install FPP #########################################################################################################################
RUN mkdir /opt/fpp \
  && git clone https://github.com/facebook/PathPicker.git /opt/fpp \
  && ln -s /opt/fpp/fpp /usr/bin/fpp

## Install Neovim ######################################################################################################################
# https://github.com/neovim/neovim/releases
ARG NEOVIM_VERSION=v0.10.0

RUN mkdir /opt/nvim
WORKDIR /opt/nvim
RUN wget --progress=dot:giga \
  https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz \
  && tar xzf nvim-linux64.tar.gz \
  && ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/bin/nvim \
  && ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/bin/vim

## Install Vale ######################################################################################################################
# https://github.com/errata-ai/vale/releases
ARG VALE_VERSION=3.6.1

RUN mkdir /opt/vale
WORKDIR /opt/vale
RUN wget --progress=dot:giga \
  https://github.com/errata-ai/vale/releases/download/v${VALE_VERSION}/vale_${VALE_VERSION}_Linux_64-bit.tar.gz \
  && tar -xzf vale_${VALE_VERSION}_Linux_64-bit.tar.gz \
  && ln -s /opt/vale/vale /usr/bin/vale

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
RUN nvim --headless -c '+Lazy! sync' -c '+TSUpdate' +qa
# NOTE: Mason does not have installall command as of yet: https://github.com/williamboman/mason.nvim/discussions/1618
# Installs at startup, which is not idea for a test env, but will have to do for now.

# Vale Setup
# hadolint ignore=DL3059
RUN mkdir -p .config/vale
COPY ../config/nvim_plugins/vale/.vale.ini .config/vale
# Sync Libraries to /home/developer/.local/share/vale/styles
RUN vale sync
COPY ../config/nvim_plugins/vale/.vale/styles/Vocab .local/share/vale/styles/config/vocabularies

## Entry ###############################################################################################################################
ENTRYPOINT ["bash"]
