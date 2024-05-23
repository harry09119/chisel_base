#!/bin/sh

echo "Running SBT"

today="$(date +"%Y/%m/%d")"

package=sadves
testname=General_PE_Test

sbt testOnly $package.$testname

echo "Add"
git add . 

echo "Commit"
git commit -m $today -a

echo "Push"
git push origin master
