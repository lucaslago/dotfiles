#!/bin/bash

set -eu

if [[ ! -e /usr/local/bin/z.sh ]]; then
  echo "==> Installing z"
  git clone https://github.com/rupa/z.git
  sudo cp ./z/z.sh /usr/local/bin && rm -rf ./z
fi

VIM_PLUG_FILE="${HOME}/.vim/autoload/plug.vim"
if [ ! -f "${VIM_PLUG_FILE}" ]; then
  echo "==> Installing vim plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo " ==> Vim plugins will be installed on vim startup"
fi

NEOVIM_PLUG_FILE="${HOME}/.local/share/nvim/site/autoload/plug.vim"
if [ ! -f "${NEOVIM_PLUG_FILE}" ]; then
  echo "==> Installing neovim plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "==> Neovim plugins will be installed on nvim startup"
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

ln -sf $(pwd)/vimrc "${HOME}/.vimrc"
mkdir -p "${HOME}/.config/nvim" && ln -sf $(pwd)/init.vim "${HOME}/.config/nvim/init.vim" && ln -sf $(pwd)/coc-settings.json "${HOME}/.config/nvim/coc-settings.json"
ln -sf $(pwd)/zshrc "${HOME}/.zshrc"
ln -sf $(pwd)/tmux.conf "${HOME}/.tmux.conf"
ln -sf $(pwd)/gitconfig "${HOME}/.gitconfig"

if [ ! -d "${HOME}/.config/coc" ]; then
  mkdir -p "${HOME}/.config/coc/extensions" && ln -sf $(pwd)/coc-nvim/package.json "$HOME/.config/coc/extensions/package.json" && (cd "$HOME/.config/coc/extensions" && npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod)
fi

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
