#include <ros/ros.h>
// PCL specific includes
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

sensor_msgs::PointCloud2ConstPtr cloud_msg;
sensor_msgs::ImageConstPtr image_msg;

bool image_has_come = false;

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

cv::Mat project(cv::Mat projection_matrix, cv::Rect frame, pcl::PointCloud<pcl::PointXYZ> point_cloud, pcl::PointCloud<pcl::PointXYZ> *visible_points)
{
  cv::Mat plane = cv::Mat::zeros(frame.size(), CV_32FC1);

  for (pcl::PointCloud<pcl::PointXYZ>::iterator pt = point_cloud.points.begin(); pt < point_cloud.points.end(); pt++)
  {
    // ignore the points behind the camera
    if (pt->z < 0) continue;
    // use range as intensity
    float intensity = 1/sqrt(pt->z*pt->z + pt->x*pt->x + pt->y*pt->y);
    cv::Point xy = project(*pt, projection_matrix);
    if (xy.inside(frame))
    {
      if (visible_points != NULL) visible_points->push_back(*pt);
      plane.at<float>(xy) = intensity;
    }
  }

  cv::Mat plane_gray;
  // normalize the 2D point map to fit the 8 bit color
  cv::normalize(plane, plane_gray, 0, 255, cv::NORM_MINMAX, CV_8UC1);
  cv::dilate(plane_gray, plane_gray, cv::Mat());

  return plane_gray;
}

// callback function for camera lidar fusion
void c_l_fusion(const sensor_msgs::PointCloud2ConstPtr& cloud_msg){

    if (image_has_come == false) return;
    
    pcl::PointCloud<pcl::PointXYZ> cloud;
    pcl::fromROSMsg(*cloud_msg, cloud);
    // rotate pointcloud to camera frame first
    Eigen::Affine3f transf = pcl::getTransformation(0, 0, 0, 1.57, 1.2, 0);
    pcl::transformPointCloud(cloud, cloud, transf);
    
    // apply rigid body transformaton to the point cloud, the matrix is derived from camera lidar calilbration
    Eigen::Matrix4f rigid_body_mat;
    rigid_body_mat <<       0.997284,    0.0426874,    0.0600174,     0.382416,
                          -0.0426606,     0.999088,   -0.0017276,     0.383763,
                          -0.0600364, -0.000837472,     0.998196,     0.102934,
                                    0,           0,           0,           1;

    Eigen::Matrix4f rotate_Cclockwise_90;

    rotate_Cclockwise_90 <<   0, 1, 0, 0,
                              -1, 0, 0, 0,
                              0, 0, 1, 0,
                              0, 0, 0, 1;

    pcl::transformPointCloud(cloud, cloud, rigid_body_mat);
    pcl::transformPointCloud(cloud, cloud, rotate_Cclockwise_90);

    // project the 3D point cloud to the camera plane, use the camera projection matrix
    cv::Rect frame(0, 0, 1616, 1232);
    float p[12] = {
                  588.872437, 0.000000, 800.184959, 0.000000,
                  0.000000, 617.975037, 626.189575, 0.000000,
                  0.000000, 0.000000, 1.000000, 0.000000};
    cv::Mat P;
    cv::Mat(3, 4, CV_32FC1, &p).copyTo(P);
    std::cout << "PPPPPPPP" << P << std::endl;
    cv::Mat projected_cloud = project(P, frame, cloud, NULL);
    cv::Mat rgb_projected_cloud;
    //change the projected 2D points into green color
    cv::Mat rgb_projected_cloud_channels[] = {cv::Mat::zeros(projected_cloud.size(), CV_8UC1), projected_cloud, cv::Mat::zeros(projected_cloud.size(), CV_8UC1)};
    cv::merge(rgb_projected_cloud_channels, 3, rgb_projected_cloud);

    // read image from camera
    cv_bridge::CvImagePtr cv_ptr;
    cv_ptr = cv_bridge::toCvCopy(image_msg, "bgr8");
    
    // cv::rotate(cv_ptr->image, cv_ptr->image, 0);

    cv::Mat img = cv_ptr->image;

    // fuse the image and 2D point cloud
    cv::Mat fused_image;
    cv::addWeighted(img, 0.3, rgb_projected_cloud, 0.7, 0.0, fused_image);

    // define camera matrix and distortion vector, derived from camera calibration
    float cm[9] = {751.445559, 0.000000, 800.682045,
                    0.000000, 751.358999, 624.699329,
                    0.000000, 0.000000, 1.000000};
    cv::Mat cam_mat;

    cv::Mat(3, 3, CV_32FC1, &cm).copyTo(cam_mat);
    float d[5] = {-0.233806, 0.055245, -0.000699, -0.000246, 0.000000};
    cv::Mat distortion;
    cv::Mat(1, 5, CV_32FC1, &d).copyTo(distortion);
    cv::Mat undistort_img;
    // undistort the result
    cv::undistort(fused_image, undistort_img, cam_mat, distortion);
 

    cv::rotate(undistort_img, undistort_img, 0);
    cv::namedWindow("window", 4000);
    cv::imshow("window", undistort_img);
    cv::waitKey(3); 

    image_has_come = false;
};

void image_read(const sensor_msgs::ImageConstPtr& image_msg_)
{
  image_has_come = true;
  image_msg = image_msg_;
}

int
main (int argc, char** argv)
{
  // Initialize ROS
  ros::init (argc, argv, "velodyne_sub");
  ros::NodeHandle nh;
  // Create a ROS subscriber for the input point cloud
  // message_filters::Subscriber<sensor_msgs::PointCloud2> cloud_sub(nh, "/vel1/velodyne_points", 1000);
  // message_filters::Subscriber<sensor_msgs::Image> image_sub(nh, "/ladybug_camera/camera4/image_raw", 1000);

  ros::Subscriber cloud_sub = nh.subscribe("vel1/velodyne_points", 1000, &c_l_fusion);
  ros::Subscriber image_sub = nh.subscribe("/image_view_1538318517517754588/output", 1000, &image_read);
  
  // synchronize the point cloud and image
  // typedef message_filters::sync_policies::ApproximateTime<sensor_msgs::PointCloud2, sensor_msgs::Image> MySyncPolicy;
  // message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), cloud_sub, image_sub);
  // sync.registerCallback(boost::bind(&c_l_fusion, _1, _2));

  ros::spin();
  // Spin
}
