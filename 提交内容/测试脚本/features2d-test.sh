#!/bin/ash
input=opencv_test_features2d_list_names.txt
output=opencv_test_features2d_results.txt
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
        ./opencv_test_features2d  --gtest_filter="*$line*" 2>&1 | tee -a $tmp_dir/"$line"_detail.txt
                #把测试是否通过的结果保存到文件
        echo $? >> $output
done <"$input"
echo "Test end @" >> $output
date >>  $output