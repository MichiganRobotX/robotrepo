#ifndef MB_CONTROLLER_H
#define MB_CONTROLLER_H

#include "mb_pid.h"
#include "mb_structs.h"
#include <lcm/lcm.h>
#include "../lcmtypes/balancebot_msg_t.h"
#include "../lcmtypes/balancebot_gate_t.h"
#include "../lcmtypes/pose_xyt_t.h"
#define CFG_PATH "pid.cfg"

int mb_initialize_controller(balancebot_msg_t* bb_msg);
int mb_load_controller_config();
int mb_controller_update(mb_state_t* mb_state, mb_odometry_t* mb_odometry, mb_setpoints_t* mb_setpoints, balancebot_msg_t* bb_msg);
int mb_destroy_controller();
int mb_median_filter(mb_state_t* mb_state);
int mb_set_goal(mb_state_t* mb_state, float start_x, float start_y, float desired_x, float desired_y);
int mb_compute_for_control(mb_state_t* mb_state,mb_odometry_t* mb_odometry);
int mb_compute_for_task4(mb_state_t* mb_state,mb_odometry_t* mb_odometry);


PID_t * left_pid;
PID_t * right_pid;
PID_t * inter_pid;
PID_t * pos_pid;
PID_t * vel_pid;
PID_t * turn_pid;
FILE* alpha_error;
float step;
int task1_status;
int task_index;
int brake_status;

double waypoint[5000][2];

int temp_left[5];
int temp_right[5];
int temp_arr_left[5];
int temp_arr_right[5];

pid_parameters_t left_pid_params;
pid_parameters_t right_pid_params;
pid_parameters_t inter_pid_params;
pid_parameters_t pos_pid_params;
pid_parameters_t vel_pid_params;

pid_parameters_t turn_pid_params;

rc_filter_t D1;

typedef struct balancebot_gate_t_double balancebot_gate_t_double;
struct balancebot_gate_t_double
{
    double left_post[2];  //  left gate post (x,y)
    double right_post[2]; // right gate post (x,y)
};

typedef struct balancebot_point_t balancebot_point_t;
struct balancebot_point_t
{
    double point_post[2];
};


double norm_2d_1(double* p);
double norm_2d(double* p1, double* p2);
void normalize_2d(double* p);
double calculate_phi(int start_count, balancebot_gate_t_double* gate, balancebot_point_t* center, balancebot_point_t goal_cur, balancebot_point_t pos_cur);
balancebot_point_t find_next(balancebot_gate_t_double* gate, balancebot_point_t* center, balancebot_point_t* goal);


#endif

