#include "mb_controller.h"
#include "mb_defs.h"

/*******************************************************************************
* int mb_initialize()
*
* this initializes all the PID controllers from the configuration file
* you can use this as is or modify it if you want a different format
*
* return 0 on success
*
*******************************************************************************/
int k = 0;
int last_index = 0;
int si=0;

// some constants
double q0[2] = {0,0};
double k1 = 11;
double r0 = 1.650;
double ri = 0.185;
double rc = 0.480;
    
int waypoint_index = 0;
FILE* real;


int mb_initialize_controller(balancebot_msg_t* bb_msg){
    alpha_error = fopen("alpha.txt","w");
    mb_load_controller_config();
    step = 0.06;
    brake_status = 0;
    task1_status = 0;
    task_index = 4;

    int i;

    for (i = 0; i < 5; ++i){
        temp_left[i]=0;
        temp_right[i]=0;
        temp_arr_left[i]=0;
        temp_arr_right[i]=0;
    }
    
    
    left_pid = PID_Init(
        left_pid_params.kp,
        left_pid_params.ki,
        left_pid_params.kd,
        left_pid_params.dFilterHz,
        SAMPLE_RATE_HZ
        );

    right_pid = PID_Init(
        right_pid_params.kp,
        right_pid_params.ki,
        right_pid_params.kd,
        right_pid_params.dFilterHz,
        SAMPLE_RATE_HZ
        );

    inter_pid = PID_Init(
        inter_pid_params.kp,
        inter_pid_params.ki,
        inter_pid_params.kd,
        inter_pid_params.dFilterHz,
        SAMPLE_RATE_HZ
        );

    vel_pid = PID_Init(
        vel_pid_params.kp,
        vel_pid_params.ki,
        vel_pid_params.kd,
        vel_pid_params.dFilterHz,
        SAMPLE_RATE_HZ
        );

    pos_pid = PID_Init(
        pos_pid_params.kp,
        pos_pid_params.ki,
        pos_pid_params.kd,
        pos_pid_params.dFilterHz,
        SAMPLE_RATE_HZ
        );

    turn_pid = PID_Init(
        turn_pid_params.kp,
        turn_pid_params.ki,
        turn_pid_params.kd,
        turn_pid_params.dFilterHz,
        SAMPLE_RATE_HZ
        );

    PID_SetDerivativeFilter(left_pid, left_pid_params.dFilterHz);
    PID_SetDerivativeFilter(right_pid, right_pid_params.dFilterHz);
    PID_SetDerivativeFilter(inter_pid, inter_pid_params.dFilterHz);
    PID_SetDerivativeFilter(vel_pid, vel_pid_params.dFilterHz);
    PID_SetDerivativeFilter(pos_pid, pos_pid_params.dFilterHz);
    //PID_SetOutputLimits(left_pid,-1.0, 1.0);
    //PID_SetOutputLimits(right_pid,-1.0, 1.0);
    PID_SetOutputLimits(pos_pid,-0.1, 0.1);
    PID_SetIntegralLimits(pos_pid,-0.1, 0.1);
    //PID_SetIntegralLimits(inter_pid, -0.1, 0.1);
    
    //PID_SetIntegralLimits(vel_pid,-0.5, 0.5);
    //PID_SetOutputLimits(inter_pid,-0.7, 0.7);

    // **********************************************************
    // ************************ setpoint ************************
    // **********************************************************
    double starting[2] = {0,0};
    double ending[2] = {0,0};


    balancebot_gate_t_double gate[4];

    gate[0].left_post[0] = 0.305;
    gate[0].left_post[1] = 0.915;
    gate[0].right_post[0] = -0.305;
    gate[0].right_post[1] = 0.915;

    gate[1].left_post[0] = -1.22;
    gate[1].left_post[1] = 0.305;
    gate[1].right_post[0] = -0.61;
    gate[1].right_post[1] = 0.305;

    gate[2].left_post[0] = -0.61;
    gate[2].left_post[1] = -0.915;
    gate[2].right_post[0] = -0.61;
    gate[2].right_post[1] = -0.305;

    gate[3].left_post[0] = 0.61;
    gate[3].left_post[1] = -0.61;
    gate[3].right_post[0] = 0.61;
    gate[3].right_post[1] = -1.22;

    for (i = 0;i<4; ++i){
        gate[i].left_post[0] = bb_msg->gates[i].left_post[0];
        gate[i].left_post[1] = -bb_msg->gates[i].left_post[1];
        gate[i].right_post[0] = bb_msg->gates[i].right_post[0];
        gate[i].right_post[1] = -bb_msg->gates[i].right_post[1];
    }

    balancebot_point_t center[4];
    balancebot_point_t goal[10];

    goal[0].point_post[0] = starting[0];
    goal[0].point_post[1] = starting[1];
    // goal[0].point_post[0] = 0;
    // goal[0].point_post[1] = 0;
    // goal[0].point_post[0] = bb_msg->pose.x;
    // goal[0].point_post[1] = bb_msg->pose.y;
    goal[9].point_post[0] = ending[0];
    goal[9].point_post[1] = ending[1];
    for (i = 0; i < 4; ++i){
        center[i].point_post[0] = (gate[i].left_post[0] + gate[i].right_post[0])/2;
        center[i].point_post[1] = (gate[i].left_post[1] + gate[i].right_post[1])/2;
    }

    for (i = 0; i < 4; ++i){
        double direction[2];
        direction[0] = gate[i].left_post[1] - gate[i].right_post[1];
        direction[1] = -(gate[i].left_post[0] - gate[i].right_post[0]);
        normalize_2d(direction);
        goal[2*i+1].point_post[0] = center[i].point_post[0] - (rc+0.100)*direction[0];
        goal[2*i+1].point_post[1] = center[i].point_post[1] - (rc+0.100)*direction[1];
        goal[2*i+2].point_post[0] = center[i].point_post[0] + (rc*2/3+0.030)*direction[0];
        goal[2*i+2].point_post[1] = center[i].point_post[1] + (rc*2/3+0.030)*direction[1];
    
    }

    balancebot_point_t pos_cur;


    int s;
    int error;
    

    for (i = 0; i < 9; ++i){
        for (s = 3; s < 30; ++s){
            
            int error = 0;
            int waypoint_index = 0;
            k1 = s;

            balancebot_point_t goal_cur;
            pos_cur.point_post[0] = goal[i].point_post[0];
            pos_cur.point_post[1] = goal[i].point_post[1];
            goal_cur.point_post[0] = goal[i+1].point_post[0];
            goal_cur.point_post[1] = goal[i+1].point_post[1];
            int start_count = (i+1)/2;
            // printf("point: %d\n", i);

            while(norm_2d(pos_cur.point_post, goal_cur.point_post) > 0.02){
                double phi = calculate_phi(start_count, gate, center, goal_cur, pos_cur);
                // printf("phi = %f\n", phi);

                balancebot_point_t qx = pos_cur;
                balancebot_point_t qy = pos_cur;
                qx.point_post[0] += 0.01;
                qy.point_post[1] += 0.01;
                double phi_x = calculate_phi(start_count, gate, center, goal_cur, qx);
                double phi_y = calculate_phi(start_count, gate, center, goal_cur, qy);
                double delta_q[2] = {phi-phi_x, phi-phi_y};
                normalize_2d(delta_q);

                waypoint[last_index+waypoint_index][0] = pos_cur.point_post[0];
                waypoint[last_index+waypoint_index][1] = pos_cur.point_post[1];
                pos_cur.point_post[0] += 0.01*delta_q[0];
                pos_cur.point_post[1] += 0.01*delta_q[1];

                // printf("phi = %f %f %f\n", phi, phi_x, phi_y);
                
                waypoint_index++;

                if (waypoint_index > 1000 || isnan(pos_cur.point_post[0])){
                    error = 1;
                    break;
                }
            }
            if (error == 0){
                last_index += waypoint_index;
                //printf("path %d uses k = %f\n", i, k1);
                break;
            }
        }
    }
    real = fopen("real.txt","w");
    // FILE* navi = fopen("navi.txt","w");
    // for (i = 0; i < last_index; ++i){
    //     fprintf(navi, "%f, %f\n", waypoint[i][0],  waypoint[i][1]);
    // }

    waypoint[0][0]=-0.915;
    waypoint[0][1]=0;

    for (si = 1; si <= 360*3; ++si)
    {
        waypoint[si][0]=si/600.0-0.915;
        waypoint[si][1]=sin(si*3.1415926/180)/3;
    }

    FILE* navi = fopen("navi.txt","w");
    for (i = 0; i < si-1; ++i){
        fprintf(navi, "%f, %f\n", waypoint[i][0]+0.915,  waypoint[i][1]);
    }
   
    return 0;

}

