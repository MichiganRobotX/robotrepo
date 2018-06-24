# install stable base drivers
sudo apt-get install ros-kinetic-velodyne*

# generate configuration file
cd src/drivers/params
rosrun velodyne_pointcloud gen_calibration.py 32db.xml

# build loam and custom driver package
cd ../../..
catkin_make

# Source from this folder
echo "source devel/setup.bash" >> ~/.bashrc
