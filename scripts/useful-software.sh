#!/usr/bin/env bash

echo ""
echo "☕️ Grab a coffe, it will take a while..."
echo ""

################################################################################
# Essentials
################################################################################
echo "> Installing essentials..."

sudo apt-get update

sudo apt-get install -y git-all
sudo apt-get install -y curl
sudo apt-get install -y htop
sudo apt-get install -y tree
sudo apt-get install -y xclip
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
sudo apt-get install -y build-essential
sudo apt-get install -y python-software-properties
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip

################################################################################
# Better terminal
################################################################################
echo "> Installing oh-my-zsh..."

sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

if [ -d "$HOME"/.oh-my-zsh ]; then
  rm -rf "$HOME"/.oh-my-zsh
fi

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Multiplexer
sudo apt-get install -y tmux

echo "> Installing powerline fonts..."

if [ -d "$HOME"/src/fonts ]; then
  rm -rf "$HOME"/src/fonts
fi

# fonts
git clone https://github.com/powerline/fonts.git "$HOME"/src/fonts

cd "$HOME"/src/fonts || exit
./install.sh
cd "$HOME" || exit
rm -rf "$HOME"/src/fonts

echo "> Changing shell to zsh ..."

chsh -s "$(which zsh)"

################################################################################
# Misc
################################################################################
echo "> Installing misc..."

# grep replacement
sudo apt-get install -y ripgrep

# nano sucks
sudo apt-get install -y vim

# json manipulation
sudo apt-get install -y jq

# yaml manipulation
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
sudo add-apt-repository ppa:rmescandon/yq
sudo apt update
sudo apt install -y yq

# docker / docker-compose
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo pip3 -v install docker-compose

echo "Done!"

