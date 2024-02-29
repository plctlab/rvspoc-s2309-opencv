#!/bin/bash

MODULE=$1

core_list=opencv_perf_${MODULE}_list.txt
core_names=opencv_perf_${MODULE}_names.txt
xmllint --xpath '/testsuites/testsuite/@name' opencv_perf_${MODULE}_list.xml > $core_list

while read -r line
do
        IFS=\" read -r f1 f2  <<<"$line"
        echo $f2 >> $core_names
done <"$core_list"
rm $core_list
