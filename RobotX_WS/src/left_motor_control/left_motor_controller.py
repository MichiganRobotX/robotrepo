#!/usr/bin/env python

# WAM-V Motor Map Function 

# Written by: James Coller
# Last Update: July 17, 2018    

import rospy
from std_msgs.msg import Int16
from std_msgs.msg import Float32
from std_msgs.msg import Bool
from sensor_msgs.msg import Joy

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

def motorCalc():
    rospy.init_node('LmotorSpeed', anonymous=True)
    #rospy.init_node('RmotorSpeed', anonymous=True)
    
    # Publishing to motorSpeed
    global pub1
    pub1 = rospy.Publisher('LmotorSpeed', Int16, queue_size=10)
    #pub2 = rospy.Publisher('RmotorSpeed', Int16, queue_size=10)
    # Subscribed to joystick inputs on topic "joy"
    rospy.Subscriber("joy", Joy, callback)
    # starts the node
    
    rospy.spin()

if __name__ == '__main__':
    try:
        motorCalc()
    except rospy.ROSInterruptException:
        pass