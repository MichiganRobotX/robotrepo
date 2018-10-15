#include "waypointfollower.h"

//*********************************************************************************************************
//********************************************Read GPS/IMU Data && Control Mode****************************
//*********************************************************************************************************

void Odometry_callback(const nav_msgs::Odometry& msg)
{
  Odom_hascome = true;

  curr_theta = msg.twist.twist.angular.z; // current yaw angle of the boat
  curr_x = msg.pose.pose.position.x;
  curr_y = msg.pose.pose.position.y;

}

void joy_callback(const sensor_msgs::Joy &msg) {
  std_msgs::Bool wamv_status;
  wamv_status.data = false;
  // open activate if button 1 pressed
  if(msg.buttons[0]==1)
    activate = true;
    wamv_status.data = true; 
    autonomy_status_pub.publish(wamv_status);

  // close activate if button 2 pressed
  if(msg.buttons[1]==1)
    activate = false;
    wamv_status.data = false;
    autonomy_status_pub.publish(wamv_status);
}

void autonomy_callback(const std_msgs::Bool &msg){
  bool current_status = msg.data;
  // Need to write a failsafe here
}

//*********************************************************************************************************
//******************************************** Main *******************************************************
//*********************************************************************************************************

void process(){

  if(activate){
      static int waypoint_idx = 0;
      if (arrived){ // if previous target position has been achieved, go to next one
        goal_x = square_waypoints[waypoint_idx][0] + curr_x;
        goal_y = square_waypoints[waypoint_idx][1] + curr_y;
        arrived = false;
      }
      else{ // keep controlling the boat to move to current target position
        
        RTR();

        if (Distance(curr_x, curr_y, goal_x, goal_y) < distTolerance) { // less than 1 meter, arrived
          arrived = true;
          waypoint_idx++;
          if (waypoint_idx >= square_waypoints.size()){ // achieved the end of the path
            activate = false;
            waypoint_idx = 0;
          }
        }
      }
  }
  else{
    arrived = true;
    target_set = false;
    ROS_INFO("PID_denied");
  }

}

int main (int argc, char** argv)
{
  // hard code waypoints here

  // one target position
  // square_waypoints[0] = {20,0};

  // square path
  square_waypoints[0] = {5,0};
  square_waypoints[1] = {5,5};
  square_waypoints[2] = {0,5};
  square_waypoints[3] = {0,0};


  // Initialize ROS
  ros::init (argc, argv, "velodyne_sub");
  ros::NodeHandle nh;

  odom_sub = nh.subscribe("/gps/odom", 100000, &Odometry_callback);
  joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
  autonomy_status_sub = nh.subscribe("/AutonomyStatus", 10000, &autonomy_callback);

  left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
  right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);
  lateral_left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed_lateral", 10000);
  lateral_right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed_lateral", 10000);
  autonomy_status_pub = nh.advertise<std_msgs::Bool>("/AutonomyStatus", 1000);

  controller_init();

  ros::spinOnce();

  ros::Rate loop_rate(20);
  while(ros::ok()){
    process();
    ros::spinOnce();
    loop_rate.sleep();
  }

}

// Help functions
double Distance(float x1, float y1, float x2, float y2) {
    return sqrt((x2-x1)*(x2-x1)+ (y2-y1)*(y2-y1));
}

double deg2Rad(float deg) {
    return deg*PI/180;
}

double rad2Deg(float rad) {
    return rad*180/PI;
}
