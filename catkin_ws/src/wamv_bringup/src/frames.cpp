/*
This node will be broadcasting the transforms for
different frames on the wamv, namely:
(i)     base_link   - the centroid of the robot
(ii)    gps         - the position of the gps wrt the base_link
(iii)   velodyne    - the position of the velodyne wrt the base_link
(iv)    camera      - the position of the camera wrt the base_link
(v)     imu         - the position of the imu wrt the base_link

*/

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>

int main(int argc, char** argv){
    ros::init(argc, argv, "wamv_tf_publisher");
    ros::NodeHandle nh;

    ros::Rate rate(100);

    tf::TransformBroadcaster br;
    tf::Transform tf_base_gps;
    tf::Transform tf_base_imu;
    tf::Transform tf_base_cam;
    tf::Transform tf_base_vel;
    tf::Transform tf_base_map;
    tf::Transform tf_gps_velo;


    while(nh.ok()){
        tf_base_map.setOrigin(tf::Vector3(0.0, 0.0, -0.5));
        tf_base_map.setRotation(tf::Quaternion(0, 0, 0, 1));

        tf_base_gps.setOrigin(tf::Vector3(2.4, 0.0, 1.8));
        tf_base_gps.setRotation(tf::Quaternion(0, 0, 0, 1));

        tf_base_imu.setOrigin(tf::Vector3(2.4, 0.0, 1.8));
        tf_base_imu.setRotation(tf::Quaternion(0, 0, 0, 1));

        tf_base_vel.setOrigin(tf::Vector3(2.4, 0.0, 1.6));
        tf_base_vel.setRotation(tf::Quaternion(0, 0, 0, 1));

        tf_base_cam.setOrigin(tf::Vector3(2.4, 0.0, 1.5));
        tf_base_cam.setRotation(tf::Quaternion(0, 0, 0, 1));

        tf_gps_velo.setOrigin(tf::Vector3(0.0, 0.0, 0.2));
        tf_gps_velo.setRotation(tf::Quaternion(0, 0, 0, 1));


        br.sendTransform(tf::StampedTransform(tf_base_map, ros::Time::now(), "base_link", "map"));
        br.sendTransform(tf::StampedTransform(tf_base_vel, ros::Time::now(), "base_link", "velodyne"));
        br.sendTransform(tf::StampedTransform(tf_base_cam, ros::Time::now(), "base_link", "camera"));
        br.sendTransform(tf::StampedTransform(tf_base_gps, ros::Time::now(), "base_link", "gps"));
        br.sendTransform(tf::StampedTransform(tf_base_imu, ros::Time::now(), "base_link", "imu"));
        br.sendTransform(tf::StampedTransform(tf_gps_velo, ros::Time::now(), "gps", "velodyne"));

        ROS_WARN("Publishing Transform Frames...");

        rate.sleep();
    }
    return 0;
}

