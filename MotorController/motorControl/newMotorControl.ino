// WAM-V Motor Controller

#include <ros.h>
#include <sensor_msgs/Joy.h>
#include <std_msgs/String.h>
#include <stdio.h>

int pinL = 9; // PWM Output port for the left side
int pinR = 10; // PWM Ouptut port for the right side
//int potpin = 1; // Analog In Location from the potentiometer

std_msgs::Int16 Lspeed;
ros::Publisher chatter("chatter", &Lspeed);

// Set the Joystick Function

void leftmotor ( const std_msgs::int16& leftSpeed){

  // Set the joystick values
  speedL = leftSpeed

  analogWrite(pinL, speedL); // tell left motor how fast

  // say what you got:
  Lspeed = speedL;
  chatter.publish( &Lspeed );
}

void rightmotor ( const std_msgs::int16& rightSpeed){

  // Set the joystick values
  speedR = rightSpeed

  analogWrite(pinR, speedR); // tell left motor how fast
}


// Setup ROS

ros::NodeHandle nh;
ros::Subscriber<std_msgs::Int16> sub1("LmotorSpeed", &leftmotor);
ros::Subscriber<std_msgs::Int16> sub2("RmotorSpeed", &rightmotor);


void setup() {
  // ROS Input
  nh.initNode();
  nh.subscribe(sub1);
  nh.subscribe(sub2);
  nh.advertise(chatter);
}

void loop() {
  double random = 125;

  nh.spinOnce();

  delay(1000);
  //nh.spinOnce();
  //delay(1);
}
