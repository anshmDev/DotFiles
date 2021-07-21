if [ -z "$TMUX" ]; then
  exec tmux new-session -A -s anshm
  fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

export BROWSER=firefox
export EDITOR=vim 

autoload -U compinit && compinit
setopt autocd 
setopt promptsubst
setopt CORRECT
setopt CORRECT_ALL

# zsh History 
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Keybinds
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -e
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Useful Aliases
alias ls="ls --color=always"
alias l="ls -lh --color=always"
alias ll="ls -lh --color=always"
alias lla="ls -lAh --color=always"
alias la="ls -A --color=always"
alias g="git"
alias v="nvim"
alias vim="nvim"
alias tmux="tmux -2"

# Prompt
#PROMPT='[%n@%m %1~]%# '
#RPROMPT=\$vcs_info_msg_0_
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#zstyle ':vcs_info:git:*' formats '(%b)'

ZLE_RPROMPT_INDENT=0
#source $HOME/.zsh/themes/agnoster.zsh-theme
source /home/anshm/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
