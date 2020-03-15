#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="\[\e[38;5;037m\][\[\e[38;5;214m\]\u\[\e[38;5;037m\]\[\e[38;5;251m\]@\h\[\e[38;5;037m\]:\w]\$: \[\e[38;5;231m\]"

alias sshplex='ssh -fNT zeon -L 8888:localhost:32400'

startplex ()
{
	sshplex && ~/.local/bin/plex-mpv-shim &
}

streamlinkbest ()
{
	streamlink -p mpv -- "$1" best
}

