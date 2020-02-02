# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# set hist size,length,timestamp 
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%d/%m/%y %T "

# export history for all sessions
export PROMPT_COMMAND='history -a'

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

###########################################################
#                       Colors                            #
##########################################################
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

### Text Color
RED="\033[31m"
DARK_YELLOW="\033[33m"
CYAN="\e[123m"
BLUE="\033[34m"
MAGENTA="\033[35m"
ORANGE="\033[91m"
CLEAR="\033[0m"

########################################################################
#                             prompt                                   #
########################################################################
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# emoji
#export HAPMOJI=("¯\_(ツ)_/¯" "ʕᵔᴥᵔʔ" "ヽ(´ー｀)ノ" "☜(⌒▽⌒)☞" "( ͡° ͜ʖ ͡°)" "(づ￣ ³￣)づ" "◔_◔" "ԅ(≖‿≖ԅ)" "{•̃_•̃}" "(∩｀-´)⊃━☆ﾟ.*･｡ﾟ"      "(っ▀¯▀)" "ヽ( •_)ᕗ")
#export SADMOJI=("[¬º-°]¬" "(Ծ‸ Ծ)" "(҂◡_◡)" "ミ●﹏☉ミ" "(⊙_◎)" "(´･_･\`)" "(⊙.☉)7" "⊙﹏⊙" "ᕦ(ò_óˇ)ᕤ" "ε=ε=ε=┌(;*´Д\`)ﾉ" "ლ(｀ー´ლ)"    "ʕ •\`ᴥ•´ʔ" "ʕノ•ᴥ•ʔノ ︵ ┻━┻")
#
#export PS1='\n \h | \t \n |___ $(ps1_reacji_shrug) \w $ '
#
## Exit code reactions
# ps1_reacji_shrug() {
#   OLDRETVAL=$?
#   test ${OLDRETVAL} -eq 0 && \
#     echo -e "${BLUE}${HAPMOJI[$(((${RANDOM}%${#HAPMOJI[@]})))]}${CLEAR} (${OLDRETVAL})" || echo -e                                     "${RED}${SADMOJI[$(((${RANDOM}%${#SADMOJI[@]})))]}${CLEAR} (${OLDRETVAL})"
#   exit ${OLDRETVAL}
# }

 xmas ps1
if [ "$color_prompt" = yes ]; then
    PS1="\[\e[30;42m\]\@\[\e[m\] \[\e[32m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\]\[\e[37m\]:\[\e[m\]\[\e[37m\]\\$\[\e[m\]\[\e[33m\]\w\[\e[m\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

#######################################################################
#                                Aliases                              #
#######################################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Directory aliases
alias cd1='cd ../'
alias cd2='cd ../../'
alias cd3='cd ../../../'
alias cd4='cd ../../../../'
alias cd5='cd ../../../../../'
alias cd6='cd ../../../../../../'
alias moveup='mv * .[^.] .??* ..'

#######################################################
#                      Misc                           #
#######################################################

#colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


#uptime info
upinfo ()
{
echo -ne "${red}$HOSTNAME ${lightblue}uptime: ${white} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

# System Information:
clear
echo -ne "${lightblue}Today is:\t\t${white}" `date`; echo ""
echo -e "${lightblue}Kernel Information: \t${white}" `uname -smr`
echo -ne "${lightblue}";upinfo;echo ""


##############################################################
#                            Functions                       #
##############################################################
#enhanced cd
cd() 
{
  if [ -n "$1" ]; then
    builtin cd "$@" && ls
  else
    builtin cd ~ && ls
  fi
}

 # Quickly Generate Password of given length, defaults to 10 characters
 genpass() {
   test -z "$1" && LENGTH=10 || LENGTH=$1
   python -c "from random import choice; import string; print ''.join( [ choice( string.printable.split( '\"')[0] ) for x in range(     $LENGTH ) ] );"
 }

