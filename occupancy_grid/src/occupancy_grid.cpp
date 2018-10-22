#include <tf/transform_listener.h>
#include <costmap_2d/costmap_2d_ros.h>

int main(int argc, char** argv){
	tf::TransformListener tf(ros::Duration(10));
	costmap_2d::Costmap2DROS costmap("my_costmap", tf);
	return 0;
}
