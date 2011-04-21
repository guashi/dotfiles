# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Color ---------------
# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors

# xterm color
if [ -e /usr/share/terminfo/x/xterm+256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

PATH=$PATH:$HOME/local/node/bin:
# History ----------------
# don't put duplicate lines in the history. 
export HISTCONTROL=ignoredups
export HISTFILESIZE=3000
export HISTIGNORE="ls:cd:[bf]g:exit:..:ll"
# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
shopt -s checkwinsize
set bell-style none



# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)

if [ $TERM == 'xterm-color' ]  ||  [ $TERM == 'xterm-256color' ]; then
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -h --color=auto'
	#export LS_COLORS='di=1:fi-0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# enable to load rvm script
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

############# Alias ###########

# General
alias df='df -h'
alias du='du -sh'

# Listing
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

# Interactive
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'

# screenshots
alias screenshot='import -window root ~/Desktop/`date +%Y%m%d%H%M`.png'

# System info
alias cpuu="ps -auxw --sort=%cpu"
alias pg='ps aux |grep'  #requires an argument

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'
alias v=vim

# Network
alias ping='ping -c 10'


############# Welcome Screen ############


echo -ne "${COLOR_LIGHT_GREEN} Hello, $USER. today is, "; date
echo -ne "${COLOR_LIGHT_PURPLE} System Info"; uptime ;
echo -ne "$COLOR_NC"


############## Function ###########

# netinfo - show network information for your system
netinfo ()
{
	echo "----------Network Information----------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	/sbin/ifconfig | awk /'inet addr/ {print $4}'
	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------"
}

# extract zip/gz/tar/bz2 files
extract()
{
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)   tar xjf $1  ;;
			*.tar.gz)     tar xzf $1  ;;
			*.bz2)       bunzip $1  ;;
			*.rar)        rar x $1  ;;
			*.gz)        tar xjf $1  ;;
			*.tar)        tar xf $1  ;;
			*.tgz)        tar xzf $1  ;;
			*.tbz2)      tar xjf $1  ;;
			*.zip)       unzip $1  ;;
			*.7z)        7z x $1  ;;
			*.Z)         uncompress $1  ;;
			*)            echo " '$1' connet be extracted vis extract()";; 
		esac
	else
		echo " '$1' is not a valid file"
	fi
}

PATH=$PATH:$HOME/local/node/bin:$HOME/local/doctorjs/bin:
