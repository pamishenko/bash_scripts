#!/bin/bash

# Определяем операционную систему
OS="$(uname -s)"

# Создаем временную директорию
mkdir -p ~/tmp
cd ~/tmp

# Установка Homebrew
if [ "$OS" = "Darwin" ]; then
    # macOS
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
elif [ "$OS" = "Linux" ]; then
    # Linux
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "Unsupported OS: $OS"
    exit 1
fi

# Обновление Homebrew
brew update

# Создаем директорию для скриптов
mkdir -p ~/scripts

# Установка необходимых пакетов
brew install bitwarden vim curl git tree tmux starship wget

# Установка OpenJDK
if [ "$OS" = "Darwin" ]; then
    brew install openjdk@21
    sudo ln -sfn /usr/local/opt/openjdk@21/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
elif [ "$OS" = "Linux" ]; then
    brew install openjdk@21
    echo 'export JAVA_HOME=/home/linuxbrew/.linuxbrew/opt/openjdk@21' >> ~/.bashrc
    export JAVA_HOME=/home/linuxbrew/.linuxbrew/opt/openjdk@21
fi

# Скачивание и установка шрифтов FiraCode
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
if [ "$OS" = "Linux" ]; then
    fc-cache -fv
fi

# Клонирование и настройка vimrc
git clone git@github.com:pamishenko/vimrc.git ~/vimrc
cd ~/vimrc
sh start.sh

# Возвращаемся в домашнюю директорию
cd ~

GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo -e "${GREEN}Настройка завершена${NC}"
