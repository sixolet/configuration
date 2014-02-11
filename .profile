export EDITOR=emacs

export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/found_software/arcanist/bin:/opt/local/bin:/opt/local/sbin
export PATH=/usr/local/Cellar/git/1.8.4.3/bin:$PATH


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

function fgrepjs { find . -name '*.js' -not -path '*.meteor*' | xargs grep $1; }
function fgrepw { find . -name '*.js' -o -name '*.html' -o -name '*.css' -o -name '*.coffee'  -not -path '*.meteor*' | xargs grep $1; }
function fgreph { find . -name '*.html'  -not -path '*.meteor*' | xargs grep $1; }
