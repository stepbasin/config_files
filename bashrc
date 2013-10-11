# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Prompt color codes
BLUE="\[\033[0;34m\]"
BBLUE="\[\033[1;34m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
WHITE="\[\033[1;37m\]"
NOCOLOR="\[\033[0m\]"
BLACK="\[\033[30;47m\]"
RED2="\[\033[31;47m\]"
GREEN="\[\033[0;32m\]"
BGREEN="\[\033[1;32m\]"
BYELLOW="\[\033[1;33m\]"
BLUE2="\[\033[34;47m\]"
MAGENTA="\[\033[35;47m\]"
CYAN="\[\033[36;47m\]"
BCYAN="\[\033[1;36m\]"
WHITE2="\[\033[37;47m\]"
TEAL="\[\033[0;36m\]"

# User specific aliases and functions

TMOUT=0
#JAVA_HOME="/usr/java/default"

#export ADDED_CFLAGS="-fPIC"
#export ADDED_CPPFLAGS="-fPIC"

export ADDED_CFLAGS=""
export ADDED_CPPFLAGS=""

export SVN_EDITOR=emacs
export EDITOR=emacs
export JAVA_HOME="/usr/java/latest"
export ANT_HOME="/usr"

export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin
export RTI_MULTICAST_INTERFACE=lo

#export MANPATH="$MANPATH:/usr/share/man" 

export JIP="JSAF_JIP_Sprint4_v5_branch"
export DEV="JSAF_Maintenance_5.1"
export JMD="JSAF_Maintenance_5.1_Development"
export TEST="JSAF_Maintenance_5.1_Development_Test"

alias ncte="cd /usr/ncte"
alias dev="cd /usr/ncte/git_devel"
alias jm="cd /usr/ncte/git_devel/$DEV"
alias jmd="cd /usr/ncte/git_devel/$JMD"
alias jip="cd /usr/ncte/git_devel/$JIP"
alias tst="cd /usr/ncte/git_devel/$TEST"
alias dt="cd /usr/ncte/tools_repo"

alias clean="make clean"
alias clmk="make clean; gmake"
alias mcm="make clean; gmake"
alias ccmm="./configure ; gmake clean; gmake jsaf; gmake tci; cd src/JSAF; jf"

alias glade="glade-3"
alias la="ls -a"
alias lal="ls -al"

alias jb="gdb -ex run --args ./jsaf -fedex james -federation ntf -nogui"
alias jf="gdb -ex run --args ./jsaf -fedex james -federation ntf -nosim"
alias jsaf="./jsaf -fedex james -federation ntf"
alias tci="gdb -ex run --args ./tci -fedex james -federation ntf"

alias jb2="gdb -ex run --args ./jsaf -fedex TESTING -federation ntf -nogui"
alias jf2="gdb -ex run --args ./jsaf -fedex TESTING -federation ntf -nosim"
alias jsaf2="./jsaf -fedex TESTING -federation ntf"
alias tci2="gdb -ex run --args ./tci -fedex TESTING -federation ntf"

alias lshid="ls -Ad .*"
alias catbash="cat ~/.bashrc"
alias resource="source ~/.bashrc"

if [ -f ~/.git-completion.sh ] ; then
    . ~/.git-completion.sh
fi


################################################################################################
################################################################################################
################################################################################################
################################################################################################
################################################################################################
################################################################################################



function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=41
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
#        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
BLACK="\[\033[0;30m\]" 
BLUE="\[\033[0;34m\]"         


function _prompt_command() {
#    PS1="`_git_prompt`"'\u \t \[\e[1;34m\]\w \$\[\e[0m\] ' #old version
    PS1="`_git_prompt`"'[\u \t \[\033[0;34m\]\w\[\033[0;30m\]]\$\[\e[0m\] ' #good version
}

if [[ $EUID == 0 ]] ; then # you are root, set red color prompt
    PS1='\[\033[0;31m\][\u \W]# '
else
    PROMPT_COMMAND=_prompt_command
fi


