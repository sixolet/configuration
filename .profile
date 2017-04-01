export EDITOR=emacs

if [ `uname` == 'Darwin' ]; then
    export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/arcanist/bin:/opt/local/bin:/opt/local/sbin
    export PATH=/usr/local/Cellar/git/1.8.4.3/bin:$PATH
fi


export OLDPATH=$PATH

export PATH="$OLDPATH:$HOME/gopath/bin"

export OLDGOPATH=$GOPATH
export GOPATH="$HOME/gopath:$OLDGOPATH"


. ~/configuration/git-prompt.sh
. ~/configuration/git_completion.bash

export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWUPSTREAM="git verbose"
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\h:\W \u$(__git_ps1 " %s")\$ '

function fgrepjs { find . -name '*.js' -not -path '*.meteor*' | xargs grep $1; }
function fgrepw { find . -name '*.js' -o -name '*.html' -o -name '*.css' -o -name '*.coffee'  -not -path '*.meteor*' | xargs grep $1; }
function fgreph { find . -name '*.html'  -not -path '*.meteor*' | xargs grep $1; }

function rmtilde {  find . -name '*~' -type f | xargs rm; }
function syncmusic { rsync -a --progress --exclude Ableton ~/Music/ /Volumes/Musicshare/Naomi ;
}
