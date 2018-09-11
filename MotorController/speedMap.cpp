// WAM-V Motor Map Function
// This ROS node will read in the joy node to determine what the
// joystick is commending, and then it will remap the joystick to
// a number that can be interpreted by the motor controller. It will
// publish this number to another node that will be read in by the
// arduino controlling the motor.

// Written by: James Coller
// Last Updated: June 20, 2018

// Declare Libraries

#include "ros/ros.h" // Ros Libraries
#include "std_msgs/String.h" // Strings
#include "sensor_msgs/Joy.h" // Joystick

#include <sstream>

// declare global variables
float posL;
float posR;

// Set the joystick function
void joyread (const sensor_msgs::Joy& joy){
  // set the joystick values
  posL = joy.axes[1];
  posR = joy.axes[4];

  // Remap Joystick
  powerL = 127 + 127*posL;
  powerR = 127 + 127*posR;

  //powerL = map(posL, -1, 1, 0, 255); // Left Side
  //powerR = map(posR, -1, 1, 0, 255); // Right Side

  int speedL = static_cast<int>(powerL);
  int speedR = static_cast<int>(powerR);
}

int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "motorspeed");
  ros::NodeHandle nh;
  ros::Subscriber<sensor_msgs::Joy> sub("joy", &joyuse);
  ros::Publisher speed_pub = nh.advertise<std_msgs::String>("motorspeed", 1000);
  ros::Rate loop_rate(10);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  int count = 0;
  while (ros::ok())
  {
    /**
     * This is a message object. You stuff it with data, and then publish it.
     */
    std_msgs::String msg;

    std::stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());

    /**
     * The publish() function is how you send messages. The parameter
     * is the message object. The type of this object must agree with the type
     * given as a template parameter to the advertise<>() call, as was done
     * in the constructor above.
     */
    chatter_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}
