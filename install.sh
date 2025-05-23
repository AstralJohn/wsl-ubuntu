#!/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

read -p "Enter your full name: (Example: 'John Dinh')" FULL_NAME
read -p "Enter your email: " EMAIL

FULL_NAME="${FULL_NAME:-John Dinh}"
EMAIL="${EMAIL:-johnduydinh@gmail.com}"
set -e

echo "[*************************************************]"
echo "[********* Adding Neovim Unstable PPA... *********]"
echo "[*************************************************]"
sudo add-apt-repository -y ppa:neovim-ppa/unstable

echo "[*************************************************]"
echo "[************** Updating System... ***************]"
echo "[*************************************************]"
sudo apt update
sudo apt upgrade -y

echo "[*************************************************]"
echo "[********** Installing Base Packages... **********]"
echo "[*************************************************]"
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
  zsh \
  ripgrep \
  luarocks \
  xclip \
  zsh-syntax-highlighting

# https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-install
echo "[*************************************************]"
echo "[**** Installing NVM: Node Version Manager... ****]"
echo "[*************************************************]"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"


echo "[*************************************************]"
echo "[************ Installing Oh My Zsh... ************]"
echo "[*************************************************]"
KEEP_ZSHRC=yes CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "[*************************************************]"
echo "[******* Installing Powerlevel10k Theme... *******]"
echo "[*************************************************]"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

cp "$SCRIPT_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

echo "[*************************************************]"
echo "[******* Installing Zsh Autosuggestions... *******]"
echo "[*************************************************]"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "[*************************************************]"
echo "[***** Installing Zsh Syntax Highlighting... *****]"
echo "[*************************************************]"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s "$(command -v zsh)" "$USER"

echo "[*************************************************]"
echo "[************ Installing Node (LTS)... ***********]"
echo "[*************************************************]"
nvm install --lts


echo "[*************************************************]"
echo "[************ Setting Up Git Configs... **********]"
echo "[*************************************************]"
git config --global user.email "$EMAIL"
git config --global user.name "$FULL_NAME"
git config --global init.defaultBranch main

echo "[*************************************************]"
echo "[************ Cloning NvChad Config... ***********]"
echo "[*************************************************]"
git clone https://github.com/AstralJohn/nvim.git ~/.config/nvim

echo "[*************************************************]"
echo "[************* Setting Up SSH Keys... ************]"
echo "[*************************************************]"
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519

clip.exe < ~/.ssh/id_ed25519.pub
cmd.exe /C start https://github.com/settings/ssh/new

rm -rf ~/wsl-ubuntu

echo "[***********************************************************************]"
echo "[************ Run :MasonInstallAll after lazy.nvim completes ***********]"
echo "[***********************************************************************]"
echo "\n"
echo "Press the enter key to launch nvim (remember to run :MasonInstallAll lazy.nvim completes!) >"
read
nvim
zsh
