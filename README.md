# 卓上選手型卓球ロボットTakku
本ロボットは，第43回日本ロボット学会学術講演会で口頭発表しました．
## Takku デモ動画 (画像をクリック)
<a href="[https://youtu.be/3UxYMkHx29s](https://youtu.be/3UxYMkHx29s)">
  <img src="https://github.com/user-attachments/assets/b70675b1-1f57-4339-821e-1c1f185fd801" width="1155" height="652"　>
</a>

## 卓球ロボットping-pongの動かし方
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
roslaunch ping-pong all.launch
```

### 1. 動かす
```
cd ~/ping-pong-robot
source devel/setup.bash
roscd ping-pong/scripts
emacs -nw main.l ;;emacsのshellが使いやすいので，emacsを開く．
M+x shell
source ~/ping-pong-robot/devel/setup.bash
roseus
load "main.l"
```

### 2. デバッグ画面(RVIZ)
最低限，RVizで確認しておくべきtopicたち
![Screenshot from 2025-01-13 23-11-15](https://github.com/user-attachments/assets/e7c7a252-34e4-4e2f-a804-e5e31668f6c8)

### 3. 引用 (Citation)
```
@inproceedings{TakkuHardware:Tsubaki:RSJ2025,
 author="椿 道智 and 矢野倉 伊織 and 小島 邦生 and 岡田 慧",
 jauthor="椿 道智 and 矢野倉 伊織 and 小島 邦生 and 岡田 慧",
 eauthor="Michitoshi Tsubaki and Iori Yanokura and Kunio Kojima and Kei Okada",
 yomi={つばき みちとし},
 title="前陣速攻型をモデルにした卓上選手型卓球ロボットTakkuの開発",
 jtitle="前陣速攻型をモデルにした卓上選手型卓球ロボットTakkuの開発",
 etitle="Takku: A Desktop Table Tennis Player Robot Modeled on Close-to-the-table Play Style",
 booktitle=RSJ25J,
 jbooktitle=RSJ25J,
 ebooktitle=RSJ25E,
 pages={1H5-03},
 month={September},
 year=2025,
 yeard=2025,
 jposition={},
 eposition={},
 language={Japanese},
 key={},
 abstract={},
 doi={}
}
```

### 4. ライセンス
* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* (c) 2025 Michitoshi Tsubaki
