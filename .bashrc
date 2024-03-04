#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias emx='emacsclient -c'
PS1='[\u@\h \W]\$ '

export GPG_TTY=$(tty)
export _JAVA_AWT_WM_NONREPARENTING=1
export EDITOR="emacsclient -c"
mail -H
