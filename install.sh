#!/usr/bin/bash

set -e

echo "[*] Adding Neovim Unstable PPA..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable

echo "[*] Updating system..."
sudo apt update
sudo apt upgrade -y

echo "[*] Installing base packages..."
sudo apt install -y \
  build-essential \
  curl \
  git \
  wget \
  unzip \
  zip \
  software-properties-common \
  ca-certificates \
  gnupg \
  lsb-release \
  neovim \
  tmux \
  fzf \
  zsh

# https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-install
echo "[*] Installing NVM: Node Version Manager..."
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

cp ./.zshrc ~/.zshrc

echo "[*] Installing Oh My Zsh..."
KEEP_ZSHRC=yes CHSH=yes RUNZSH=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "[*] Installing Powerlevel10k Theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "[*] Installing Node (LTS)..."
nvm install --lts
