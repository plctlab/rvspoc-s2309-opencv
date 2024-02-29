#!/bin/ash


MODULE=$1


input=opencv_test_${MODULE}_names.txt
output=opencv_test_${MODULE}_results.txt
tmp_dir=testdetail
mkdir -p $tmp_dir
rm -f $tmp_dir/*
date >>  $output
export LD_LIBRARY_PATH='/root/lib/:$LD_LIBRARY_PATH'
while read -r line
do
                #把测试名称保存到文件
        echo $line >> $output
                #把每一项的测试详情保存到文件
        ./opencv_test_core  --gtest_filter="*$line*"
                #把测试是否通过的结果保存到文件
        echo $? >> $output
done <"$input"
echo "Test end @" >> $output
date >>  $output
