#!/bin/bash
# essentials
sudo apt-get update && sudo apt-get upgrade
sudo apt-get -y install emacs vim cvs subversion git-core git gitk units imagemagick ssh smartmontools nmap netcat curl wireshark traceroute ffmpeg mplayer vlc sysstat valgrind autopoint mesa-utils tcpdump tcpreplay
sudo apt-get -y install autoconf automake autotools-dev libglib2.0-dev manpages-dev manpages-posix-dev libgl1-mesa-dev gtk-doc-tools libgtk2.0-dev python-dev libusb-dev libusb-1.0-0-dev libdc1394-22-dev libdc1394-utils libfuse-dev libi2c-dev libgsl0-dev gsl-doc-info gsl-doc-pdf freeglut3-dev
sudo apt-get -y install exfat-fuse exfat-utils
sudo apt-get -y install cmake

# camera
sudo apt-get -y install coriander libjpeg8-dev libtiff-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran freenect python-freenect

# java
sudo apt-get -y install ant openjdk-8-jdk

# additional
sudo apt-get -y install cmake

# python
sudo apt-get -y install python-dev python-cairo python-pygame python-matplotlib python-numpy python-scipy python-pyaudio python-tk ipython pyqt4-dev-tools

# LCM for Camera
wget https://github.com/lcm-proj/lcm/releases/download/v1.2.1/lcm-1.2.1.zip
unzip lcm-1.2.1.zip
rm lcm-1.2.1.zip
cd lcm-1.2.1/
./configure
make
sudo make install

# openCV
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.0.0
cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..
make -j4
sudo make install
sudo ldconfig
sudo cp -r opencv/samples/data/ /usr/local/share/OpenCV/samples/

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# update and upgrade
sudo apt-get update && sudo apt-get upgrade

# install ros kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

# install catkin tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python-catkin-tools

# velodyne, LOAM and camera 1394 from source
# source for LOAM - https://github.com/laboshinl/loam_velodyne
sudo apt-get install ros-kinetic-velodyne*
mkdir -p ~/Documents/Catkin_WS/src
cd ~/Documents/Catkin_WS/src
git clone https://github.com/ros-drivers/camera1394.git
git clone https://github.com/laboshinl/loam_velodyne.git
cd ~/Documents/Catkin_WS/
catkin_make

# add worspace to path
echo "source ~/Documents/Catkin_WS/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Ubuntu Extras
sudo apt install gksu
sudo apt install tlp tlp-rdw
sudo tlp start
sudo apt install gnome-tweak-tool
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install vlc
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install simplescreenrecorder

# Configure Networks and Disable Firewall
sudo apt-get install openssh-server
sudo ufw allow ssh and sudo ufw reload
sudo service iptables restart

# update and upgrade
sudo apt update && sudo apt upgrade


# install turtlebot gazebo on Kinetic
# link - https://answers.ros.org/question/246015/installing-turtlebot-on-ros-kinetic/
sudo apt-get install -y linux-headers-generic
sudo sh -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu xenial-security main restricted" > \
  /etc/apt/sources.list.d/official-source-repositories.list'
sudo apt-get update
# sudo apt-get install -y ros-kinetic-librealsense
# sudo apt-get install -y ros-kinetic-librealsense-camera
sudo apt-get install -y ros-kinetic-turtlebot
sudo apt-get install ros-kinetic-turtlebot-gazebo
sudo apt-get install ros-kinetic-turtlebot*
sudo apt-get install ros-kinetic-ros

# update and upgrade
sudo apt update && sudo apt upgrade

# instal Google Cartographer
sudo apt-get install -y python-wstool python-rosdep ninja-build
cd ~/Documents/Catkin_WS/src
wstool init src

# Merge the cartographer_ros.rosinstall file and fetch code for dependencies.
wstool merge -t src https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall
wstool update -t src

# Install proto3
src/cartographer/scripts/install_proto3.sh

# Install deb dependencies.
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

# Build and install.
catkin_make_isolated --install --use-ninja
source install_isolated/setup.bash

# Run Demos if required
# Download the 2D backpack example bag and run demo
# wget -P ~/Downloads https://storage.googleapis.com/cartographer-public-data/bags/backpack_2d/cartographer_paper_deutsches_museum.bag
# roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/Downloads/cartographer_paper_deutsches_museum.bag

# Download the 3D backpack example bag and run demo
# wget -P ~/Downloads https://storage.googleapis.com/cartographer-public-data/bags/backpack_3d/with_intensities/b3-2016-04-05-14-14-00.bag
# roslaunch cartographer_ros demo_backpack_3d.launch bag_filename:=${HOME}/Downloads/b3-2016-04-05-14-14-00.bag
