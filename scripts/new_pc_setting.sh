#! /bin/bash

cd 
mkdir ~/tmp
cd tmp
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
cd ..


mkdir ~/scripts

brew install cmatrix
brew install bitwarden
brew install vim
brew install curl
brew install git
brew install lazygit
brew install openjdk@21
sudo ln -sfn /usr/local/opt/openjdk@21/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
brew install tree
brew install tmux
brew install starship
brew install wget
brew install csvkit
brew install neofetch
brew install zsh-autosuggestions


wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip

git clone git@github.com:pamishenko/vimrc.git
cd vimrc
sh start.sh

echo "source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
" >> ~/.zshrc

cd
GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo -e "${GREEN}Настройка завершена${NC}"
