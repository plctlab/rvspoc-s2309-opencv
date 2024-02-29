# 参赛队名：银河护卫队
# 系统镜像配置
* 修改duo-buildroot-sdk/device/milkv-duo
/genimage.cfg中的size
```
partition empty {
		partition-type-uuid = 0657fd6d-a4ab-43c4-84e5-0933c84b4f4f
		size = 1024M 
	}
```
# 运行环境配置
* 上传lib.tar并解压
```
scp -r lib.tar root@192.168.42.1:/root/
tar -xvf lib.tar
```
* 创建工具链的环境变量
```
export RISCV_ROOT_PATH=$DUO_HOME/duo-sdk
```
* 开启SWAP
```
mkswap /dev/mmcblk0p3
```
```
swapon /dev/mmcblk0p3
```
然后运行 free -h 命令来查看swap是否已经启用 (1024M)
# 测试结果

在 55MB 内存下，1024M的swap 分区条件下 OpenCV4.8.1 回归测试性能测试结果

| 测试模块 | 通过率(%) | 耗时 | 性能模块 | 性能数据 | 耗时 |
| --------- | ---------- | ---- | --------- | -------- | ---- |
| opencv_test_core | 49.81 | NA | opencv_perf_core | NA | NA |
| opencv_test_calib3d | 93.84 | NA | opencv_perf_calib3d | NA | NA |
| opencv_test_dnn | 72.94 | NA | opencv_perf_dnn | NA | NA |
| opencv_test_features2d | 68.91 | NA | opencv_perf_features2d | ... | NA |
| opencv_test_flann | 100 | NA | \ | NA | NA |
| opencv_test_highgui | 100 | NA | \ | NA | NA |
| opencv_test_imgcodecs | 59.25 | NA | opencv_perf_imgcodecs | NA | NA |
| opencv_test_imgproc | NA | NA | opencv_perf_imgproc | NA | NA |
| opencv_test_ml | 100 | NA | \ | NA | NA |
| opencv_test_objdetect | 95.74 | NA | opencv_perf_objdetect | 100 | NA |
| opencv_test_photo | 87.5 | NA | opencv_perf_photo | 100 | NA |
| opencv_test_stitching | 100 | NA | opencv_perf_stitching | 100 | 6h |
| opencv_test_video | 71.42 | NA | opencv_perf_video | NA | NA |
| opencv_test_videoio | 55.17 | NA | opencv_perf_videoio | 100 | NA |
### 以上模块都可在duo上运行，但由于性能测试需要大量时间，无法在比赛结束前获得全部的测试结果
