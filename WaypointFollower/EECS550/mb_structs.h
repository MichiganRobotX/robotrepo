#ifndef MB_STRUCTS_H
#define MB_STRUCTS_H

typedef struct mb_state mb_state_t;
struct mb_state{
    // raw sensor inputs
    float   alpha;             // body angle (rad)
    float   theta;             // heading  (rad)
    int     left_encoder;      // left encoder counts since last reading
    int     right_encoder;     // right encoder counts since last reading

    //outputs
    float   left_cmd;  //left wheel command [-1..1]
    float   right_cmd; //right wheel command [-1..1]
    float   ref_phi_dot;
    float   ref_phi;
    float   ref_speed;
    float   ref_vel;
    int count;
    float pos;
    float balance_left;
    float balance_right;

    float desired_position[2];
    float start_position[2];
    float desired_direction[2];
    float current_direction[2];
    float current_position[2];
    float project[2];
    float current_start[2];
    float acce;

    float beta_desired;
    float beta_current;

    float offset_distance;
    float turn_angle;

    int brake_status; 
    int kk;
    float summ;
    float dis2goall;


    //TODO: Add more variables to this state as needed
};

typedef struct mb_setpoints mb_setpoints_t;
struct mb_setpoints{

    float fwd_velocity; // fwd velocity in m/s
    float turn_velocity; // turn velocity in rad/s
    int manual_ctl;
};

typedef struct mb_odometry mb_odometry_t;
struct mb_odometry{

    float x;        //x position from initialization in m
    float y;        //y position from initialization in m
    float theta;    //orientation from initialization in rad
    float distance_dot;
    double world_x;
    double world_y;
};

#endif
