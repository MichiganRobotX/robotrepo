/*
 * Translates sensor_msgs/NavSat{Fix,Status} into nav_msgs/Odometry using UTM
 */

#include <ros/ros.h>
#include <sensor_msgs/NavSatFix.h>
#include <fstream>
#define endl "\n"

using namespace ros;

std::ofstream file;

void callback(const sensor_msgs::NavSatFix &msg) {
    ROS_DEBUG_STREAM(msg.latitude<<" , "<<msg.longitude);
    file<<msg.latitude<<" , "<<msg.longitude<<endl;
}

int main (int argc, char **argv) {
    init(argc, argv, "printGPS");
    NodeHandle nh;
    file.open("GPS.txt");

    Subscriber sub = nh.subscribe("/an_device/NavSatFix",100000, &callback);

    ros::spin();
}