/*******************************************************************************
* int mb_load_controller_config()
*
* this provides a basic configuration load routine
* you can use this as is or modify it if you want a different format
*
* return 0 on success
*
*******************************************************************************/


int mb_load_controller_config(){

    inter_pid_params.dFilterHz = 16; // Filter cut off frequency
    left_pid_params.dFilterHz = 8;
    right_pid_params.dFilterHz = 8;
    vel_pid_params.dFilterHz = 10;
    pos_pid_params.dFilterHz = 3;

    left_pid_params.kp = 1;
    left_pid_params.ki = 3.5;
    left_pid_params.kd = 0;
    right_pid_params.kp = 1;
    right_pid_params.ki = 3.5;
    right_pid_params.kd = 0;

    inter_pid_params.kp = 2.5;  //2.5
    inter_pid_params.ki = 10;  //10
    inter_pid_params.kd = 6;  //6

    vel_pid_params.kp = 0.35;//0.35
    vel_pid_params.ki = 0.05;//0.05
    vel_pid_params.kd = 0.2;//0.2

    pos_pid_params.kp = 3;//0.5
    pos_pid_params.ki = 1;//0.2
    pos_pid_params.kd = 10;// Kd = 25 too large damping, but good

    turn_pid_params.kp = 1;
    turn_pid_params.ki = 0;
    turn_pid_params.kd = 0;


    return 0;
}


