# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
  git
  yarn
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  node
  npm
  command-not-found
  fzf
  history
  aliases
)

source $ZSH/oh-my-zsh.sh

# Set preferred edito
export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ivim="nvim /home/john/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias gs="git status"
alias ls="ls -lhF --color"
alias lh="ls -lhd .??*"
