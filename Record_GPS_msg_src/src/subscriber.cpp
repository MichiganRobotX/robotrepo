#include "ros/ros.h"
#include "std_msgs/String.h"
#include "sensor_msgs/Imu.h"
#include "sensor_msgs/NavSatFix.h"
#include "geometry_msgs/Twist.h"

#include <fstream>
#include <iomanip>
void subscriberImuCallback(const sensor_msgs::Imu::ConstPtr& msg)
{
  ROS_INFO("Imu msg: [%f],[%f],[%f],[%f]", msg->orientation.x, msg->orientation.y, msg->orientation.z, msg->orientation.w);
  std::string file_name =  "/home/damao/Documents/ROS/RobotX/output/imu.txt";
  std::ofstream outfile;
  outfile.open(file_name, std::ofstream::app);
  outfile << msg->orientation.x << " " << msg->orientation.y << " " << msg->orientation.z << " " << msg->orientation.w << std::endl;
  outfile.close();
}

void subscriberTwistCallback(const geometry_msgs::Twist::ConstPtr& msg)
{

  ROS_INFO("Twist msg: [%f] , [%f] , [%f] , [%f] , [%f] , [%f]", msg->linear.x, msg->linear.y, msg->linear.z, msg->angular.x, msg->angular.y, msg->angular.z);
  std::string file_name =  "/home/damao/Documents/ROS/RobotX/output/twist.txt";
  std::ofstream outfile;
  outfile.open(file_name, std::ofstream::app);
  outfile << msg->linear.x << " " << msg->linear.y << " " << msg->linear.z << " " << msg->angular.x << " " << msg->angular.y << " " << msg->angular.z << std::endl;
  outfile.close();
}

void subscriberNavSatFixCallback(const sensor_msgs::NavSatFix::ConstPtr& msg)
{

  ROS_INFO("NavSatFix msg: [%f] , [%f] , [%f]", msg->latitude, msg->longitude, msg->altitude);
  std::string file_name = "/home/damao/Documents/ROS/RobotX/output/navsatfix.txt";
  std::ofstream outfile;
  outfile.open(file_name, std::ofstream::app);
  outfile << std::setprecision(10) << msg->latitude << " " << msg->longitude << " " << msg->altitude << std::endl;
  outfile.close();
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "subscriber");

  ros::NodeHandle n;

  ros::Subscriber sub_Imu = n.subscribe("/an_device/Imu", 1000, subscriberImuCallback);
  ros::Subscriber sub_Twist = n.subscribe("/an_device/Twist", 1000, subscriberTwistCallback);
  ros::Subscriber sub_NavSatFix = n.subscribe("/an_device/NavSatFix", 1000, subscriberNavSatFixCallback);

  ros::spin();

  return 0;
}
