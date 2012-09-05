#!/bin/sh -x
CURRENT=`git branch | grep "*" | awk '{print $2}'`
git checkout master
git merge ${CURRENT} 
git commit -a -v
git push origin master
