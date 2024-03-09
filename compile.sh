#!/bin/sh

echo "Running SBT"

today=$(date +"%Y/%m/%d - %H:%M:%S")

package=uvp_array
testname=TMP_Test

branch=recent

sbt testOnly $package.$testname

git add .
git commit -m today
git push origin master
