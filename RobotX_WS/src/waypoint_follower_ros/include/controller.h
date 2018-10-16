#ifndef CONTROLLER_H
#define CONTROLLER_H

// #include <waypoint_follower.h>

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

extern void RTR();
extern void controller_init();
extern void controller_update( bool transation_activated );

#define PI 3.1415926
#define MOVE_FORWORED_ANGLE_TOLORENCE PI/6 //rad
#define ARRIVING_DISTANCE 1 // meters
#define MOVE_SPEED 0.8 // range [-1,1]
#define SPEED_RANGE 255 // range [0,255]
#define angTolerance 10 // in degrees
#define distTolerance 1 // in meters

using namespace ros;
using namespace std;

double Distance(float x1, float y1, float x2, float y2);
double deg2Rad(float deg);
double rad2Deg(float rad);

float goal_x, goal_y, goal_theta, curr_x, curr_y, curr_theta, curr_velX, curr_velY, curr_velTheta;

class PID {

private:
  float prev_error;

protected:
  float kp;
  float kd;
  float ki;
  float iMax;
  float iMin;
  float dMax;
  float dMin;
  float outputMin;
  float outputMax;
  float updateHz;

public:
    float pterm;
    float dterm;
    float iterm;


  PID(float P, float I, float D, float dT) {
    iterm = 0.0;
    dterm = 0.0;
    pterm = 0.0;
    iMax = 0.0;
    iMin = 0.0;
    dMax = 0.0;
    dMin = 0.0;
    outputMin = 0.0;
    outputMax = 0.0;
    kp = P;
    kd = D;
    ki = I;
    updateHz = dT;
  }
  void Set(float kp, float kd, float ki) { kp = kp; ki = ki; kd = kd; }

  void SetI(float max, float min) { iMax = max; iMin = min; }

  void SetD(float max, float min) { dMax = max; dMin = min; }

  void SetOut(float max, float min) { outputMax = max; outputMin = min; }

  void Reset() { pterm = 0; iterm = 0; dterm = 0; }

  float Compute(float& error, waypoint_follower_ros::PID& pid_msg) {
    pterm = kp*error;
    pid_msg.p = pterm;

    iterm = iterm + ki*error/updateHz;
    if(iterm>iMax)
      iterm = iMax;
    if(iterm<iMin)
      iterm = iMin;
    pid_msg.i = iterm;

    dterm = kd*(error - prev_error);
    if(dterm>dMax)
      dterm = dMax;
    if(dterm<dMin)
      dterm = dMin;
    pid_msg.d = dterm;

    float out = pterm + dterm + iterm;

    if(out<outputMin) {
      out = outputMin;
      Reset();
    }
    if(out>outputMax) {
      out = outputMax;
      Reset();
    }

    prev_error = error;

    return out;
  }
};

extern PID angular_pos_pid(0.1, 0.1, 0.1, 20); // 20hz
extern PID linear_pos_pid(0.1, 0.1, 0.1, 20); // 20hz
extern PID linear_vel_pid(0.1, 0.1, 0.1, 20); // 20hz

extern std_msgs::Int16 motor_input_left;
extern std_msgs::Int16 lateral_motor_input_left;
extern std_msgs::Int16 lateral_motor_input_right;
extern std_msgs::Int16 motor_input_right;

extern waypoint_follower_ros::PID angular_pid_msg;
extern waypoint_follower_ros::PID linear_pos_pid_msg;
extern waypoint_follower_ros::PID linear_vel_pid_msg;
extern waypoint_follower_ros::TuningParameters tuning_param_msg;

#endif
