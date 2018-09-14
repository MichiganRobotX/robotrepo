#!/usr/bin/env python

# WAM-V Motor Control Function

# Written by: James Coller
# Last Update: September 11, 2018

# Bring in Libraries
import rospy
from std_msgs.msg import Int16
from std_msgs.msg import Float32
from std_msgs.msg import Bool
from sensor_msgs.msg import Joy

def checkController(data)
    # Read in the joystick axes
    if data.buttons[4]
        # run the straight line autonomy
    if data.self


def callback(data):
    # Read in the joystick data
    posL = data.axes[1]
    posR = data.axes[4]
    # Remap the joystick
    powerL = 127 + 127 * posL
    powerR = 127 + 127 * posR
    # convert float to int
    speedL = int(powerL)
    speedR = int(powerR)
    # Publish the result
    pub1.publish(speedL)
    #pub2.publish(speedR)

# Define the Subsriber/Publishers
def communication():
    # Motor Speed Nodes
    rospy.init_node('LmotorSpeed', anonymous=True)
    rospy.init_node('RmotorSpeed', anonymous=True)

    # Publishers of the Motor Speeds
    global pub1
    global pub2
    pub1 = rospy.Publisher('LmotorSpeed', Int16, queue_size=10)
    pub2 = rospy.Publisher('RmotorSpeed', Int16, queue_size=10)

    # Subscribe to the Joystick Inputs
    rospy.Subscriber("joy", Joy, callback)

    rospy.spin()

# Main function
if __name__ == '__main__':

    try:
        communication()
        motorCalc()
    except rospy.ROSInterruptException:
        pass
