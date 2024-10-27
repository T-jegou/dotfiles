# Enable Powerlevel10k instant prompt. This should remain at the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else can go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the location of Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Define the theme for Oh My Zsh
ZSH_THEME="robbyrussell"

# Enable plugins (sorted alphabetically)
plugins=(
  docker
  docker-compose
  git
  git-extras
  golang
  python
  systemadmin
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load custom aliases (ensure ~/.aliases exists and contains your custom aliases)
source ~/.aliases

# Load Powerlevel10k theme for a customizable prompt (edit ~/.p10k.zsh or run `p10k configure` to customize)
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- History Settings ----
# Configure the Zsh history file and behavior
HISTFILE=$HOME/.zhistory
SAVEHIST=1000                   # Max history entries to save to file
HISTSIZE=999                    # Max history entries to keep in memory
setopt share_history            # Share history across all sessions
setopt hist_expire_dups_first   # Expire duplicate entries first
setopt hist_ignore_dups         # Ignore duplicate entries in history
setopt hist_verify              # Show command before executing it from history

# ---- Arrow Key History Search ----
# Enable history search using the up and down arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- Autocompletion Plugins ----
# Load Zsh Autocompletions (helps with command suggestions as you type)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load Zsh Syntax Highlighting (highlights command syntax for better readability)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Zoxide (a faster `cd` alternative) ----
# Initialize Zoxide for faster navigation
eval "$(zoxide init zsh)"
