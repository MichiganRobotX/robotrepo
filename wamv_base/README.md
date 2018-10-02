# Installing and Building Drivers
1) Open a terminal and run ```./install```

2) This will install the following packages:
	* heartbeat - base code to communicate with judges
	* gps_common - converts NavSat data to Odometry (backup if robot_localization fails)
	* wamv_bringup - launches drivers/ simulation/ rViz
	* left_motor_control - controls the Left Motor
	* right_motor_control - controls the Right Motor
	* teleop_controller - interface between joystick and both Motors