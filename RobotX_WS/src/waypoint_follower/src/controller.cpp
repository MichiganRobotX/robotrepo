#include "controller.h"

//*********************************************************************************************************
//********************************************PID Controller***********************************************
//*********************************************************************************************************
void controller_init() {
  angular_pos_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  angular_pos_pid.SetI(0.6, -0.6);
  angular_pos_pid.SetD(0.8, -0.8);
  angular_pos_pid.SetOut(1, -1);

  linear_pos_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  linear_pos_pid.SetI(0.6, -0.6);
  linear_pos_pid.SetD(0.8, -0.8);
  linear_pos_pid.SetOut(1, -1);

  linear_vel_pid.Set(0.1, 0.1, 0.1); // Tune PID here
  linear_vel_pid.SetI(0.6, -0.6);
  linear_vel_pid.SetD(0.8, -0.8);
  linear_vel_pid.SetOut(1, -1);
}

// controller update HERE
void controller_update( bool transation_activated ) {

  // Linear pid update
  float errX = Distance(curr_x, curr_y, goal_x, goal_y);
  float outX = linear_pos_pid.Compute(errX, &linear_pos_pid_msg);
  tuning_param_msg.out_x = outX;

  // Linear vel pid update
  float errVel = outX - Distance(curr_velX, curr_velY, 0, 0);
  float outVel = linear_vel_pid.Compute(errVel, &linear_vel_pid_msg);
  tuning_param_msg.out_v = outVel;

  // angular pid update
  float errAng = goal_theta - curr_theta;
  float outAng = angular_pos_pid.Compute(errAng, &angular_pid_msg);
  tuning_param_msg.err_v = outVel;

  if(!transation_activated) outVel = 0; // forward speed = 0;

  float left_control = ((outVel - outAng) + 1)/2*SPEED_RANGE;
  float right_control = ((outVel + outAng) + 1)/2*SPEED_RANGE;

  if(left_control<0)
    left_control = 0;

  if(right_control<0)
    right_control = 0;

  if(left_control>SPEED_RANGE)
    left_control = SPEED_RANGE;

  if(right_control>SPEED_RANGE)
    right_control = SPEED_RANGE;

  motor_input_left.data = left_control; // move toward left
  motor_input_right.data = right_control; // move toward right

  left_pub.publish(motor_input_left);
  right_pub.publish(motor_input_right);
  linear_pos_pid_pub.publish(linear_pos_pid_msg);
  linear_vel_pid_pub.publish(linear_vel_pid_msg);
  angular_pid_pub.publish(angular_pid_msg);
  tuning_param_pub.publish(tuning_param_msg);
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
