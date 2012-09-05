#!/bin/sh -x
git checkout master
git pull origin master
git checkout -b $1 master
