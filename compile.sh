#!/bin/sh

echo "Running SBT"

id="harry09119"
token="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"

today="$(date +"%Y/%m/%d")"

package=uvp_array
testname=TMP_Test

branch=recent

sbt testOnly $package.$testname

echo "Add"
git add . 
echo "Commit"
git commit -m $today
