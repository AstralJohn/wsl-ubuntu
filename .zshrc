# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Start ssh-agent if not running
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#  eval "$(ssh-agent -s)"
#fi

# Add key if not loaded
#KEY="$HOME/.ssh/id_ed25519"
#ssh-add -l | grep -q "$KEY" 2>/dev/null || ssh-add "$KEY" 2>/dev/null
