/*
Node to listen to LiDAR, Camera, GPS and controller 
messages and publish signal accordingly for heartbeat
*/

#include <ros/ros.h>
#include <heartbeat/beat.h>
#include <geometry_msgs/Transform.h>

using namespace ros;

// signal publisher
Publisher pub_signal;

// subscriber for each of the sensors
Subscriber sub_gps;
Subscriber sub_lidar;
Subscriber sub_camera;
Subscriber sub_controller;

bool gps = false;
bool lidar = false;
bool camera = false;
bool controller = false;

void publisher(){
	
};

void listener_gps(){};
void listener_lidar(){};
void listener_camera(){};
void listener_controller(){};


int main(int argc, char **argv) {
	init(argc, argv, "signal");
	NodeHandle nh;
	
	// sub = nh.subscribe("/cov_ctrl_1", 10000, &listener_hbirdb);
	pub_signal = nh.advertise<heartbeat::beat>("/heartbeat", 10000);
	Rate rate(60);
	
	// while the node is not killed
	while (ok()){
		heartbeat::beat msg;
		msg.beat = 8;
		// publish message
		pub_signal.publish(msg);

		ROS_INFO_STREAM("message:"<<msg.beat);

		rate.sleep();
	}
}