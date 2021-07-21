autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%f'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '(%b|%a%c%u%m)%f'
zstyle ':vcs_info:*' formats '(%b%c%u%m)%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:git*+set-message:*' hooks untracked-git

+vi-untracked-git() {
  if command git status --porcelain 2>/dev/null | command grep -q '??'; then
    hook_com[misc]='%F{red}?%f'
  else
    hook_com[misc]=''
  fi
}

gentoo_precmd() {
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd gentoo_precmd

PROMPT='%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) %F{blue}%(!.#.$)%k%b%f '
RPROMPT=\${vcs_info_msg_0_}

ZLE_RPROMPT_INDENT=0
