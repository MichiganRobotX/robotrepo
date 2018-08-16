#!/bin/bash
# update
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

# install ROS Kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

# essentials
sudo apt-get -y install cmake exfat-fuse exfat-utils autoconf automake autotools-dev libglib2.0-dev manpages-dev manpages-posix-dev libgl1-mesa-dev gtk-doc-tools libgtk2.0-dev python-dev libusb-dev libusb-1.0-0-dev libdc1394-22-dev libdc1394-utils libfuse-dev libi2c-dev libgsl0-dev gsl-doc-info gsl-doc-pdf freeglut3-dev emacs vim cvs subversion git-core git gitk units imagemagick ssh smartmontools nmap netcat curl wireshark traceroute ffmpeg mplayer vlc sysstat valgrind autopoint mesa-utils tcpdump tcpreplay ros-kinetic-rviz gazebo7 gazebo7-common ros-kinetic-gazebo-ros-pkgs libgazebo7-dev python-pyqtgraph doxygen zlib1g-dev libjson0-dev libusb-1.0-0-dev libluajit-5.1-2 libjsoncpp1 libprotoc9v5 libgoogle-glog0v5 libtinyxml2.6.2v5 libyaml-cpp0.5v5 libace-6.3.3 libqt4-qt3support libqt4-xml libamd2.4.1 libcamd2.4.1 libbtf1.2.1 libcolamd2.9.1 libccolamd2.9.1 libcholmod3.0.6 libcsparse3.1.4 libcxsparse3.1.4 libklu1.3.3 libblas3 liblapack3 libatlas3-base libv4l-0 libv4lconvert0 libv4l2rds0 libgl1-mesa-glx libgmp10 libusb-1.0-0 libtinyxml2.6.2v5 libpcl-common1.7 libboost-program-options1.58.0 libboost-signals1.58.0 libboost-system1.58.0 libboost-chrono1.58.0 libboost-thread1.58.0 libboost-filesystem1.58.0 ros-kinetic-ros-base ros-kinetic-cpp-common ros-kinetic-rosbag ros-kinetic-common-msgs ros-kinetic-nodelet ros-kinetic-pluginlib ros-kinetic-actionlib ros-kinetic-image-transport ros-kinetic-compressed-image-transport ros-kinetic-tf2 ros-kinetic-tf2-eigen ros-kinetic-tf2-geometry-msgs ros-kinetic-tf2-kdl ros-kinetic-tf2-msgs ros-kinetic-tf2-ros ros-kinetic-tf2-sensor-msgs ros-kinetic-message-filters ros-kinetic-robot-state-publisher ros-kinetic-rosconsole ros-kinetic-roscpp ros-kinetic-rosgraph ros-kinetic-rosgraph-msgs ros-kinetic-roslaunch ros-kinetic-rosmaster ros-kinetic-rosmsg ros-kinetic-rosnode ros-kinetic-rosout ros-kinetic-rosparam ros-kinetic-rosservice ros-kinetic-rostopic ros-kinetic-roswtf ros-kinetic-std-srvs ros-kinetic-topic-tools ros-kinetic-xmlrpcpp ros-kinetic-opencv3 ros-kinetic-mavlink ros-kinetic-xacro ros-kinetic-octomap libalvar2 libdbow21 libopenmvg1 libroyale1 libceres1 rti libmiro0 libsoracore1 libdecomputil0 libjps3d0 build-essential cmake libgoogle-glog-dev libgtest-dev libgflags-dev libace-dev libqt4-dev protobuf-compiler libv4l-dev libeigen3-dev libluajit-5.1-dev libjsoncpp-dev libtinyxml-dev libyaml-cpp-dev libusb-1.0-0-dev libpcl-dev libboost-program-options-dev libboost-signals-dev libboost-system-dev libboost-chrono-dev libboost-thread-dev libboost-filesystem-dev libsuitesparse-dev libatlas-dev libalvar-dev libdbow2-dev libopenmvg-dev libroyale-dev libceres-dev rti-dev libsoracore-dev libmiro-dev libdecomputil-dev libjps3d-dev gnuplot doxygen-latex lyx 

# camera
sudo apt-get -y install coriander libjpeg8-dev libtiff-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran freenect python-freenect

# java
sudo apt-get -y install ant openjdk-8-jdk

# python
sudo apt-get -y install python-dev python-cairo python-pygame python-matplotlib python-numpy python-scipy python-pyaudio python-tk ipython pyqt4-dev-tools

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# LCM for Camera
mkdir /tmp/LCM/
cd /tmp/LCM/
wget https://github.com/lcm-proj/lcm/releases/download/v1.2.1/lcm-1.2.1.zip
unzip lcm-1.2.1.zip
rm lcm-1.2.1.zip
cd lcm-1.2.1/
./configure
make
sudo make install

# openCV
mkdir /tmp/openCV/
cd /tmp/openCV/
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

# install catkin tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python-catkin-tools

# Ubuntu Extras
sudo apt-get -y install gksu tlp tlp-rdw gnome-tweak-tool ubuntu-restricted-extras terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
sudo tlp start

# Simple Screen Recorder
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install simplescreenrecorder

# Configure Networks and Disable Firewall
sudo apt-get install openssh-server
sudo ufw allow ssh and sudo ufw reload
sudo service iptables restart

# install turtlebot gazebo on Kinetic
# link - https://answers.ros.org/question/246015/installing-turtlebot-on-ros-kinetic/
sudo apt-get install -y linux-headers-generic
sudo sh -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu xenial-security main restricted" > \
  /etc/apt/sources.list.d/official-source-repositories.list'
sudo apt-get update
sudo apt-get install -y ros-kinetic-turtlebot
sudo apt-get install ros-kinetic-turtlebot-gazebo
sudo apt-get install ros-kinetic-turtlebot*
sudo apt-get install ros-kinetic-ros*

# localization nodes 
sudo apt-get install ros-kinetic-roslint
sudo apt-get install ros-kinetic-robot-localization
sudo apt-get install ros-kinetic-robot-*

# install arduino
wget -O /tmp/arduino-nightly.tar.xz https://www.arduino.cc/download.php?f=/arduino-nightly-linux64.tar.xz
cd /tmp/
tar -xf arduino-nightly.tar.xz 
cd arduino-nightly/
./install.sh

# Install rosserial
sudo apt-get install ros-kinetic-rosserial-*
sudo apt-get install ros-kinetic-rosserial-arduino


# update and upgrade
sudo apt update && sudo apt upgrade