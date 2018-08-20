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
// PID Parameters
#define KP 0.01
#define KD 0.01
#define KI 0.01
#define DT 0.001

// Distance to cover in straight line
#define distance 10

using namespace ros;

// Publishers and Subscribers
Publisher left_pub;
Publisher right_pub;
Subscriber gps_sub;
Subscriber joy_sub;

// Global Variables
bool activate = false;
float prev_val;
float X, Y, Z;
float origin_X, origin_Y, origin_z;

// Function Definitions
void PID() {};

void joy_callback(const sensor_msgs::Joy &msg) {
	if(msg.buttons[0]==1)
		activate = true;
}

void gps_callback(const nav_msgs::Odometry &msg) {
	X = msg.pose.pose.position.x;
	Y = msg.pose.pose.position.y;
	Z = msg.pose.pose.position.z;
	ROS_INFO_STREAM(X<<" , "<<Y<<" , "<<Z);
};

void publisher() {
	if(activate){
		std_msgs::Int16 right_msg;
		std_msgs::Int16 left_msg;
		right_msg.data = 1;
		left_msg.data = 1;
		
		right_pub.publish(right_msg);
		left_pub.publish(left_msg);

	}
};

int main(int argc, char **argv) {
	init(argc, argv, "straightLine");
	NodeHandle nh;
	
	// start subscribers
	joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
	gps_sub = nh.subscribe("/odom", 10000, &gps_callback);

	// start publishers
	left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
	right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);

	spin();
}