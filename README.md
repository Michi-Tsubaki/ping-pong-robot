# ping-pong-robot
機械情報工学科自主プロジェクト 2024
03240281　椿道智


計画
https://www.notion.so/145dafda806a80a8ab18c543b17ef1e0

##卓球ロボットHARIMOTOの動かし方

###0. 準備
```
cd ping-pong-robot
source devel/setup.bash
roslaunch HARIMOTO minimal.launch #サーボが動くようになる
```
別terminalで
```
cd ping-pong-robot
source devel/setup.bash
roslaunch realsense2_camera rs_rgbd.launch #realsenseが動くようになる
```
###1. 動かす
```
cd ping-pong-robot
source devel/setup.bash
roscd HARIMOTO/scripts
emacs main.l
M+x shell
source ~/ping-pong-robot/devel/setup.bash
roseus
load "main.l"
```
###2. デバッグ画面(RVIZ)
