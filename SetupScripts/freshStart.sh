#!/bin/bash

# Before running this, install arduino manually
# The apt-get option installs a very outdated version of Arduino

# essentials
sudo apt-get -y install emacs vim cvs subversion git-core git gitk units imagemagick ssh smartmontools nmap netcat curl wireshark traceroute ffmpeg mplayer vlc sysstat valgrind autopoint mesa-utils tcpdump tcpreplay
sudo apt-get -y install autoconf automake autotools-dev libglib2.0-dev manpages-dev manpages-posix-dev libgl1-mesa-dev gtk-doc-tools libgtk2.0-dev python-dev libusb-dev libusb-1.0-0-dev libdc1394-22-dev libdc1394-utils libfuse-dev libi2c-dev libgsl0-dev gsl-doc-info gsl-doc-pdf freeglut3-dev
sudo apt-get -y install exfat-fuse exfat-utils
sudo apt-get -y install cmake

# Setup Ros Kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install ros dependencies
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

# Install joy Node
sudo apt-get install ros-kinetic-joy

# Install rosserial
sudo apt-get install ros-kinetic-rosserial-arduino
sudo apt-get install ros-kinetic-rosserial

# Install terminator
sudo apt-get install terminator

# Fix rosserial setup bugs
cd Arduino/libraries
rm -rf ros_lib
# the next command needs to be redone with roscore running, not sure
# how to do that yet from a bash script 
rosrun rosserial_arduino make_libraries.py .
cd ~

# camera
sudo apt-get -y install coriander libjpeg8-dev libtiff-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran freenect python-freenect

# java
sudo apt-get -y install ant openjdk-8-jdk

# python
sudo apt-get -y install python-dev python-cairo python-pygame python-matplotlib python-numpy python-scipy python-pyaudio python-tk ipython pyqt4-dev-tools

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

# velodyne and camera 1394 from source
mkdir -p ~/Documents/RobotX_WS/src
cd ~/Documents/RobotX_WS/src
git clone https://github.com/ros-drivers/velodyne.git
git clone https://github.com/ros-drivers/camera1394.git
cd ~/Documents/RobotX_WS/
catkin_make

# update and upgrade
sudo apt-get update && sudo apt-get upgrade
