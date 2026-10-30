#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
RESET="\033[0m"

printf "\n${WHITE}================================================================================
SETTING UP YOUR COMPUTER!
================================================================================${RESET}\n"

printf "\n${YELLOW}Installing Homebrew...${RESET}\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ `uname -m` == 'arm64']]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "/Users/$USER/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

printf "\n${MAGENTA}Installing Node.js (and npm)...${RESET}}\n"
brew install node@20
npm install -g npm
cp ./.npmrc ~/.npmrc

printf "\n${MAGENTA}Installing pnpm...${RESET}\n"
curl -fsSL https://get.pnpm.io | sh -

printf "\n${BLUE}Installing Oh My ZSH...${RESET}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printf "\n${GREEN}Installing fonts...${RESET}\n"
cp ./fonts/**/*/.{otf,ttf} ~/Library/Fonts/

printf "\n${MAGENTA}Installing Powerlevel10k...${RESET}\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
cp ./.p10k.zsh ~/.p10k.zsh
cp ./.zshrc ~/.zshrc
source ~/.zshrc

printf "\n${WHITE}================================================================================
${GREEN}ALL SET!
${WHITE}================================================================================${RESET}\n"
