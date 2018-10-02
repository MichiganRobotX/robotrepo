/*******************************************************************************
* mb_odometry.c
*
* TODO: Implement these functions to add odometry and dead rekoning 
*
*******************************************************************************/

#include "../balancebot/balancebot.h"

#define DTHETA_THRESH 0.001

void mb_initialize_odometry(mb_odometry_t* mb_odometry, float x, float y, float theta){
	mb_odometry->x = 0;  //1.2
	mb_odometry->y = 0;  //-1.2
	mb_odometry->theta = 0;
}

void mb_update_odometry(mb_odometry_t* mb_odometry, mb_state_t* mb_state){
	float temp = (mb_state->left_encoder + mb_state->right_encoder)/2;
	mb_odometry->theta=mb_state->theta;
    mb_odometry->distance_dot = (temp)*3.1415926*WHEEL_DIAMETER/(GEAR_RATIO*ENCODER_RES);
    mb_odometry->x += mb_odometry->distance_dot*cos(mb_odometry->theta);
    mb_odometry->y += mb_odometry->distance_dot*sin(mb_odometry->theta);

}


float mb_clamp_radians(float angle){
    return 0;
}
