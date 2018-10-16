#ifndef WAYPOINT_FOLLOWER_H
#define WAYPOINT_FOLLOWER_H

// #include <bits/stdc++.h>
#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/PoseWithCovariance.h>
// #include <ros/ros.h>
#include <math.h>
#include <algorithm>
#include <iostream>
#include <string>
// #include <bits/stdc++.h>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

#include <std_msgs/Bool.h>

// #include "sensor_msgs/Imu.h"
// #include "sensor_msgs/NavSatFix.h"
// #include "geometry_msgs/Twist.h"
// #include <nav_msgs/Odometry.h>

#include <waypoint_follower_ros/PID.h>
#include <waypoint_follower_ros/TuningParameters.h>

using namespace ros;
using namespace std;

#define distTolerance 1 // in meters
#define PI 3.1415926
// Help functions
double Distance(float x1, float y1, float x2, float y2);
double deg2Rad(float deg);
double rad2Deg(float rad);
// position vector
float goal_x, goal_y, goal_theta, curr_x, curr_y, curr_theta, curr_velX, curr_velY, curr_velTheta;
extern void RTR();
extern void controller_init();

//Path
vector< vector<int> > square_waypoints();

// Global Variables
bool activate = true;
bool flag = true;

// Publishers and Subscribers
Publisher left_pub;
Publisher right_pub;
Publisher lateral_left_pub;
Publisher lateral_right_pub;
Publisher autonomy_status_pub;
Publisher angular_pid_pub;
Publisher linear_pos_pid_pub;
Publisher linear_vel_pid_pub;
Publisher tuning_param_pub;

Subscriber odom_sub;
Subscriber joy_sub;
Subscriber autonomy_status_sub;

// Flag
bool Odom_hascome = false;
bool target_set = false;
bool arrived = true;

#endif
