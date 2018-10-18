/*
Node for WamV straight Line Task
*/

#include <ros/ros.h>
#include <std_msgs/Bool.h>
#include "PID.h"

#define dt 1/30
#define distance 25

using namespace ros;

// Publishers and Subscribers
Publisher left_pub;
Publisher right_pub;
Subscriber odom_sub;
Subscriber joy_sub;
Subscriber autonomy_status_sub;
Publisher autonomy_status_pub;

// Global Variables
extern bool activate = false;
bool flag = true;
float X, Y, origin_X, origin_Y;

// Set the speeds for each
int backwardSpeed = 20;
int zeroSpeed = 127;
int forwardSpeed = 220;

void publisher() {
	//extern activate;
	if(activate){
		ROS_INFO_STREAM("Straight Line Activated");
		std_msgs::Int16 right_msg;
		std_msgs::Int16 left_msg;

		// Initialize PID here with parameters
		PID yaw_pid (0.1, 0.1, 0.1, dt);
		yaw_pid.PID_SetI(10, -10);
		yaw_pid.PID_SetD(10, -10);
		yaw_pid.PID_SetOut(100, -100);


		if(flag) {
			origin_X = X;
			origin_Y = Y;
			flag = false;
			ROS_WARN_STREAM("Origin: "<<origin_X<<", "<<origin_Y);
		}
		else {
			// set reference frame to X
			X -= origin_X;
			Y -= origin_Y;

			float errorY = 0 - Y;

			float outY = yaw_pid.PID_Compute(errorY);

			// Bang Bang Control. Keep on applying motor commands
			// till you reach the target distance. outY makes minor
			// adjustments to make sure the boat is straight
			right_msg.data = forwardSpeed - outY;
			left_msg.data = forwardSpeed + outY;

			// set control commands to 0 if target distance achieved
			if(X>=distance) {
				right_msg.data = zeroSpeed;
				left_msg.data = zeroSpeed;
				ROS_WARN_STREAM("Reached the Target!");
			}
		}

		right_pub.publish(right_msg);
		left_pub.publish(left_msg);
		ROS_INFO_STREAM("X: "<<X<<" | Y: "<<Y<<" | left_msg: "<<left_msg.data<<" | right_msg: "<<right_msg.data);
	}
}

void joy_callback(const sensor_msgs::Joy &msg) {
	ROS_INFO_STREAM("Joystick Callback Activated");
	//extern activate;
	std_msgs::Bool wamv_status;
	wamv_status.data = false;
	// open activate if button 1 pressed
	if(msg.buttons[0]==1)
		activate = true;
		wamv_status.data = true; 
		autonomy_status_pub.publish(wamv_status);

	// close activate if button 2 pressed
	if(msg.buttons[1]==1)
		activate = false;
		wamv_status.data = false;
		autonomy_status_pub.publish(wamv_status);
}

void gps_callback(const nav_msgs::Odometry &msg) {
	ROS_INFO_STREAM("GPS Callback Activated");
	X = msg.pose.pose.position.x;
	Y = msg.pose.pose.position.y;
	publisher();
}

void autonomy_callback(const std_msgs::Bool &msg){
	bool current_status = msg.data;
	// Need to write a failsafe here
}


int main(int argc, char **argv) {
	init(argc, argv, "straightLine");
	NodeHandle nh;

	// start subscribers
	joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
	odom_sub = nh.subscribe("/gps/odom", 10000, &gps_callback);
	autonomy_status_sub = nh.subscribe("/AutonomyStatus", 10000, &autonomy_callback);


	// start publishers
	left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
	right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);
	autonomy_status_pub = nh.advertise<std_msgs::Bool>("/AutonomyStatus", 1000);

	spin();
}
