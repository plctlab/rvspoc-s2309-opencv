# 测试指南

https://github.com/nihui/rvspoc-s2309-opencv/tree/rvspoc/opencv-duo-test

### 编译方法

```shell
# 下载编译器
wget -q https://sophon-file.sophon.cn/sophon-prod-s3/drive/23/03/07/16/host-tools.tar.gz
tar -xf host-tools.tar.gz

export RISCV_ROOT_PATH=`pwd`/host-tools/gcc/riscv64-linux-musl-x86_64
```

```shell
# 准备好opencv源码和cmake
mkdir build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../riscv64-unknown-linux-musl.toolchain.cmake \
    -DCMAKE_INSTALL_PREFIX=install \
    -DCMAKE_BUILD_TYPE=Release \
    `cat ../options.txt` -DBUILD_opencv_world=OFF -DOPENCV_DISABLE_FILESYSTEM_SUPPORT=OFF \
    -DWITH_OPENMP=OFF -DOPENCV_DISABLE_THREAD_SUPPORT=ON ..
make -j $(nproc)

# strip清除debug信息
$RISCV_ROOT_PATH/bin/riscv64-unknown-linux-musl-strip bin/*
```

编译完成后，所有测试程序在 build/bin 中

### milkv-duo 镜像

https://github.com/nihui/rvspoc-s2309-opencv/releases/tag/milkv

内存55M，大核频率1G，插usb默认出一个ttyACM一个msc

### 运行测试脚本

上传测试程序到duo
```shell
scp -O build/bin/* root@192.168.42.1:/root/
```

在开发板上执行 `genxml.sh` 脚本，生成xml
```shell
./opencv_test_core --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_test_core_list.xml
./opencv_perf_core --gtest_list_tests --gtest_output=xml &>/dev/null && mv test_detail.xml opencv_perf_core_list.xml

# 其他模块类似，省略
```

在电脑上执行 `downloadxml.sh` 脚本，下载xml到电脑
```shell
scp -O root@192.168.42.1:/root/opencv_test_core_list.xml           .
scp -O root@192.168.42.1:/root/opencv_perf_core_list.xml           .

# 其他模块类似，省略
```

在电脑上执行 `xml-to-txt.sh`  `xml-to-txt-perf.sh` 脚本，xml转names.txt
```shell
sh xml-to-txt.sh core
sh xml-to-txt-perf.sh core

# 其他模块类似，省略
```

上传names.txt到duo
```shell
scp -O build/bin/*_names.txt root@192.168.42.1:/root/
```

在开发板执行 `core-test.sh` 和 `core-perf.sh`，并用`time`计时
```shell
time core-test.sh core
time core-perf.sh core

# 其他模块类似，省略
```

在电脑上执行 `downloadresult.sh` 下载results.txt到电脑
```shell
scp -O root@192.168.42.1:/root/opencv_test_core_results.txt           .
scp -O root@192.168.42.1:/root/opencv_perf_core_results.txt           .

# 其他模块类似，省略
```

统计results.txt中总测试数，PASS数，相除得到通过率 `190/211 = 90.05%`
```shell
cat opencv_test_core_results.txt | grep '^[0-9]*$' | wc -l
# 211
cat opencv_test_core_results.txt | grep '^[0-9]*$' | grep ^0 | wc -l
# 190

# 其他模块类似，省略
```

统计`time`的real时间，作为运行时间
```shell
real    37m 57.37s
user    32m 42.93s
sys     0m 48.55s

# 其他模块类似，省略
```

### 总结

测试的时候有个很明显的问题

https://github.com/opencv/opencv_extra 数据没有传到duo上，导致大量test没有跑到，通过率异常的高....


|准确性模块|通过率(%)|耗时|性能模块|通过率(%)|耗时|
|---|---|---|---|---|---|
|opencv_test_calib3d|100|0m 45.81s|opencv_perf_calib3d|100|0m 4.11s|
|opencv_test_core|90.05|37m 57.37s|opencv_perf_core|73.44|33m 42.68s|
|opencv_test_dnn|100|2m 1.59s|opencv_perf_dnn|100|0m 10.12s|
|opencv_test_features2d|||opencv_perf_features2d|100|0m 3.14s|
|opencv_test_flann|100|0m 0.70s|||    |
|opencv_test_highgui|100|0m 0.68s|||    |
|opencv_test_imgcodecs|100|0m 7.09s|opencv_perf_imgcodecs|100|0m 0.92s|
|opencv_test_imgproc|100|1m 55.43s|opencv_perf_imgproc|99.15|1m 3.12s|
|opencv_test_ml|100|0m 11.20s|||    |
|opencv_test_objdetect|100|0m 35.15s|opencv_perf_objdetect|100|0m 3.65s|
|opencv_test_photo|100|0m 20.41s|opencv_perf_photo|100|0m 0.90s|
|opencv_test_stitching|100|0m 4.90s|opencv_perf_stitching|100|0m 5.50s|
|opencv_test_video|100|0m 16.93s|opencv_perf_video|100|0m 5.98s|
|opencv_test_videoio|100|0m 24.35s|opencv_perf_videoio|100|0m 1.34s|


