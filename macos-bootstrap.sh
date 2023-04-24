#!/bin/bash

set -eu

if [[ ! -e /usr/local/bin/z.sh ]]; then
  echo "==> Installing z"
  git clone https://github.com/rupa/z.git
  sudo cp ./z/z.sh /usr/local/bin && rm -rf ./z
fi

PACKER_DIST="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "${PACKER_DIST}" ]; then
  echo "==> Installing Packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo "==> Installing oh-my-zsh + zsh plugins"
  git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME}/.oh-my-zsh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

if ! echo $SHELL | grep "zsh" > /dev/null; then
  echo "==> Setting shell to zsh..."
  chsh -s /usr/bin/zsh
fi

echo "==> Creating dev directories"
mkdir -p ~/Development

echo "==> Setting up dotfiles"
git remote set-url origin git@github.com:lucaslago/dotfiles.git

ln -sf $(pwd)/zshrc "${HOME}/.zshrc"
ln -sf $(pwd)/tmux.conf "${HOME}/.tmux.conf"
ln -sf $(pwd)/tmate.conf "${HOME}/.tmate.conf"
ln -sf $(pwd)/gitconfig "${HOME}/.gitconfig"
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"

mkdir -p "${HOME}/.config/coc/extensions"

if [ ! -d "${HOME}/.tmux/plugins" ]; then
  echo " ==> Installing tmux plugins"
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  ${HOME}/.tmux/plugins/tpm/bin/install_plugins
fi

if ! command -v graphql-lsp > /dev/null; then
  echo "==> Installing graphql-lsp"
  npm install --global graphql-language-service-cli
fi

echo "Change terminal color to gruvbox-dark by running 'bash ./gruvbox-dark.sh'"

echo "Done!"
