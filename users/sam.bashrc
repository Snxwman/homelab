#!/usr/bin/env bash

alias c="clear"
alias ..="cd .."
alias ...="cd ../.."

alias ll="ls -l"
alias la="ls -la"

alias rcs="rc-service"
alias rcst="rc-status"
alias rcu="rc-update"

alias v="nvim"

export IP="$(curl -s 4.ident.me)"

# (10.10.10.10) [user@host : /full/path]␣
export PS1="\[\e[38;2;136;136;136m\](\[\e[0m\]\[\e[38;2;204;0;204m\]$IP\[\e[0m\]\[\e[38;2;136;136;136m\])\[\e[0m\] \[\e[38;2;136;136;136m\][\[\e[0m\]\[\e[38;2;0;255;255m\]\u\[\e[0m\]\[\e[38;2;136;136;136m\]@\[\e[0m\]\[\e[38;2;0;204;204m\]\H\[\e[0m\] \[\e[38;2;136;136;136m\]:\[\e[0m\] \[\e[38;2;0;255;0m\]\w\[\e[0m\]\[\e[38;2;136;136;136m\]]\[\e[0m\] "
