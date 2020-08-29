#!/bin/bash

set -eu

rm -rf ${HOME}/.zsh
rm -rf ${HOME}/Development
rm -rf ${HOME}/.vimrc
rm -rf ${HOME}/.vim/
rm -rf ${HOME}/.config/nvim
rm -rf ${HOME}/.local/share/nvim
rm -rf ${HOME}/.zshrc
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.gitconfig
rm -rf ${HOME}/.tmux/plugins

echo "Symlinks and plugin folders removed"
