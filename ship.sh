#!/bin/sh 
##
# author: Eduardo Hayashi
# https://github.com/eduardohayashi/hack-sink-ship
##

getHelper()
{
   echo SHIP to \[BRANCH\] from current branch.
   echo Syntax: ship \[target branch\]
}

CURRENT=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)


if [ -z $1 ]; then
    echo 'ERROR: Needed target branch to ship.\n'
    getHelper
    exit
else
    BRANCH=$1
fi

echo SHIPping to branch \"$BRANCH\"

git checkout $BRANCH
git rebase ${CURRENT}
git push origin $BRANCH
git checkout ${CURRENT}
