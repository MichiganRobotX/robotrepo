# Installing Velodyne Drivers and Building
1) Open terminal and run ```./build.sh```
2) This will install 2 packages :- ```drivers``` and ```loam_velodyne```
3) To make these packages available add the following line to ~/.bashrc
```source <path/to/cloned/directory>/Velodyne/devel/setup.bash```
4) To visualize the Velodyne Pointcloud in RViZ, run the following command
	```roslaunch drivers HDL32_points.launch ```
   You might have to change the IP address of the velodyne based on the subnet of your velodyne. Default IP is ```192.168.1.202```
5) The LOAM package is forked from [Leonid Laboshin](https://github.com/laboshinl/loam_velodyne) and can be run as follows:
```roslaunch loam_velodyne loam_velodyne.launch```
