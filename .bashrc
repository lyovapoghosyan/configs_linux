# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# This might be helpful for Linux newbies who previously used DOS...

test -f /etc/profile.dos && . /etc/profile.dos

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias os='cat /etc/redhat-release'
#alias sshic='ssh orw-covtest1-r7 -t "sudo su icbuild -c \"ssh godzilla -t bash\""'
#alias sshic='ssh icbuild@godzilla -t bash'
alias sshg='ssh godzilla -t bash'
alias sshw='ssh wilder -t bash'
alias sshe='ssh eiger -t bash'
alias ssh31='ssh amy-dev31 -t bash'
alias ssh19='ssh amy-bld-19 -t bash'
alias sshig='ssh icbuild@godzilla -t bash'
alias sshiw='ssh icbuild@wilder -t bash'
alias sshie='ssh icbuild@eiger -t bash'
alias sshi31='ssh icbuild@amy-dev31 -t bash'
alias sshi19='ssh icbuild@amy-bld-19 -t bash'
alias sshbg='ssh bwbuild@godzilla -t bash'
alias sshbw='ssh bwbuild@wilder -t bash'
alias sshsuu='ssh orw-covtest1-r7'
alias sshsua='ssh svr-amy-web-02'
alias sshsu3='ssh 137.202.149.97'
alias sshr='ssh -lroot -i ~/.ssh/yerevan_root_rsa '
alias sudosu='ssh -lroot -i ~/.ssh/yerevan_root_rsa $HOSTNAME -t su '

alias gs='git status'
alias gss='git status -s'
alias gd='git difftool'
alias gb='git branch'
alias cdc='cd /amy/runs/coverity/configs_home'
alias cdb='cd /amy/cal_daily/coverity/builds'
alias go='/home/cqi/toolsets/rh6/go-1.19.2/bin/go'
alias lla='ll -a'
alias lc='ls | wc -l'
alias lac='ls -a | wc -l'
alias llt='ll -rt'
alias os='cat /etc/redhat-release'
alias arc='uname -m'
alias doc='docker container'
alias detalias='source /user/icdet/bin/detalias.sh'
alias cprep='source /amy/runs/coverity/configs_home/calibre/calibre_prepare_for_build.sh'
alias mprep='source /amy/runs/coverity/configs_home/mpower/mpower_prepare_for_build.sh'
alias nprep='source /amy/runs/coverity/configs_home/nxdat/nxdat_prepare_for_build.sh'
alias fprep='source /amy/runs/coverity/configs_home/fdi/fdi_prepare_for_build.sh'
alias ldapsearchline='/opt/quest/bin/ldapsearch -E pr=65535/noprompt -z none -l none -LLL -b "dc=mgc,dc=mentorg,dc=com" -u amy-sgea -w "newMachine.1234567.2410"'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
source /home/pete/bin/env_init.sh; lserver set

export PATH=/user/gitdet/bin/:/opt/rh/gcc-toolset-10/root/usr/bin/:/usr/mgc/peteoss/bin:$PATH:/home/calrbdata/reviewboard/rbtools/bin/:/user/pete/bin/:/user/icdet/bin/
export EDITOR=vim
export TERM=xterm-256color

