#!/bin/sh 
##
# author: Eduardo Hayashi
# https://github.com/eduardohayashi/hack-sink-ship
##

getHelper()
{
   echo HACK a new branch \[TOPIC\] from branch \[SOURCE\].
   echo Syntax: hack \[topic\] \[source\]
}

if [ $# -eq 0 ]; then
    getHelper
    exit
fi

    if [ -z $(git show-ref --hash refs/heads/$1) ]; then
        if [ -z $2 ]; then
            CURRENTB=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
            MERGEB=$(git config --get branch.$CURRENTB.merge)
            
            if [ -z $MERGEB ]; then
                echo "Needed merge default config for branch \"$CURRENTB\"".
                echo "Run \"git branch --set-upstream-to=origin/$CURRENTB $CURRENTB\" or define another branch in .git/config"
                exit
            else
                SOURCE=$MERGEB
            fi
        elif [ -z $(git show-ref --hash refs/heads/$2) ]; then
            echo "ERROR: Nonexistent source branch \"$2\"\n"
            getHelper
            exit
        else
            SOURCE=$2
        fi
        TOPIC=$1
    else
        echo "ERROR: Topic branch \"$1\" exists. \n"
        getHelper
        exit
    fi

    echo HACKing from branch \"$SOURCE\" to a new branch called \"$TOPIC\"

    git checkout $SOURCE
    git pull origin $SOURCE
    git checkout -b $TOPIC $SOURCE

fi