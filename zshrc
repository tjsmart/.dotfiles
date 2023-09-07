# my zshrc settings

source ~/.dotfiles/bashrc

set -o vi

# Disabled because I'm using startship instead
# # change right prompt to indicate vim binding mode
# # this chunk below comes from: http://pawelgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
# vim_ins_mode="%{$fg[yellow]%}I%{$reset_color%}"
# vim_cmd_mode="%{$fg[white]%}N%{$reset_color%}"
# vim_mode=$vim_ins_mode
#
# function zle-keymap-select {
#   vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
#   zle reset-prompt
# }
# zle -N zle-keymap-select
#
# function zle-line-finish {
#   vim_mode=$vim_ins_mode
# }
# zle -N zle-line-finish
#
# # Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# # Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# # Thanks Ron! (see comments)
# function TRAPINT() {
#   vim_mode=$vim_ins_mode
#   return $(( 128 + $1 ))
# }
#
# # RPROMPT='${vim_mode}'
# PROMPT=$'\n'${PROMPT}'${vim_mode}'"> "

# fix backspace when using vi mode
bindkey "^?" backward-delete-char

# fix backwards kill word
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word
bindkey '^R' history-incremental-search-backward
bindkey "^U" backward-kill-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# accept zsh autosuggestions
bindkey '^y' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable annoying confirmation step of '!!' and '!$'
# https://superuser.com/a/714471
unsetopt HIST_VERIFY
