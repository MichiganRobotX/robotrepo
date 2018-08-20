/*
Node for WamV straight Line Task
*/

#include <bits/stdc++.h>
#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/PoseWithCovariance.h>

#define endl "\n"

#define dt 1/30
#define distance 10

using namespace ros;

// Publishers and Subscribers
Publisher left_pub;
Publisher right_pub;
Subscriber odom_sub;
Subscriber joy_sub;

// Global Variables
bool activate = false;
bool flag = true;
float prev_error = 0;
float X, Y, origin_X, origin_Y;
float pterm, dterm, iterm;
float iMax = 1, iMin = -1, dMax = 1, dMin = -1;

// Function Definitions
float PID(float kp, float kd, float ki, float error) {
	pterm = kp*error;
	
	iterm = iterm + ki*error;
	if(iterm>iMax)
		iterm = iMax;
	if(iterm<iMin)
		iterm = iMin;

	dterm = kd*(error - prev_error)/dt;
	if(dterm>dMax)
		dterm = dMax;
	if(dterm<dMin)
		dterm = dMin;

	return (pterm + dterm + iterm);
}

void joy_callback(const sensor_msgs::Joy &msg) {
	if(msg.buttons[0]==1)
		activate = true;
}

void gps_callback(const nav_msgs::Odometry &msg) {
	X = msg.pose.pose.position.x;
	Y = msg.pose.pose.position.y;
	ROS_INFO_STREAM("x-pos: "<<X<<" | y-pos: "<<Y);
}

void publisher() {
	if(activate){
		std_msgs::Int16 right_msg;
		std_msgs::Int16 left_msg;
		
		// 
		if(flag) {
			origin_X = X;
			origin_Y = Y;
			flag = false;
		}
		else {
			// set reference frame to X
			X = X - origin_X;
			Y = Y - origin_Y;

			float errorY = 0 - Y;
			float outY = PID(0.1, 0.1, 0.1, errorY);
			
			// Bang Bang Control. Keep on applying motor commands 
			// till you reach the target distance. outY makes minor 
			// adjustments to make sure the boat is straight
			right_msg.data = 250 - outY;
			left_msg.data = 250 + outY;

			// set control commands to 0 if target distance achieved
			if(X>=distance) {
				right_msg.data = 127;
				left_msg.data = 127; 
			}
		}
		
		right_pub.publish(right_msg);
		left_pub.publish(left_msg);
		ROS_INFO_STREAM("left_msg: "<<left_msg.data<<" | right_msg: "<<right_msg.data);
	}
}

int main(int argc, char **argv) {
	init(argc, argv, "straightLine");
	NodeHandle nh;
	
	// start subscribers
	joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
	odom_sub = nh.subscribe("/odometry/filtered", 10000, &gps_callback);

	// start publishers
	left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
	right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);

	spin();
}