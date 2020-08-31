#!/bin/bash

# TODO: Install coc plugins using plug

set -eu

sudo apt update
sudo apt upgrade

sudo apt install -y \
  git \
  deja-dup \
  python3 \
  python \
  nodejs \
  python3-pydrive \
  awscli \
  curl \
  htop \
  tmux \
  vim \
  neovim \
  tmate \
  jq \
  silversearcher-ag \
  ripgrep \
  tig \
  unzip \
  zip \
  wget \
  zsh \
  fzf \
  xclip \
  apt-transport-https \
  ca-certificates \
  gnupg-agent \
  software-properties-common \
  s-tui \
  stress \
  powertop \
  tlp \
  firefox

sudo snap install authy --beta
sudo snap install code --classic
snap install spotify

if ! command docker -v &>/dev/null; then
  echo "Installing Docker"
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-compose
  sudo docker run hello-world
  sudo usermod -aG docker $USER
fi


if ! command google-chrome-stable --help &> /dev/null;
then
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
	 && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
	 && sudo apt update \
	 && sudo apt install google-chrome-stable \
	 && true
	exit
fi

if ! command yarn --help &> /dev/null;
then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install yarn
fi


VIM_PLUG_FILE="${HOME}/.vim/autoload/plug.vim"
if [ ! -f "${VIM_PLUG_FILE}" ]; then
  echo " ==> Vim plugins will be installed on vim startup"
fi

NEOVIM_PLUG_FILE="${HOME}/.local/share/nvim/site/autoload/plug.vim"
if [ ! -f "${NEOVIM_PLUG_FILE}" ]; then
  echo " ==> Neovim plugins will be installed on nvim startup"
fi

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo " ==> Installing oh-my-zsh + zsh plugins"
  git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME}/.oh-my-zsh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

echo "==> Setting shell to zsh..."
chsh -s /usr/bin/zsh

echo "==> Creating dev directories"
mkdir -p ~/Development 

if [ ! -d ~/Development/dotfiles ]; then
  echo "==> Setting up dotfiles"
  # the reason we dont't copy the files individually is, to easily push changes
  # if needed
  cd ~/Development
  git clone --recursive https://github.com/lucaslago/dotfiles

  cd ~/Development/dotfiles
  git remote set-url origin git@github.com:lucaslago/dotfiles.git

  ln -sf $(pwd)/vimrc "${HOME}/.vimrc"
  mkdir -p "${HOME}/.config/nvim" && ln -sf $(pwd)/init.vim "${HOME}/.config/nvim/init.vim"
  ln -sf $(pwd)/zshrc "${HOME}/.zshrc"
  ln -sf $(pwd)/tmux.conf "${HOME}/.tmux.conf"
  ln -sf $(pwd)/gitconfig "${HOME}/.gitconfig"
fi

if [ ! -d "${HOME}/.tmux/plugins" ]; then
  echo " ==> Installing tmux plugins"
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  ${HOME}/.tmux/plugins/tpm/bin/install_plugins
fi

echo "Setting terminal color"
TERMINAL=gnome-terminal bash -c  "$(curl -sLo- https://git.io/vQgMr)"

echo "Done!"