/*******************************************************************************
* int mb_median_filter()
* 
* TODO: Write your cascaded PID controller here
* take inputs from the global mb_state
* write outputs to the global mb_state
*
* return 0 on success
*
*******************************************************************************/
int mb_median_filter(mb_state_t* mb_state)
{
if (abs(mb_state->left_encoder)<64 && abs(mb_state->right_encoder)<64)
    {
        int temp_temp = 0;
        int i,j=0;
        for (i=4; i>0; i--)
        {
            temp_left[i]=temp_left[i-1];
            temp_right[i]=temp_right[i-1];
        }
        temp_left[0] = mb_state->left_encoder;
        temp_right[0] = mb_state->right_encoder;

        for (i=0; i<5; i++)
        {
            temp_arr_left[i]=temp_left[i];
            temp_arr_right[i]=temp_right[i];
        }

        for ( j = 0; j < 5; ++j)
        {
            for ( i = j+1; i < 5 ; i++)
            {
                if (temp_arr_left[i]>temp_arr_left[j])
                {
                    temp_temp = temp_arr_left[i];
                    temp_arr_left[i] = temp_arr_left[j];
                    temp_arr_left[j] = temp_temp;
                }
                if (temp_arr_right[i]>temp_arr_right[j])
                {
                    temp_temp = temp_arr_right[i];
                    temp_arr_right[i] = temp_arr_right[j];
                    temp_arr_right[j] = temp_temp;
                }
            }
        }
    }


return 0;

}

/*******************************************************************************
* int mb_controller_update()
* 
* TODO: Write your cascaded PID controller here
* take inputs from the global mb_state
* write outputs to the global mb_state
*
* return 0 on success
*
*******************************************************************************/
int mb_set_goal(mb_state_t* mb_state, float start_x, float start_y, float desired_x, float desired_y){
    mb_state->start_position[0]=start_x;
    mb_state->start_position[1]=start_y;

    mb_state->desired_position[0]=desired_x;
    mb_state->desired_position[1]=desired_y;
    return 0;
}

