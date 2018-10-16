#include "waypoint_follower.h"
#include "controller.h"

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
        // goal_x = square_waypoints[waypoint_idx][0] + curr_x;
        // goal_y = square_waypoints[waypoint_idx][1] + curr_y;
        goal_x = square_waypoints[0][0] + curr_x;
        goal_y = square_waypoints[0][1] + curr_y;
        arrived = false;
      }
      else{ // keep controlling the boat to move to current target position

        RTR();

        if (Distance(curr_x, curr_y, goal_x, goal_y) < distTolerance) { // less than 1 meter, arrived
          arrived = true;
          waypoint_idx++;
          // if (waypoint_idx >= square_waypoints.size()){ // achieved the end of the path
          if (waypoint_idx >= 1){ // achieved the end of the path
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
    // std_msgs::Int16 motor_input_left;
    // std_msgs::Int16 lateral_motor_input_left;
    // std_msgs::Int16 lateral_motor_input_right;
    // std_msgs::Int16 motor_input_right;
    //
    // waypoint_follower_ros::PID angular_pid_msg;
    // waypoint_follower_ros::PID linear_pos_pid_msg;
    // waypoint_follower_ros::PID linear_vel_pid_msg;
    // waypoint_follower_ros::TuningParameters tuning_param_msg;

  // hard code waypoints here

  // one target position
  square_waypoints[0] = {20,0};

  // square path
  // square_waypoints.push_back(std::vector<int>{5,0});
  // square_waypoints.push_back(std::vector<int>{5,5});
  // square_waypoints.push_back(std::vector<int>{0,5});
  // square_waypoints.push_back(std::vector<int>{0,0});

  // Initialize ROS
  ros::init (argc, argv, "velodyne_sub");
  ros::NodeHandle nh;

  odom_sub = nh.subscribe("/gps/odom", 100000, &Odometry_callback);
  joy_sub = nh.subscribe("/joy", 10000, &joy_callback);
  autonomy_status_sub = nh.subscribe("/AutonomyStatus", 10000, &autonomy_callback);

  Publisher left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed", 10000);
  Publisher right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed", 10000);
  Publisher lateral_left_pub = nh.advertise<std_msgs::Int16>("/LmotorSpeed_lateral", 10000);
  Publisher lateral_right_pub = nh.advertise<std_msgs::Int16>("/RmotorSpeed_lateral", 10000);
  Publisher autonomy_status_pub = nh.advertise<std_msgs::Bool>("/AutonomyStatus", 1000);

  Publisher linear_pos_pid_pub = nh.advertise<waypoint_follower_ros::PID>("/pid/lin_pos", 10000);
  Publisher linear_vel_pid_pub = nh.advertise<waypoint_follower_ros::PID>("/pid/lin_vel", 10000);
  Publisher angular_pid_pub = nh.advertise<waypoint_follower_ros::PID>("/pid/angular", 10000);
  Publisher tuning_param_pub = nh.advertise<waypoint_follower_ros::TuningParameters>("/pid/tuning_params", 10000);

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


void RTR() {

  goal_theta = atan2((goal_y-curr_y),(goal_x-curr_x));

  if (abs(curr_theta - goal_theta) > deg2Rad(angTolerance)){ // if angle error is too big
    controller_update(false); // translation is false, only control angle
  }
  else {
    controller_update(true); // translation is false, only control angle
  }
}
