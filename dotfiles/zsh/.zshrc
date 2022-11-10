fpath=($fpath $XDG_CONFIG_HOME/zsh/completion)
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory sharehistory incappendhistory HIST_SAVE_NO_DUPS INTERACTIVE_COMMENTS

autoload -U compinit promptinit edit-command-line
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_option+=(globdots)
compdef -d svn

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST
[ "$(whoami)" = "root" ] && promptcolor=red || promptcolor=yellow
PROMPT="%F{$promptcolor}%! %n@%m:%9c%F{green}\${vcs_info_msg_0_}%F{none} $ "

export GPG_TTY=$(tty)

bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
zle -N edit-command-line
bindkey '^x^e' edit-command-line

export KEYTIMEOUT=1

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

[ -e /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
