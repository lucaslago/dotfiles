#!/bin/bash

set -eu

rm -rf ${HOME}/.zsh
rm -rf ${HOME}/Development
rm -rf ${HOME}/.vimrc
rm -rf ${HOME}/.vim/
rm -rf ${HOME}/.config/nvim
rm -rf ${HOME}/.local/share/nvim
rm -rf ${HOME}/.zshrc
rm -rf ${HOME}/.zsh
rm -rf ${HOME}/.oh-my-zsh
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.gitconfig
rm -rf ${HOME}/.tmux/plugins
rm -rf ${HOME}/.config/coc/extensions

echo "Symlinks and plugin folders removed"
