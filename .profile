export EDITOR=emacs

export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/found_software/arcanist/bin

export OLDPATH=$PATH

use(){
    if [ $1 == "local" ]; then
	export PATH=/Users/naomi/work/meteor:$OLDPATH;
    fi
    if [ $1 == "global" ]; then
	export PATH=$OLDPATH;
    fi
}

. ~/configuration/git-prompt.sh
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWUPSTREAM="git verbose"
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\h:\W \u$(__git_ps1 " %s")\$ '
