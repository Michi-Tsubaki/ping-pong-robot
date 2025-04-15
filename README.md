![Screenshot from 2025-01-13 23-08-14](https://github.com/user-attachments/assets/e43ff8e6-4381-4f09-beb6-0cadd1e39547)

## 機械情報工学科自主プロジェクト 2024

## プロジェクトの概要
本プロジェクトの概要は，2025年1月14日(火)に実施された自主プロジェクト発表会において使用したスライド資料（ https://docs.google.com/presentation/d/1YKxIMygeKvWiWLk9LIgYPbEiXgONrJlcxnOz03saNL4/edit?usp=sharing ）を参考にしてください．

## HARIMOTO デモ動画

https://github.com/user-attachments/assets/58849984-7b79-49e7-ac35-15ba77b642aa

＊顔はX.comのAIであるGROKで生成しました．特定の個人の「写真」ではありません．

## 計画
### 自主プロジェクトの進捗及び計画
自主プロジェクトの進捗及び計画は，このRepositoryのissueにより管理されている．

## 卓球ロボットHARIMOTOの動かし方
### 0. 準備
### 0.1. ワークスペースのクローン
1. ホームディレクトリ直下にワークスペースをクローンする．
Ubuntu20.04，ROS noetic環境下で，
```
cd ~
git clone https://github.com/Michi-Tsubaki/ping-pong-robot.git
cd ping-pong-robot
source /opt/ros/noetic/setup.bash
```

2. パッケージのダウンロード・インストール
```
cd ~/ping-pong-robot
source /opt/ros/noetic/setup.bash
rosdep install -riy --from-paths src
```
3. ビルド
```
cd ~/ping-pong-robot
source /opt/ros/noetic/setup.bash
catkin build
```

### 0.2. ロボットの起動
4. プログラムを起動する．
```
cd ~/ping-pong-robot
source devel/setup.bash
roslaunch HARIMOTO all.launch
```


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
最低限，RVizで確認しておくべきtopicたち
![Screenshot from 2025-01-13 23-11-15](https://github.com/user-attachments/assets/e7c7a252-34e4-4e2f-a804-e5e31668f6c8)

### 3. 受賞 (Award)
このプロジェクトは，機械情報冬学期演習「自主プロジェクト」表彰式にて，敢闘賞として表彰されました．指導してくださった先生方に感謝いたします．
![Image](https://github.com/user-attachments/assets/723c9829-8797-4f25-b332-9214db8398d4)

### 4. ライセンス
* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* (c) 2024-2025 Michitoshi Tsubaki