int mb_compute_for_control(mb_state_t* mb_state,mb_odometry_t* mb_odometry)
{
    if (task_index == 4){
        mb_state->current_position[0]=mb_odometry->world_x;
        mb_state->current_position[1]=-mb_odometry->world_y;
    }
    else{
        mb_state->current_position[0]=mb_odometry->x;
        mb_state->current_position[1]=mb_odometry->y;
    }


    // mb_state->current_position[0]=mb_odometry->world_x;////////////////////////////////////////////
    // mb_state->current_position[1]=-mb_odometry->world_y;
    
    mb_state->desired_direction[0]=mb_state->desired_position[0]-mb_state->start_position[0];
    mb_state->desired_direction[1]=mb_state->desired_position[1]-mb_state->start_position[1];
   
    mb_state->current_direction[0]=mb_state->desired_position[0]-mb_state->current_position[0];
    mb_state->current_direction[1]=mb_state->desired_position[1]-mb_state->current_position[1];

    mb_state->beta_desired = atan2(mb_state->desired_direction[1],mb_state->desired_direction[0]);
    mb_state->beta_current = atan2(mb_state->current_direction[1],mb_state->current_direction[0]);

    
    mb_state->project[0]=sqrt(mb_state->current_direction[0]*mb_state->current_direction[0]+mb_state->current_direction[1]*mb_state->current_direction[1])*cos(mb_state->beta_desired-mb_state->beta_current);
    mb_state->project[1]=sqrt(mb_state->current_direction[0]*mb_state->current_direction[0]+mb_state->current_direction[1]*mb_state->current_direction[1])*sin(mb_state->beta_desired-mb_state->beta_current);

    if (task_index == 4) mb_state->offset_distance = mb_state->project[1] + 0.8 *sin(mb_state->theta-mb_state->beta_desired);
    else mb_state->offset_distance = mb_state->project[1] + 0.4 *sin(mb_state->theta-mb_state->beta_desired);
    mb_state->summ = mb_state->offset_distance;
    return 0 ;
}

