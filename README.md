# ping-pong-robot
機械情報工学科自主プロジェクト 2024
03240281　椿道智

## 計画
### 自主プロジェクトの進捗及び計画
自主プロジェクトの進捗及び計画は，このRepositoryのissueおよび以下のnotionによって管理されている．
https://www.notion.so/145dafda806a80a8ab18c543b17ef1e0

## 卓球ロボットHARIMOTOの動かし方
### 0. 準備
```
roscore
```
を立ち上げながら，

```
cd ~/ping-pong-robot
source devel/setup.bash
roslaunch HARIMOTO minimal.launch #サーボが動くようになる
```
別のterminalで
```
cd ~/ping-pong-robot
source devel/setup.bash
roslaunch realsense2_camera rs_rgbd.launch
```
をするとRealSenseを起動できる．また別のterminalで
```
cd ~/ping-pong-robot
source devel/setup.bash
roslaunch HARIMOTO detect_ball.launch
```
を起動すると，赤いボールが起動できる．
```
rosrun rqt_reconfigure rqt_reconfigure
```
でHSIのパラメタを調整できる．

### 1. 動かす
```
cd ~/ping-pong-robot
source devel/setup.bash
roscd HARIMOTO/scripts
emacs main.l
M+x shell
source ~/ping-pong-robot/devel/setup.bash
roseus
load "main.l"
```
### 2. デバッグ画面(RVIZ)


* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* (c) 2024 Michitoshi Tsubaki