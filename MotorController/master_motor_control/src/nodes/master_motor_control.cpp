// WAM-V Motor Control Function

// Written by: James Coller
// Last Update: September 11, 2018

// Bring in Libraries
#include <ros/ros.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <unistd.h>

// #include<motorSpeeds.h> Maybe have to include this?? Make this??

// Message Libraries
#include <std_msgs/Int16.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Bool.h>
#include <sensor_msgs/Joy.h>
#include <sensor_msgs/TimeReference.h>
#include <diagnostic_msgs/DiagnosticArray.h>

using namespace std;
using namespace ros;

// Global Variables //
Publisher pub_leftmotor;
Publisher pub_rightmotor;
Publisher pub_lightCode;

Subscriber sub_joystick;

std_msgs::Int16 left_motor_speed = 127;
std_msgs::Int16 right_motor_speed = 127;
bool activate = false;

// Taking in the joystick data
void joy_callback(const sensor_msgs::Joy &data) {
  // check if safety button is pressed in
  if(data.buttons[7]==1) // Start Button
    activate = true;

  if(data.buttons[6]==1) // back button
    activate = false;

  while(activate){
    // Read in Joystick Data
    float posL = data.axes[1]; // Left Stick up down
    float posR = data.axes[4]; // Right Stick Up down
    // Remap joystick data
    float powerL = 127 + 127 * posL;
    float powerR = 127 + 127 * posR;
    // Convert float to in
    left_motor_speed = static_cast<int>(powerL);
    right_motor_speed = static_cast<int>(powerR);
    // Publish the result
    pub_leftmotor.publish(left_motor_speed);
    pub_rightmotor.publish(right_motor_speed);

  }
  left_motor_speed = 127;
  right_motor_speed = 127;

  pub_leftmotor.publish(left_motor_speed);
  pub_rightmotor.publish(right_motor_speed);
}


int main(int argc, char *argv[]) {

  // Set up ROS node //
  init(argc, argv, "motor_control_node");
  NodeHandle nh;
  NodeHandle pnh("~");

  printf("\nMotor controller node now running\nPress Ctrl-C to interrupt\n");

  // Initialize Publishers and Topics //
  pub_leftmotor=nh.advertise<std_msgs::Int16>("/LmotorSpeed",1000);
  pub_rightmotor=nh.advertise<std_msgs::Int16>("/RmotorSpeed",1000);

  // Initialize Subscribers
  sub_joystick = nh.subscribe("/joy", 10000, &joy_callback);

  spin();


}
