/*******************************************************************************
* mb_defs.h
*
*   defines for your bot
*   You will need to fill this in based on the data sheets, schematics, etc. 
*      and your specific configuration...
* 
*******************************************************************************/
#ifndef MB_DEFS_H
#define MB_DEFS_H

#define DEFAULT_PWM_FREQ        25000 // period of motor drive pwm
#define LEFT_MOTOR              1     // id of left motor CHECK!
#define RIGHT_MOTOR             2     // id of right motor CHECK!
#define MDIR1                   60    // gpio1.28  P9.12 CHECK!
#define MDIR2                   48    // gpio1.16  P9.15 CHECK!
#define MOT_EN                  20    // gpio0.20  P9.41 CHECK!
#define MOT_1_POL               1    // polarity of left motor CHECK!
#define MOT_2_POL               -1    // polarity of right motor CHECK!
#define ENC_1_POL               1    // polarity of left encoder CHECK!
#define ENC_2_POL               -1    // polarity of right encoder CHECK!
#define GEAR_RATIO              20.4    // gear ratio of motor CHECK!
#define ENCODER_RES             48    // encoder counts per motor shaft revolution CHECK!
#define WHEEL_DIAMETER          0.08 // diameter of wheel in meters CHECK!
#define WHEEL_BASE              0.2  // wheel separation distance in meters NO CHECK!
#define FWD_VEL_SENSITIVITY     0.1   // sensitivity of RC control for moving NO CHECK!
#define TURN_VEL_SENSITIVITY    0.1   // sensitivity of RC control for turning 
#define SAMPLE_RATE_HZ          100   // main filter and control loop speed
#define DT                      0.01  // 1/sample_rate
#define PRINTF_HZ               10    // rate of print loop
#define RC_CTL_HZ               100    // rate of RC data update
#define D1_ORDER 				1
#define D1_NUM					{0.0,1.0}
#define D1_DEN					{0.008, 1.0}

#endif
