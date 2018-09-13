#include <ros/ros.h>
// PCL specific includes
#include <algorithm> 
#include <sensor_msgs/PointCloud2.h>
#include <cv_bridge/cv_bridge.h>
#include "opencv2/opencv.hpp"
#include <image_transport/image_transport.h>
#include <sensor_msgs/image_encodings.h>

#include <iostream>
#include <pcl/common/transforms.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <string>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

#include <detection/BoundingBoxes.h>
#include <detection/BoundingBox.h>

using namespace std;

pcl::PointCloud<pcl::PointXYZ> cloud;
ros::Publisher object_pub;
cv::Point project(const pcl::PointXYZ &pt, const cv::Mat &projection_matrix)
{
  cv::Mat pt_3D(4, 1, CV_32FC1);

  pt_3D.at<float>(0) = pt.x;
  pt_3D.at<float>(1) = pt.y;
  pt_3D.at<float>(2) = pt.z;
  pt_3D.at<float>(3) = 1.0f;
  // apply the projection matrix to every point
  cv::Mat pt_2D = projection_matrix * pt_3D;

  float w = pt_2D.at<float>(2);
  float x = pt_2D.at<float>(0) / w;
  float y = pt_2D.at<float>(1) / w;
  return cv::Point(x, y);
}

pcl::PointCloud<pcl::PointXYZ> project(cv::Mat projection_matrix, cv::Rect frame, pcl::PointCloud<pcl::PointXYZ> point_cloud, pcl::PointCloud<pcl::PointXYZ> *visible_points)
{
  cv::Mat plane = cv::Mat::zeros(frame.size(), CV_32FC1);

  pcl::PointCloud<pcl::PointXYZ> object_set;

  for (pcl::PointCloud<pcl::PointXYZ>::iterator pt = point_cloud.points.begin(); pt < point_cloud.points.end(); pt++)
  {
    // ignore the points behind the camera
    if (pt->z < 0) continue;
    // use range as intensity
    float intensity = 1/sqrt(pt->z*pt->z + pt->x*pt->x + pt->y*pt->y);
    cv::Point xy = project(*pt, projection_matrix);
    if (xy.inside(frame))
    {
      object_set.push_back(*pt);
    }
  }

  return object_set;
}

// callback function for camera lidar fusion
void c_l_fusion(const sensor_msgs::PointCloud2ConstPtr& cloud_msg){

    // ROS_INFO("BBB");
    cloud.clear();
    pcl::fromROSMsg(*cloud_msg, cloud);
};

void image_read(const sensor_msgs::ImageConstPtr& image_msg_)
{

}

void box_read(const detection::BoundingBoxesConstPtr& msg){
    ROS_INFO("ccc");
    if(msg->bounding_boxes.size()>0)
    std::cout << "box: " << msg->bounding_boxes[0].Class << std::endl;

    int box_height = msg->bounding_boxes[0].xmax - msg->bounding_boxes[0].xmin;
    int box_width = msg->bounding_boxes[0].ymax - msg->bounding_boxes[0].ymin;

    cv::Rect frame(max(static_cast<int>(msg->bounding_boxes[0].xmin - box_height/2), 0), max(static_cast<int>(msg->bounding_boxes[0].ymin - box_width/2), 0), 
                   min(static_cast<int>(msg->bounding_boxes[0].xmax + box_height/2), 1232), min(static_cast<int>(msg->bounding_boxes[0].ymax + box_width/2), 1616));

    // rotate pointcloud to camera frame first
    Eigen::Affine3f transf = pcl::getTransformation(0, 0, 0, 1.57, 1.57, 0);
    pcl::transformPointCloud(cloud, cloud, transf);
    
    // apply rigid body transformaton to the point cloud, the matrix is derived from camera lidar calilbration
    Eigen::Matrix4f rigid_body_mat;
    rigid_body_mat <<       0.90552, 0.0296195, -0.423268, 0.0926117,
                          0.0483805,  0.983847,  0.172351,  0.583823,
                           0.421536, -0.176545,   0.88946, 0.0619182,
                                  0,         0,         0,         1;


    pcl::transformPointCloud(cloud, cloud, rigid_body_mat);

    // project the 3D point cloud to the camera plane, use the camera projection matrix
    
    float p[12] = {578.650574, 0.000000, 800.306588, 0.000000, 0.000000, 614.365601, 618.266261, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000};
    cv::Mat P;
    cv::Mat(3, 4, CV_32FC1, &p).copyTo(P);
    pcl::PointCloud<pcl::PointXYZ> object_set = project(P, frame, cloud, NULL);

    pcl::transformPointCloud(object_set, object_set, rigid_body_mat.inverse());
    pcl::transformPointCloud(object_set, object_set, transf.inverse());

    sensor_msgs::PointCloud2 object_cloud;
    pcl::toROSMsg(object_set, object_cloud);
    object_cloud.header.frame_id = "velodyne";
    object_pub.publish(object_cloud);
}

int
main (int argc, char** argv)
{
  // Initialize ROS
  ros::init (argc, argv, "velodyne_sub");
  ros::NodeHandle nh;

  // ROS_INFO("FFF");

  object_pub = nh.advertise<sensor_msgs::PointCloud2>("buoy",1000);

  ros::Subscriber cloud_sub = nh.subscribe("vel1/velodyne_points", 1000, &c_l_fusion);
  ros::Subscriber image_sub = nh.subscribe("/ladybug_camera/camera4/image_raw", 1000, &image_read);
  ros::Subscriber box_sub = nh.subscribe("/darknet_ros/bounding_boxes", 1000, &box_read);

  ros::spin();
  // Spin
}
