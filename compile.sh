#!/bin/sh

echo "Running SBT"

today="$(date +"%Y/%m/%d")"
uvp_array.TMP_Test
package=uvp_array
testname=TMP_Test

sbt testOnly $package.$testname

echo "Add"
git add . 

echo "Commit"
git commit -m $today -a

echo "Push"
git push origin master
