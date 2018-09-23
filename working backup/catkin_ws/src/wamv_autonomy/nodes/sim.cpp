#include <ros/ros.h>
#include <gazebo_msgs/SetModelState.h>
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/ModelState.h>
#include <nav_msgs/Odometry.h>

using namespace ros;

// Publishers and Subscribers
Publisher pub;
Subscriber sub;
ServiceClient client;


void callback(const nav_msgs::Odometry &msg) {
	gazebo_msgs::ModelState state;
	state.model_name = "kingfisher";
	state.pose.position.x = msg.pose.pose.position.x;
	state.pose.position.y = msg.pose.pose.position.y;
	state.pose.position.z = msg.pose.pose.position.z;
	pub.publish(state);
}


int main(int argc, char **argv) {
	init(argc, argv, "straightLine");
	NodeHandle nh;
	
	sub = nh.subscribe("/gps/odom", 10000, &callback);
	pub = nh.advertise<gazebo_msgs::ModelState>("/gazebo/set_model_state", 10000);

	spin();
}
