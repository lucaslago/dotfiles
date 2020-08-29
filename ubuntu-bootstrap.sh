#!/bin/bash

# TODO:
# Add neovim plugins install step
# Install oh my zsh plugins step
# Install tmux plugins step
# Install tmux oh my zsh plugin
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
	xclip

# chrome
if ! google-chrome-stable --help &> /dev/null
then
		
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
	 && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
	 && sudo apt update \
	 && sudo apt install google-chrome-stable \
	 && true
	exit
fi

sudo snap install authy --beta

VIM_PLUG_FILE="${HOME}/.vim/autoload/plug.vim"
if [ ! -f "${VIM_PLUG_FILE}" ]; then
  echo " ==> Vim plugins will be installed on vim startup"
  # curl -fLo ${VIM_PLUG_FILE} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # mkdir -p "${HOME}/.vim/plugged"
  # pushd "${HOME}/.vim/plugged"
  # git clone "https://github.com/morhetz/gruvbox"
  # git clone "https://github.com/scrooloose/nerdtree"
  # git clone "https://github.com/Xuyuanp/nerdtree-git-plugin"
  # git clone "https://github.com/tpope/vim-sensible"
  # git clone "https://github.com/tpope/vim-surround"
  # git clone "https://github.com/Raimondi/delimitMate"
  # git clone "https://github.com/vim-airline/vim-airline"
  # git clone "https://github.com/neoclide/coc.nvim/tree/release"
  # git clone "https://github.com/othree/yajs.vim"
  # git clone "https://github.com/HerringtonDarkholme/yats.vim"
  # git clone "https://github.com/hashivim/vim-terraform"
  # git clone "https://github.com/tpope/vim-commentary"
  # git clone "https://github.com/junegunn/fzf.vim"
  # git clone "https://github.com/APZelos/blamer.nvim"
  # git clone "https://github.com/liuchengxu/vim-which-key"
  # git clone "https://github.com/sheerun/vim-polyglot"
  # popd
fi

if [ ! -d "${HOME}/.zsh" ]; then
  echo " ==> Installing zsh plugins"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.zsh/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.zsh/zsh-autosuggestions"
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
  ln -sf $(pwd)/init.vim "${HOME}/.config/nvim/init.vim"
  ln -sf $(pwd)/zshrc "${HOME}/.zshrc"
  ln -sf $(pwd)/tmux.conf "${HOME}/.tmux.conf"
  ln -sf $(pwd)/gitconfig "${HOME}/.gitconfig"
fi

if [ ! -d "${HOME}/.tmux/plugins" ]; then
  echo " ==> Installing tmux plugins"
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  ${HOME}/.tmux/plugins/tpm/bin/install_plugins
  #  git clone https://github.com/tmux-plugins/tmux-open.git "${HOME}/.tmux/plugins/tmux-open"
#  git clone https://github.com/tmux-plugins/tmux-yank.git "${HOME}/.tmux/plugins/tmux-yank"
#  git clone https://github.com/tmux-plugins/tmux-prefix-highlight.git "${HOME}/.tmux/plugins/tmux-prefix-highlight"
fi

echo "Done!"

