# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# PROMPT stuff
BLACK=$(tput setaf 0)
BLACK_BG=$(tput setab 0)
RED=$(tput setaf 1)
RED_BG=$(tput setab 1)
GREEN=$(tput setaf 2)
GREEN_BG=$(tput setab 2)
LIME_YELLOW=$(tput setaf 190)
LIME_YELLOW_BG=$(tput setab 190)
YELLOW=$(tput setaf 3)
YELLOW_BG=$(tput setab 3)
POWDER_BLUE=$(tput setaf 153)
POWDER_BLUE_BG=$(tput setab 153)
BLUE=$(tput setaf 4)
BLUE_BG=$(tput setab 4)
MAGENTA=$(tput setaf 5)
MAGENTA_BG=$(tput setab 5)
CYAN=$(tput setaf 6)
CYAN_BG=$(tput setab 6)
WHITE=$(tput setaf 7)
WHITE_BG=$(tput setab 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)


__git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

__gcloud_ps1() {
    CONTEXT=$(cat ~/.config/gcloud/active_config)

    if [ -n "$CONTEXT" ]; then
        echo -e "${CONTEXT}"
    fi
}

__firebase_ps1() {
    CONTEXT=$(grep \"$(pwd)\" ~/.config/configstore/firebase-tools.json | cut -d" " -f2 | cut -d"\"" -f2)

    if [ -n "$CONTEXT" ]; then
        echo "$CONTEXT"
    fi
}

__kube_ps1()
{
    # Get current context
    CONTEXT=$(cat ~/.kube/config | grep "current-context:" --color=NO | sed "s/current-context: //")

    if [ -n "$CONTEXT" ]; then
        echo -e "${BRIGHT}${WHITE}${RED_BG}${BLINK}${CONTEXT}${NORMAL}"
     fi
}

export PS1='
\[${GREEN}\]\u@\h \[${LIME_YELLOW}\]gcp:$(__gcloud_ps1) \[${CYAN}\]fb:$(__firebase_ps1) \[${POWDER_BLUE}\]git:$(__git_branch)
\[\033[01;34m\]\w\[${NORMAL}\]\$ '
