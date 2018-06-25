/*
Node to listen to LiDAR, Camera, GPS and controller 
messages and publish signal accordingly for heartbeat
*/

#include <ros/ros.h>
#include <heartbeat/beat.h>
#include <sensor_msgs/JointState.h>

using namespace ros;

// signal publisher
Publisher pub_signal;

// subscriber for each of the sensors
Subscriber sub_gps;
Subscriber sub_lidar;
Subscriber sub_camera;
Subscriber sub_controller;
Subscriber sub_laptop;

bool gps = false;
bool lidar = false;
bool camera = false;
bool controller = false;
bool laptop = false;

/* 
listeners for each message type that is published.
If message is heard on respective topic, then flag
is set to true, else after every loop, flag is set
to false. rate at which message is published is 2Hz.
*/

void listener_gps(const sensor_msgs::JointState &msg){ gps = true; }
void listener_lidar(const sensor_msgs::JointState &msg){ lidar = true; }
void listener_camera(const sensor_msgs::JointState &msg){ camera = true; }
void listener_controller(const sensor_msgs::JointState &msg){ controller = true; }
void listener_laptop(const sensor_msgs::JointState &msg){ laptop = true; }


/*
	Signals Produced:
	1. if controller and laptop not connected - halt
	2. if controller and laptop connected - manual mode
	3. if all sensors, laptop and controller connected and controller sending signals - manual mode
	4. if all sensors, laptop and controller connected and controller not sending signals - autonomous mode
*/
int main(int argc, char **argv) {
	init(argc, argv, "signal");
	NodeHandle nh;
	
	// subscribe to all topics being published
	sub_gps = nh.subscribe("/joint_states", 10000, &listener_gps);
	sub_lidar = nh.subscribe("/lidar_data", 10000, &listener_lidar);
	sub_camera = nh.subscribe("/camera_data", 10000, &listener_camera);
	sub_controller = nh.subscribe("/controller_data", 10000, &listener_controller);
	sub_laptop = nh.subscribe("/laptop_data", 10000, &listener_laptop);

	// publish signal accordingly
	pub_signal = nh.advertise<heartbeat::beat>("/heartbeat", 10000);
	
	Rate rate(2);
	
	// define message type
	heartbeat::beat msg;

	while(ok()){
		ROS_INFO_STREAM("controller: "<<controller<<" | laptop: "<<laptop<<" | gps: "<<gps<<" | camera: "<<camera<<" | lidar: "<<lidar);
		
		// set states for the signal
		if(controller==false || laptop==false)
			msg.beat = 1;
		if(controller==true && laptop==true){
			msg.beat = 2;
			if(gps==true && lidar==true && camera==true){
				msg.beat = 3;
				// if controller button switched to autonmous set msg.beat = 4 here
			}
		}

		// produce appropriate state message
		if (msg.beat == 1)
			ROS_WARN("Controller and/or Laptop cannot be found on the network");
		else if (msg.beat == 2)
			ROS_WARN("Controller and/or Laptop found on network. Boat activated to Manual Mode.");
		else if (msg.beat == 3)
			ROS_WARN("All Sensors connected and boat operating in Manual Mode");
		else
			ROS_WARN("Boat operating in autonomous mode");	

		// publish signal
		pub_signal.publish(msg);

		// reset states
		gps = false; laptop = false; controller = false; camera = false; lidar = false;
		
		// delay
		rate.sleep();

		spinOnce();	
	}
	
}