# 卓球ロボット「HARIMOTO」
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
を起動すると，赤いボールの認識nodeが起動できる．また別のterminalで

```
cd ~/ping-pong-robot
source devel/setup.bash
roslaunch sound_play soundplay_node.launch
```
を起動することで，打撃時の音声（「チョレイ」）を再生できるようになる．
```
rosrun rqt_reconfigure rqt_reconfigure
```
でHSIカラーフィルタのパラメタを一時的に調整できる．

### 1. 動かす
```
cd ~/ping-pong-robot
source devel/setup.bash
roscd HARIMOTO/scripts
emacs -nw main.l ;;emacsのshellが使いやすいので，emacsを開く．
M+x shell
source ~/ping-pong-robot/devel/setup.bash
roseus
load "main.l"
```

### 2. デバッグ画面(RVIZ)
最小限立ち上げておくべきRVizのtopic
![Screenshot from 2024-12-19 22-35-51](https://github.com/user-attachments/assets/1886739c-169e-4016-ac21-9994564df0b1)

* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* (c) 2024 Michitoshi Tsubaki
