#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>

void handleFrame(const nav_msgs::Odometry &msg) {
    static tf::TransformBroadcaster br;
    tf::Transform transform;
    float qx = msg.pose.pose.position.x;
    float qy = msg.pose.pose.position.y;

    for(int i=1; i<=5; i++) {
        // world to map
        if(i==1) {
            transform.setOrigin(tf::Vector3(0, 0, 0));
            transform.setRotation(tf::Quaternion(0, 0, 0, 1));
            br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "map"));
        }
        // map to base_link
        if(i==2) {
            transform.setOrigin(tf::Vector3(qx, qy, 0.5));
            transform.setRotation(tf::Quaternion(0, 0, 0, 1));
            br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "map", "base_link"));
        }
        // base_link to gps
        if(i==3) {
            transform.setOrigin(tf::Vector3(0, 0, 0));
            transform.setRotation(tf::Quaternion(0, 0, 0, 1));
            br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "base_link", "gps"));
        }
        // velodyne to base_link
        if(i==4) {
            transform.setOrigin(tf::Vector3(2.4, 0, 1.8));
            transform.setRotation(tf::Quaternion(0, 0, 0, 1));
            br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "base_link", "velodyne"));
        }
        // base_link to odom
        if(i==5) {
            transform.setOrigin(tf::Vector3(0, 0, 0));
            transform.setRotation(tf::Quaternion(0, 0, 0, 1));
            br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "base_link", "odom"));
        }
    }
}

int main(int argc, char** argv){
    ros::init(argc, argv, "wamv_tf_publisher");
    ros::NodeHandle nh;
    ros::Subscriber odom_sub = nh.subscribe("/gps/odom", 100000, &handleFrame);
    ros::Rate rate(10);
    while(ros::ok()) {
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}

