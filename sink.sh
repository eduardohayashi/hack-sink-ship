#!/bin/sh
##
# author: Eduardo Hayashi
# https://github.com/eduardohayashi/hack-sink-ship
##

##CONFIG
DEVELOPBRANCH=develop

CURRENT=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)

getHelper()
{
   echo SINK branch \[BRANCH\] with current.
   echo Syntax: sink \[source\]
}

if [ -z $1 ]; then
    read -p "SINK with branch (default \"$DEVELOPBRANCH\"): " PROMPT
    BRANCH=$(PROMPT:-$DEVELOPBRANCH)
else
    BRANCH=$1
fi

echo SINKing from branch \"$BRANCH\"
git checkout $BRANCH
git pull origin $BRANCH
git checkout ${CURRENT}
git rebase $BRANCH
