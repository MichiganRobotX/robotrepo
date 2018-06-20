// WAM-V Motor Controller

#include <ros.h>
#include <sensor_msgs/Joy.h>
#include <std_msgs/String.h>
#include <stdio.h>

int pinL = 9; // PWM Output port for the left side
int pinR = 10; // PWM Ouptut port for the right side
//int potpin = 1; // Analog In Location from the potentiometer
int speed;
float powerL = 125;
float powerR = 125;
float posL;
float posR;
char buffer[50];

std_msgs::String str_msg;
ros::Publisher chatter("chatter", &str_msg);

// Set the Joystick Function

void joyuse ( const sensor_msgs::Joy& joy){

  // Set the joystick values
  posL = joy.axes[1];
  posR = joy.axes[4];

  // Remap Joystick
  powerL = 127 + 127*posL;
  powerR = 127 + 127*posR;

  //powerL = map(posL, -1, 1, 0, 255); // Left Side
  //powerR = map(posR, -1, 1, 0, 255); // Right Side

  int speedL = static_cast<int>(powerL);
  int speedR = static_cast<int>(powerR);

  analogWrite(pinL, speedL); // tell left motor how fast
  analogWrite(pinR, speedR); // tell right motor how fast

  // say what you got:
  sprintf( buffer, "The left motor speed is %f", posL);
  str_msg.data = buffer;
  chatter.publish( &str_msg );

}

// Setup ROS

ros::NodeHandle nh;
ros::Subscriber<sensor_msgs::Joy> sub("joy", &joyuse);


void setup() {
  // ROS Input
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(chatter);
}

void loop() {
  double random = 125;
  // sprintf(buffer, "the main void motor speed is %d", random);

  // Here Corina suggests asdding the while loop for Whiile (ros::ok()) and to put in a frequency, but we couldn't get that working the first time around.
  // it may be related to the rosserial

  nh.spinOnce();
  str_msg.data = buffer;
  chatter.publish( &str_msg );
  delay(1000);
  //nh.spinOnce();
  //elay(1);
}
