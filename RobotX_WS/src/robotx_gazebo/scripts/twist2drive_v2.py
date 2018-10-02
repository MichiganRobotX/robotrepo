#!/usr/bin/env python
# license removed for brevity

import rospy
from geometry_msgs.msg import Twist
from robotx_gazebo.msg import UsvDrive
from nav_msgs.msg import Odometry

class Node():
    def __init__(self):
        self.pub = None
        self.driveMsg =None
        self.last_right = 0
        self.last_left = 0
        self.lin_kp = 0.05
        self.ang_kp = 0.1
        self.lin_vel = 0
        self.ang_vel = 0

    def callback(self,data):
        rospy.logdebug("RX: Twist "+rospy.get_caller_id())
        rospy.logdebug("\tlinear:")
        rospy.logdebug("\t\tx:%f,y:%f,z:%f"%(data.linear.x,
                                            data.linear.y,
                                            data.linear.z))
        rospy.logdebug("\tangular:")
        rospy.logdebug("\t\tx:%f,y:%f,z:%f"%(data.angular.x,
                                            data.angular.y,
                                            data.angular.z))
        
        #self.driveMsg.left = data.linear.x
        #self.driveMsg.right = data.linear.x

        #self.driveMsg.left-=data.angular.z
        #self.driveMsg.right+=data.angular.z

        delta_lin_vel =data.linear.x - self.lin_vel
        delta_ang_vel = data.angular.z -self.ang_vel

        self.driveMsg.right = self.last_right + self.lin_kp * delta_lin_vel + delta_ang_vel * self.ang_kp
        self.driveMsg.left = self.last_left + self.lin_kp * delta_lin_vel - delta_ang_vel * self.ang_kp


        self.last_right = self.driveMsg.right
        self.last_left = self.driveMsg.left
        

        rospy.logdebug("TX: Drive ")
        rospy.logdebug("\tleft:%f, right:%f"%(self.driveMsg.left,
                                             self.driveMsg.right))
        #print("left: %f, right: %f"%(self.driveMsg.left,self.driveMsg.right))
        self.pub.publish(self.driveMsg)
    def callback_odom(self,data):
        twist_odom = data.twist.twist
        self.ang_vel = twist_odom.angular.z
        self.lin_vel = twist_odom.linear.x
        rospy.loginfo(str(twist_odom.linear.x)+"\t " +str(twist_odom.angular.z))


if __name__ == '__main__':

    rospy.init_node('twist2drive', anonymous=True)

    # ROS Parameters
    in_topic = rospy.get_param('~input_topic','cmd_vel')
    out_topic = rospy.get_param('~output_topic','cmd_drive')
    odom_topic = rospy.get_param('~odom_topic','odom')

    rospy.loginfo("Subscribing to <%s>, Publishing to <%s>"%(in_topic,out_topic))
    node=Node()

    # Publisher
    node.pub = rospy.Publisher(out_topic,UsvDrive,queue_size=10)
    node.driveMsg = UsvDrive()

    # Subscriber
    rospy.Subscriber(in_topic,Twist,node.callback)
    rospy.loginfo("Subscribing to <%s>"%(odom_topic))

    rospy.Subscriber("rowbot/odometry/filtered",Odometry,node.callback_odom)



    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
