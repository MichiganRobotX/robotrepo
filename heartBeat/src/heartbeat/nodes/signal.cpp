/*
Node to listen to LiDAR, Camera, GPS and controller 
messages and publish signal accordingly for heartbeat
*/
#include <ros/ros.h>
#include <heartbeat/heartBeat.h>
#include <heartbeat/finalMsg.h>
#include <sensor_msgs/JointState.h>
#include <sstream>
#include <bits/stdc++.h>

using namespace std;
using namespace ros;



///////////////////////
/* Global Variables*/
///////////////////////

// signal publisher
Publisher pub_signal;
Publisher pub_message;


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

heartbeat::heartBeat msg;
heartbeat::finalMsg final;


const string msgID = "$RXHRB";
const string teamID = "AUVS9";
const int checksum = 06;

///////////////////////
/* Method Definitions*/
///////////////////////

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


///////////////////////////////
/* Message Generation Methods*/
///////////////////////////////
/*
See time documentation library here:
https://www.tutorialspoint.com/c_standard_library/c_function_localtime.htm
*/

/* 
Method to format number to 2 digits
For example, '1' will be returned as
'01' and '46' as '46' itself
*/
string formatNum(int number) {
    stringstream ss;
    ss << std::setw(2) << std::setfill('0') << number;
    return ss.str();
}

/*
Template function to convert any
datatype to string. std::to_string()
works with newer verions of C++ (11+)
*/

template <typename T>
string to_string(T val)
{
    stringstream ss;
    ss << val;
    return ss.str();
}


/*
Method to register Timestamp to msg
*/
void setTimestamp() {
    time_t now = time(0);
    struct tm tstruct;
    tstruct = *localtime(&now);
    int sec = tstruct.tm_sec; int min = tstruct.tm_min; int hr = tstruct.tm_hour;
    msg.time = formatNum(hr) + formatNum(min) + formatNum(sec);
}

/*
Method to register current date to msg
*/
void setDate() {
    time_t now = time(0);
    struct tm tstruct;
    tstruct = *localtime(&now);
    int dd = tstruct.tm_mday; int mm = tstruct.tm_mon + 1; int yy = tstruct.tm_year;
    msg.date =  formatNum(dd) + formatNum(mm) + formatNum(yy%100);
}

/*
Method to register current date to msg
*/
void setParams() {
	msg.msgID = msgID;
	msg.checksum = checksum;
	msg.teamID = teamID;
}


/*
Method to convert heartbeatmsg to finalMsg and display
*/
void displayMsg() {
	final.message = msg.msgID + ',' + msg.date + ',' + msg.time + ',' + \
		to_string(msg.lat) + ',' + msg.NS + ',' + msg.EW + ',' + msg.teamID + \
		',' + to_string(msg.sysMode) + ',' + to_string(msg.AUVStatus) + '*' + \
		formatNum(msg.checksum);

	ROS_WARN_STREAM(final.message);
}

//////////////////////////
/* Method Main Heartbeat*/
//////////////////////////

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
	pub_signal = nh.advertise<heartbeat::heartBeat>("/heartbeat", 10000);
	pub_message = nh.advertise<heartbeat::finalMsg>("/messages/heartbeat", 10000);
	
	Rate rate(2);
	
	while(ok()){
		// register timestamp and date
		setTimestamp();
		setDate();
		setParams();

		// ROS_INFO_STREAM("controller: "<<controller<<" | laptop: "<<laptop<<" | gps: "<<gps<<" | camera: "<<camera<<" | lidar: "<<lidar);
		
		// set states for the signal
		if(controller==false || laptop==false)
			msg.AUVStatus = 1;
		if(controller==true && laptop==true){
			msg.AUVStatus = 2;
			if(gps==true && lidar==true && camera==true){
				msg.AUVStatus = 3;
				// if controller button switched to autonmous set msg.AUVStatus = 4 here
			}
		}

		// produce appropriate state message
		if (msg.AUVStatus == 1)
			ROS_INFO("Controller and/or Laptop cannot be found on the network");
		else if (msg.AUVStatus == 2)
			ROS_INFO("Controller and/or Laptop found on network. Boat activated to Manual Mode.");
		else if (msg.AUVStatus == 3)
			ROS_INFO("All Sensors connected and boat operating in Manual Mode");
		else
			ROS_INFO("Boat operating in autonomous mode");	

		// publish signal
		pub_signal.publish(msg);
		pub_message.publish(final);

		// reset states
		gps = false; laptop = false; controller = false; camera = false; lidar = false;
		
		// delay
		rate.sleep();

		displayMsg();

		spinOnce();
	}
	
}