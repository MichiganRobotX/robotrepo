#include <ros/ros.h>
#include <math.h>
#include <algorithm> 
#include <iostream>
#include <string>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

#include "waypointfollower.h"
#include <std_msgs/Bool.h>

#include "sensor_msgs/Imu.h"
#include "sensor_msgs/NavSatFix.h"
#include "geometry_msgs/Twist.h"
#include <nav_msgs/Odometry.h>



using namespace std;

//*********************************************************************************************************
//********************************************Read GPS/IMU Data && Control Mode****************************
//*********************************************************************************************************

void Odometry_callback(const nav_msgs::Odometry& msg)
{
  Odom_hascome = true;

  current_heading = msg.twist.twist.angular.z; // current yaw angle of the boat
  current_position[1] = msg.pose.pose.position.x;
  current_position[2] = msg.pose.pose.position.y;

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
//********************************************PID Controller***********************************************
//*********************************************************************************************************
void PID_Init() {

  turning_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  turning_pid.SetI(0.6, 0.6);
  turning_pid.SetD(0.8, 0.8);
  turning_pid.SetOut(1, 1);
  
  lateral_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  lateral_pid.SetI(0.6, 0.6);
  lateral_pid.SetD(0.8, 0.8);
  lateral_pid.SetOut(1, 1);
  


}


// controller update HERE
void controller_update(){

  if( !target_set && activate ){ //initialize target_position
    target_position[0] = STRAIGHT_DISTANCE*cos(current_heading);
    target_position[1] = STRAIGHT_DISTANCE*sin(current_heading);
    target_set = true;
  }



  // Turning update
  float target_heading = atan2( target_position[1]-current_position[1] , target_position[0]-current_position[0] );

  float turning_error = target_heading - current_heading;

  float turning_pidOutput = turning_pid.Compute(turning_error);

  float distance_error =  Distance(target_position, current_position);

  // Position update
  float lateral_error = distance_error*sin(target_heading - current_heading);

  float lateral_pidOutput = lateral_pid.Compute(lateral_error);

  lateral_motor_input_left.data = - lateral_pidOutput; // move toward right
  lateral_motor_input_right.data = lateral_pidOutput; // move toward left

  // Now we only use Turning update for control until two lateral thrusters are assembled

  float forwardSpeed = MOVE_SPEED;

  if(turning_error > MOVE_FORWORED_ANGLE_TOLORENCE){ // first turning heading to get a small turning error then move
      forwardSpeed = 0;
  }

  motor_input_left.data = (int)( (forwardSpeed + turning_pidOutput)*SPEED_RANGE );
  motor_input_right.data = (int)( (forwardSpeed - turning_pidOutput)*SPEED_RANGE );

  if(distance_error < ARRIVING_DISTANCE){
    motor_input_left.data = 0;
    motor_input_right.data = 0;
  }

  left_pub.publish(motor_input_left);
  right_pub.publish(motor_input_right);
}

//*********************************************************************************************************
//******************************************** Main *******************************************************
//*********************************************************************************************************

void process(){

  if(activate){
    controller_update();
  }
  else{
    target_set = false;
    ROS_INFO("PID_denied");
  }

}



int main (int argc, char** argv)
{
  // Initialize ROS
  ros::init (argc, argv, "velodyne_sub");
  ros::NodeHandle nh;

  odom_sub = nh.subscribe("/gps/odom", 100000, &Odometry_callback);
  joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
  autonomy_status_sub = nh.subscribe("/AutonomyStatus", 10000, &autonomy_callback);


  left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
  right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);
  lateral_left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed_lateral", 10000);
  lateral_right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed_lateral", 10000);
  autonomy_status_pub = nh.advertise<std_msgs::Bool>("/AutonomyStatus", 1000);

  PID_Init();

  ros::spinOnce();

  ros::Rate loop_rate(20);
  while(ros::ok()){
    process();
    ros::spinOnce();
    loop_rate.sleep();
  }

}