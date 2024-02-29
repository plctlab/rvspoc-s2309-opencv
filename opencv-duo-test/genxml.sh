#!/bin/sh

./opencv_test_calib3d         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_calib3d_list.xml
./opencv_test_core            --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_core_list.xml
./opencv_test_dnn             --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_dnn_list.xml
./opencv_test_features2d      --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_features2d_list.xml
./opencv_test_flann           --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_flann_list.xml
./opencv_test_highgui         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_highgui_list.xml
./opencv_test_imgcodecs       --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_imgcodecs_list.xml
./opencv_test_imgproc         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_imgproc_list.xml
./opencv_test_ml              --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_ml_list.xml
./opencv_test_objdetect       --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_objdetect_list.xml
./opencv_test_photo           --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_photo_list.xml
./opencv_test_stitching       --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_stitching_list.xml
./opencv_test_video           --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_video_list.xml
./opencv_test_videoio         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_videoio_list.xml

./opencv_perf_calib3d         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_calib3d_list.xml
./opencv_perf_core            --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_core_list.xml
./opencv_perf_dnn             --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_dnn_list.xml
./opencv_perf_features2d      --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_features2d_list.xml
./opencv_perf_flann           --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_flann_list.xml
./opencv_perf_highgui         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_highgui_list.xml
./opencv_perf_imgcodecs       --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_imgcodecs_list.xml
./opencv_perf_imgproc         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_imgproc_list.xml
./opencv_perf_ml              --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_ml_list.xml
./opencv_perf_objdetect       --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_objdetect_list.xml
./opencv_perf_photo           --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_photo_list.xml
./opencv_perf_stitching       --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_stitching_list.xml
./opencv_perf_video           --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_video_list.xml
./opencv_perf_videoio         --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_videoio_list.xml
