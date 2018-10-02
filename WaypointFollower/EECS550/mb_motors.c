/*******************************************************************************
* mb_motors.c
*
* Control up to 2 DC motordrivers
*
*******************************************************************************/
#include "mb_motors.h"

// global initialized flag
int mb_motors_initialized = 0;
int mdir1 = MDIR1;
int mdir2 = MDIR2;
/*******************************************************************************
* int mb_initialize_motors()
* 
* set up gpio assignments, pwm channels, and make sure motors are left off.
* GPIO exporting must be done previously with simple_init_gpio()
* initialized motors should start disabled
*******************************************************************************/
int mb_initialize_motors(){

    #ifdef DEBUG
    printf("Initializing: PWM\n");
    #endif

    if(rc_pwm_init(1,DEFAULT_PWM_FREQ)){
        printf("ERROR: failed to initialize hrpwm1\n");
        return -1;
    }
    if(rc_pwm_init(2,DEFAULT_PWM_FREQ)){
        printf("ERROR: failed to initialize hrpwm2\n");
        return -1;
    }

    mb_motors_initialized = 1;
    #ifdef DEBUG
    printf("motors initialized...\n");
    #endif
    mb_disable_motors();
    return 0;
}


/*******************************************************************************
* mb_enable_motors()
* 
* turns on the standby pin to enable the h-bridge ICs
* returns 0 on success, -1 on failure
*******************************************************************************/
int mb_enable_motors(){
    if(mb_motors_initialized==0){
        printf("ERROR: trying to enable motors before they have been initialized\n");
        return -1;
    }
    return rc_gpio_set_value_mmap(MOT_EN, LOW);

    return 0;
}

/*******************************************************************************
* int mb_disable_motors()
* 
* disables PWM output signals and
* turns off the enable pin to disable the h-bridge ICs
* returns 0 on success
*******************************************************************************/
int mb_disable_motors(){
    if(mb_motors_initialized==0){
        printf("ERROR: trying to disable motors before they have been initialized\n");
        return -1;
    }
    rc_gpio_set_value_mmap(MOT_EN, HIGH);
    return 0;
}

/*******************************************************************************
* int mb_set_motor(int motor, float duty)
* 
* set a motor direction and power
* motor is from 1 to 2, duty is from -1.0 to +1.0
* returns 0 on success
*******************************************************************************/
int mb_set_motor(int motor, float duty){
    if(mb_motors_initialized==0){
        printf("ERROR: trying to rc_set_motor_all before they have been initialized\n");
        return -1;
    }
    uint8_t a;
    if (motor == 1){
        duty*=MOT_1_POL;
    }
    else if (motor == 2){
        duty*=MOT_2_POL;
    }
    //check that the duty cycle is within +-1
    if (duty>1.0){
        duty = 1.0;
    }
    else if(duty<-1.0){
        duty=-1.0;
    }
    //switch the direction pins to H-bridge
    if (duty>=0){
        a=HIGH;
    }
    else{
        a=LOW;
        duty=-duty;
    }
    
    // set gpio direction outputs & duty
    switch(motor){
        case 1:
            rc_gpio_set_value_mmap(mdir1, a);
            rc_pwm_set_duty_mmap(1, 'A', duty);
            // printf("set motor 1 at %d\n", mdir1);

            break;
        case 2:
            rc_gpio_set_value_mmap(mdir2, a);
            rc_pwm_set_duty_mmap(1, 'B', duty);
            // printf("set motor 2 at %d\n", mdir2);
            break;
        default:
            printf("enter a motor value between 1 and 4\n");
            return -1;
    }
    return 0;
}

/*******************************************************************************
* int mb_set_motor_all(float duty)
* 
* applies the same duty cycle argument to both motors
*******************************************************************************/
int mb_set_motor_all(float duty){
    if(mb_motors_initialized==0){
        printf("ERROR: trying to rc_set_motor_all before they have been initialized\n");
        return -1;
    }
    return 0;
}
