
#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Bool.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <math.h>
#include <algorithm>
#include <iostream>
#include <string>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

#include <waypoint_follower_ros/PID.h>
#include <waypoint_follower_ros/TuningParameters.h>

#define PI 3.1415926
#define MOVE_FORWORED_ANGLE_TOLORENCE PI/6 //rad
#define ARRIVING_DISTANCE 1 // meters
#define MOVE_SPEED 0.8 // range [-1,1]
#define SPEED_RANGE 255 // range [0,255]
#define angTolerance 10 // in degrees
#define distTolerance 1 // in meters

using namespace ros;
using namespace std;


void controller_init();
void controller_update( bool transation_activated );
void RTR();

double Distance(float x1, float y1, float x2, float y2);
double deg2Rad(float deg);
double rad2Deg(float rad);

float goal_x, goal_y, goal_theta, curr_x, curr_y, curr_theta, curr_velX, curr_velY, curr_velTheta;

class PID {

public:
    float prev_error;
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
    float pterm;
    float dterm;
    float iterm;


PID::PID(float P, float I, float D, float dT) {
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

PID angular_pos_pid(0.1, 0.1, 0.1, 20); // 20hz
PID linear_pos_pid(0.1, 0.1, 0.1, 20); // 20hz
PID linear_vel_pid(0.1, 0.1, 0.1, 20); // 20hz

std_msgs::Int16 motor_input_left;
std_msgs::Int16 lateral_motor_input_left;
std_msgs::Int16 lateral_motor_input_right;
std_msgs::Int16 motor_input_right;

waypoint_follower_ros::PID angular_pid_msg;
waypoint_follower_ros::PID linear_pos_pid_msg;
waypoint_follower_ros::PID linear_vel_pid_msg;
waypoint_follower_ros::TuningParameters tuning_param_msg;

//Path
vector< vector<int> > square_waypoints(1, vector<int>());

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

// Help functions
double Distance(float x1, float y1, float x2, float y2) {
    return sqrt((x2-x1)*(x2-x1)+ (y2-y1)*(y2-y1));
}

double deg2Rad(float deg) {
    return deg*PI/180;
}

double rad2Deg(float rad) {
    return rad*180/PI;
}


//*********************************************************************************************************
//********************************************PID Controller***********************************************
//*********************************************************************************************************
void controller_init() {
  angular_pos_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  angular_pos_pid.SetI(0.6, -0.6);
  angular_pos_pid.SetD(0.8, -0.8);
  angular_pos_pid.SetOut(1, -1);

  linear_pos_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  linear_pos_pid.SetI(0.6, -0.6);
  linear_pos_pid.SetD(0.8, -0.8);
  linear_pos_pid.SetOut(1, -1);

  linear_vel_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  linear_vel_pid.SetI(0.6, -0.6);
  linear_vel_pid.SetD(0.8, -0.8);
  linear_vel_pid.SetOut(1, -1);
}

// controller update HERE
void controller_update( bool transation_activated )
{
  // Linear pid update
  float errX = Distance(curr_x, curr_y, goal_x, goal_y);
  float outX = linear_pos_pid.Compute(errX, linear_pos_pid_msg);
  tuning_param_msg.out_x = outX;

  // Linear vel pid update
  float errVel = outX - Distance(curr_velX, curr_velY, 0, 0);
  float outVel = linear_vel_pid.Compute(errVel, linear_vel_pid_msg);
  tuning_param_msg.out_v = outVel;

  // angular pid update
  float errAng = goal_theta - curr_theta;
  float outAng = angular_pos_pid.Compute(errAng, angular_pid_msg);
  tuning_param_msg.err_v = outVel;

  if(!transation_activated) outVel = 0; // forward speed = 0;

  float left_control = ((outVel - outAng) + 1)/2*SPEED_RANGE;
  float right_control = ((outVel + outAng) + 1)/2*SPEED_RANGE;

  if(left_control<0)
    left_control = 0;

  if(right_control<0)
    right_control = 0;

  if(left_control>SPEED_RANGE)
    left_control = SPEED_RANGE;

  if(right_control>SPEED_RANGE)
    right_control = SPEED_RANGE;

  motor_input_left.data = left_control; // move toward left
  motor_input_right.data = right_control; // move toward right

  left_pub.publish(motor_input_left);
  right_pub.publish(motor_input_right);
  linear_pos_pid_pub.publish(linear_pos_pid_msg);
  linear_vel_pid_pub.publish(linear_vel_pid_msg);
  angular_pid_pub.publish(angular_pid_msg);
  tuning_param_pub.publish(tuning_param_msg);
}


//*********************************************************************************************************
//********************************************Read GPS/IMU Data && Control Mode****************************
//*********************************************************************************************************

void Odometry_callback(const nav_msgs::Odometry& msg)
{
  Odom_hascome = true;

  curr_theta = msg.twist.twist.angular.z; // current yaw angle of the boat
  curr_x = msg.pose.pose.position.x;
  curr_y = msg.pose.pose.position.y;
}

void joy_callback(const sensor_msgs::Joy &msg) {
  std_msgs::Bool wamv_status;
  wamv_status.data = false;
  // open activate if button 1 pressed
  if(msg.buttons[0]==1)
    activate = true;
    wamv_status.data = true;
    autonomy_status_pub.publish(wamv_status);

  // close activate if button 2 pressed
  if(msg.buttons[1]==1)
    activate = false;
    wamv_status.data = false;
    autonomy_status_pub.publish(wamv_status);
}

void autonomy_callback(const std_msgs::Bool &msg){
  bool current_status = msg.data;
  // Need to write a failsafe here
}

//*********************************************************************************************************
//******************************************** Main *******************************************************
//*********************************************************************************************************

void process(){

  if(activate)
  {
      static int waypoint_idx = 0;
      if (arrived)
      { // if previous target position has been achieved, go to next one
        // goal_x = square_waypoints[waypoint_idx][0] + curr_x;
        // goal_y = square_waypoints[waypoint_idx][1] + curr_y;
        goal_x = square_waypoints[0][0] + curr_x;
        goal_y = square_waypoints[0][1] + curr_y;
        arrived = false;
      }
      else
      { // keep controlling the boat to move to current target position

        RTR();

        if (Distance(curr_x, curr_y, goal_x, goal_y) < distTolerance) { // less than 1 meter, arrived
          arrived = true;
          waypoint_idx++;
          // if (waypoint_idx >= square_waypoints.size()){ // achieved the end of the path
          if (waypoint_idx >= 1){ // achieved the end of the path
            activate = false;
            waypoint_idx = 0;
          }
        }
      }
  }
  else{
    arrived = true;
    target_set = false;
    ROS_INFO("PID_denied");
  }

}

int main (int argc, char** argv)
{
    // std_msgs::Int16 motor_input_left;
    // std_msgs::Int16 lateral_motor_input_left;
    // std_msgs::Int16 lateral_motor_input_right;
    // std_msgs::Int16 motor_input_right;
    //
    // waypoint_follower_ros::PID angular_pid_msg;
    // waypoint_follower_ros::PID linear_pos_pid_msg;
    // waypoint_follower_ros::PID linear_vel_pid_msg;
    // waypoint_follower_ros::TuningParameters tuning_param_msg;

  // hard code waypoints here

  // one target position
  square_waypoints[0] = {20,0};

  // square path
  // square_waypoints.push_back(std::vector<int>{5,0});
  // square_waypoints.push_back(std::vector<int>{5,5});
  // square_waypoints.push_back(std::vector<int>{0,5});
  // square_waypoints.push_back(std::vector<int>{0,0});

  // Initialize ROS
  ros::init (argc, argv, "velodyne_sub");
  ros::NodeHandle nh;

  odom_sub = nh.subscribe("/gps/odom", 100000, &Odometry_callback);
  joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
  autonomy_status_sub = nh.subscribe("/AutonomyStatus", 10000, &autonomy_callback);

  Publisher left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
  Publisher right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);
  Publisher lateral_left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed_lateral", 10000);
  Publisher lateral_right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed_lateral", 10000);
  Publisher autonomy_status_pub = nh.advertise<std_msgs::Bool>("/AutonomyStatus", 1000);

  Publisher linear_pos_pid_pub = nh.advertise<waypoint_follower_ros::PID>("/pid/lin_pos", 10000);
  Publisher linear_vel_pid_pub = nh.advertise<waypoint_follower_ros::PID>("/pid/lin_vel", 10000);
  Publisher angular_pid_pub = nh.advertise<waypoint_follower_ros::PID>("/pid/angular", 10000);
  Publisher tuning_param_pub = nh.advertise<waypoint_follower_ros::TuningParameters>("/pid/tuning_params", 10000);

  controller_init();

  ros::spinOnce();

  ros::Rate loop_rate(20);
  while(ros::ok()){
    process();
    ros::spinOnce();
    loop_rate.sleep();
  }

}


void RTR() {

  goal_theta = atan2((goal_y-curr_y),(goal_x-curr_x));

  if (abs(curr_theta - goal_theta) > deg2Rad(angTolerance)){ // if angle error is too big
    controller_update(false); // translation is false, only control angle
  }
  else {
    controller_update(true); // translation is false, only control angle
  }
}
