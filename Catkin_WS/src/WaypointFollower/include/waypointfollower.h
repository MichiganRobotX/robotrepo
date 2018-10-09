#ifndef PATHFOLLOWER_H
#define PATHFOLLOWER_H


#include <bits/stdc++.h>
#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/PoseWithCovariance.h>

using namespace ros;

#define STRAIGHT_DISTANCE 30 // meters

#define PI 3.1415926
#define MOVE_FORWORED_ANGLE_TOLORENCE PI/6 //rad
#define ARRIVING_DISTANCE 1 // meters
#define MOVE_SPEED 0.333 // range [0,1]
#define SPEED_RANGE 255 // range [0,255]

class PID {

private:
  float pterm;
  float dterm;
  float iterm;

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
  float prev_error;

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

  float Compute(float error) {
    pterm = kp*error;
    dterm = kd*(error - prev_error);
    iterm = iterm + ki*error/updateHz;

    if(iterm>iMax)
      iterm = iMax;
    if(iterm<iMin)
      iterm = iMin;

    if(dterm>dMax)
      dterm = dMax;
    if(dterm<dMin)
      dterm = dMin;

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


PID turning_pid(0.1, 0.1, 0.1, 20); // 20hz
PID lateral_pid(0.1, 0.1, 0.1, 20); // 20hz

// Global Variables
bool activate = true;
bool flag = true;
float current_heading;
float target_position[2];
float current_position[2];

std_msgs::Int16 motor_input_left;
std_msgs::Int16 motor_input_right;


std_msgs::Int16 lateral_motor_input_left;
std_msgs::Int16 lateral_motor_input_right;

// Publishers and Subscribers
Publisher left_pub;
Publisher right_pub;
Publisher lateral_left_pub;
Publisher lateral_right_pub;
Publisher autonomy_status_pub;
Subscriber odom_sub;
Subscriber joy_sub;
Subscriber autonomy_status_sub;


// Flag
bool Odom_hascome = false;
bool target_set = false;

// Help functions
double Distance(float* p1, float* p2){
    return sqrt((p2[0]-p1[0])*(p2[0]-p1[0])+ (p2[1]-p1[1])*(p2[1]-p1[1]));
}

#endif