int mb_compute_for_task4(mb_state_t* mb_state,mb_odometry_t* mb_odometry)
{    

    // first_dis=norm(waypoint[k]-current_position);
    float sum = 0;
    // sum = sqrt((mb_state->waypoint[k][0]-mb_state->current_position[0])*(mb_state->waypoint[k][0]-mb_state->current_position[0])+(mb_state->waypoint[k][1]-mb_state->current_position[1])*(mb_state->waypoint[k][1]-mb_state->current_position[1]));
    sum = mb_state->project[0];
    int i = 0;
    i = k;
    
    // for (i = k; i < last_index - 1; ++i)
    for (i = k; i < si - 1; ++i)
     {
        if (sum < 0.01) //resolution
        {
            sum+= sqrt((waypoint[k+1][0]-waypoint[k][0])*(waypoint[k+1][0]-waypoint[k][0]) + (waypoint[k+1][1]-waypoint[k][1])*(waypoint[k+1][1]-waypoint[k][1]));
            // mb_state->summ =sum;
        }
        else
        {
            mb_state->kk = k;
            mb_set_goal(mb_state, waypoint[k][0],waypoint[k][1], waypoint[k+1][0], waypoint[k+1][1]);
            k = i; //index of goal
            break;
        }
     } 


     //observation
     
     
    

    return 0 ;
}
// ***************************************************************
// ********************** CONTROLLER UPDATE **********************
// ***************************************************************
int mb_controller_update(mb_state_t* mb_state, mb_odometry_t* mb_odometry, mb_setpoints_t* mb_setpoints, balancebot_msg_t* bb_msg){
    
    fprintf(real, "%f, %f\n", bb_msg->pose.x, -bb_msg->pose.y);
    mb_median_filter(mb_state);
    //float goal_x = 1.0;
    //float goal_y = 0.0;
    float goal = sqrt((mb_state->desired_position[0] - mb_state->start_position[0])*(mb_state->desired_position[0] - mb_state->start_position[0]) + (mb_state->desired_position[1] - mb_state->start_position[1])*(mb_state->desired_position[1] - mb_state->start_position[1]));
  
    if (mb_setpoints->manual_ctl)
    {
        if (mb_setpoints->fwd_velocity>0.04) 
        {
            brake_status = 0;
            mb_state->ref_vel = (mb_setpoints->fwd_velocity-0.04)*3;
            PID_ResetIntegrator(pos_pid);
        }
        else if(mb_setpoints->fwd_velocity<-0.04)
        {
            brake_status = 0;
            mb_state->ref_vel = (mb_setpoints->fwd_velocity+0.04)*3;
            PID_ResetIntegrator(pos_pid);
        }
        else 
        {
            if(brake_status == 0) {
                brake_status = 1;
                // mb_set_goal(mb_state, 0.0, 0.0, 0.0, 0.0);
                // mb_odometry->x = 0;
                // mb_odometry->y = 0;
            }

            mb_state->ref_vel = PID_Compute2(pos_pid,  0);// add a low pass filter to cancel the chattering
        }
        // turn_angle = mb_setpoints->turn_velocity;
        if (mb_setpoints->turn_velocity>0.04 || mb_setpoints->turn_velocity<-0.04) 
        {
            mb_state->turn_angle = PID_Compute2(turn_pid,mb_setpoints->turn_velocity);
        }
        else mb_state->turn_angle = 0;
    }

    else if (task_index == 1)
    {
        //mb_set_goal(mb_state, 0.0, 0.0, goal_x, goal_y);
        //mb_compute_for_control(mb_state,mb_odometry);
 	if(mb_state->project[0]< 0.02 && task1_status < 4) {
	    if (task1_status == 0) mb_set_goal(mb_state, 0.0, 0.0, 0.9, 0.0);
	    else if (task1_status == 1) mb_set_goal(mb_state, 0.9, 0.0, 0.9, 0.9);
	    else if (task1_status == 2) mb_set_goal(mb_state, 0.9, 0.9, 0.0, 0.9);
        else if (task1_status == 3) mb_set_goal(mb_state, 0.0, 0.9, 0.0, 0.12);

  	    task1_status++;
	    //if (task1_status == 4) task1_status = 0;
        }
    	mb_compute_for_control(mb_state,mb_odometry);
    	if(mb_state->project[0]>4*goal/5) {
            mb_state->ref_vel = 0.05;
            mb_state->turn_angle = PID_Compute2(turn_pid, - 0.4*mb_state->offset_distance);
        }
        else if(mb_state->project[0]>goal/4) {
            mb_state->ref_vel = 0.10;
            mb_state->turn_angle = PID_Compute2(turn_pid, - 0.4*mb_state->offset_distance);
        }
        //else if(mb_state->project[0]> 0.2) {
        //    mb_state->ref_vel = 0.05;
        //    mb_state->turn_angle = PID_Compute2(turn_pid, - 0.4*mb_state->offset_distance);
        //}
        else {
            mb_state->ref_vel = 0;
            mb_state->turn_angle = 0;
        }
    }

    else if (task_index == 2)
    {
        mb_set_goal(mb_state, 0.0, 0.0, 10.0, 0.0);
        mb_compute_for_control(mb_state,mb_odometry);

        if(mb_state->project[0]>goal/20) {
            mb_state->ref_vel = 0.26;
            mb_state->turn_angle = PID_Compute2(turn_pid, - 0.4*mb_state->offset_distance);
        }
        else if(mb_state->project[0]> 0.15) {
            mb_state->ref_vel = 0.10;
            mb_state->turn_angle = PID_Compute2(turn_pid, - 0.4*mb_state->offset_distance);
        }
        else {
            mb_state->ref_vel = 0;
            mb_state->turn_angle = 0;
        }
        
    }

    else if (task_index == 4)
    {
        //////////////////////
        //66666666666666666666666666666666666666666666666666666666666
        mb_compute_for_task4(mb_state,mb_odometry);
        mb_compute_for_control(mb_state,mb_odometry);

        // float dis2goal = sqrt((mb_state->waypoint[26][0]-mb_state->current_position[0])*(mb_state->waypoint[26][0]-mb_state->current_position[0])+(mb_state->waypoint[26][1]-mb_state->current_position[1])*(mb_state->waypoint[26][1]-mb_state->current_position[1]));
        // mb_state->dis2goall = dis2goal;

        // if(k < 98.5*last_index/100) {
        if(k < 98.5*si/100) {
            // mb_state->turn_angle = PID_Compute2(turn_pid, - 0.14*mb_state->offset_distance);
            // mb_state->ref_vel = (0.055-fabs(mb_state->turn_angle))/0.055*0.12;                      //peitao
            mb_state->turn_angle = PID_Compute2(turn_pid, - 0.2*mb_state->offset_distance);
            mb_state->ref_vel = (0.2-fabs(mb_state->turn_angle))/0.2*0.06;
        }
        else {
            mb_state->ref_vel = 0.0;
            mb_state->turn_angle = 0;
    }
    }
    
//66666666666666666666666666666666666666666666666666666666666

    // ********** calculate PID **********
    mb_state->ref_phi = PID_Compute2(vel_pid, mb_state->ref_vel- (temp_arr_left[2] + temp_arr_right[2])*3.1415926/(GEAR_RATIO*ENCODER_RES));
    mb_state->ref_phi_dot = PID_Compute2(inter_pid, mb_state->alpha - mb_state->ref_phi - 0.012); 

    mb_state->balance_left = PID_Compute1(left_pid, mb_state->ref_phi_dot  - 4*mb_state->turn_angle - temp_arr_left[2]*3.1415926*2/(GEAR_RATIO*ENCODER_RES));
    mb_state->balance_right = PID_Compute1(left_pid, mb_state->ref_phi_dot  + 4*mb_state->turn_angle - temp_arr_right[2]*3.1415926*2/(GEAR_RATIO*ENCODER_RES));
    
    // ********** set motor **********
    mb_state->left_cmd = mb_state->balance_left*64/67;
    mb_state->right_cmd = mb_state->balance_right;
   
    // ********** fix dead zone of motor **********
    if (mb_state->left_cmd > 0 && mb_state->left_cmd  < 0.95) mb_state->left_cmd  = mb_state->left_cmd + 0.053;
    else if (mb_state->left_cmd < 0 && mb_state->left_cmd  > -0.95) mb_state->left_cmd  = mb_state->left_cmd - 0.053;
    if (mb_state->right_cmd > 0 && mb_state->right_cmd  < 0.95) mb_state->right_cmd  = mb_state->right_cmd + 0.053;
    else if (mb_state->right_cmd < 0 && mb_state->right_cmd  > -0.95) mb_state->right_cmd  = mb_state->right_cmd - 0.053;

    // ********** print data to txt **********
    //fprintf(alpha_error, "%d, %d\n",temp_arr_left[5],temp_arr_right[5]);
    fprintf(alpha_error, "%f,%f,%f\n", mb_odometry->x, mb_odometry->y,  mb_state->turn_angle);
    // fprintf(alpha_error, "%f, %f,%f, %f,%d\n",  mb_setpoints->fwd_velocity,mb_state->ref_vel,mb_setpoints->turn_velocity,mb_state->turn_angle,mb_setpoints->manual_ctl);

    mb_state->count++;
    if(mb_state->count == 400) mb_state->count = 0;

    return 0;
}


/*******************************************************************************
* int mb_destroy_controller()
* 
* TODO: Free all resources associated with your controller
*
* return 0 on success
*
*******************************************************************************/

int mb_destroy_controller(){
    return 0;
}


double norm_2d_1(double* p){
    return sqrt(p[0]*p[0]+ p[1]*p[1]);
}

double norm_2d(double* p1, double* p2){
    return sqrt((p2[0]-p1[0])*(p2[0]-p1[0])+ (p2[1]-p1[1])*(p2[1]-p1[1]));
}

void normalize_2d(double* p){
    double dist = norm_2d_1(p);
    p[0] /= dist;
    p[1] /= dist;
}

double calculate_phi(int start_count, balancebot_gate_t_double* gate, balancebot_point_t* center, balancebot_point_t goal_cur, balancebot_point_t pos_cur){
    double beta_0 = -pow(norm_2d(pos_cur.point_post, q0),2) + r0*r0;
    int k = 0;
    for (k = 0; k < 4; ++k){
        double qi_l[2], qi_r[2]; // left gate
        qi_l[0] = gate[k].left_post[0];
        qi_l[1] = gate[k].left_post[1];
        qi_r[0] = gate[k].right_post[0];
        qi_r[1] = gate[k].right_post[1];
        beta_0 *= (pow(norm_2d(pos_cur.point_post, qi_l),2) - ri*ri);
        beta_0 *= (pow(norm_2d(pos_cur.point_post, qi_r),2) - ri*ri);
    }

    for (k = start_count; k < 4; ++k){
        double qi_c[2]; // left gate
        qi_c[0] = center[k].point_post[0];
        qi_c[1] = center[k].point_post[1];

        beta_0 *= (pow(norm_2d(pos_cur.point_post, qi_c),2) - rc*rc);
    }

    return pow(norm_2d(pos_cur.point_post, goal_cur.point_post),2)/pow((pow(norm_2d(pos_cur.point_post, goal_cur.point_post),2*k1)+beta_0),1/k1);
}
