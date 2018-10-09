/*
PID Class 
*/

#include <bits/stdc++.h>
#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/PoseWithCovariance.h>

using namespace ros;

class PID {

private:
	float pterm;
	float dterm;
	float iterm;

protected:
	float kp;
	float kd;
	float ki;
	float iMax;
	float iMin;
	float dMax;
	float dMin;
	float outputMin;
	float outputMax;
	float dt;

public:
	float prev_error;

	PID(float kp, float kd, float ki, float dt) {
		iterm = 0.0;
		dterm = 0.0;
		pterm = 0.0;
		iMax = 0.0;
		iMin = 0.0;
		dMax = 0.0;
		dMin = 0.0;
		outputMin = 0.0;
		outputMax = 0.0;
		kp = kp; 
		kd = kd; 
		ki = ki; 
		dt = dt;
	}

	void PID_Set(float kp, float kd, float ki) { kp = kp; ki = ki; kd = kd; }
	
	void PID_SetI(float max, float min) { iMax = max; iMin = min; }
	
	void PID_SetD(float max, float min) { iMax = max; iMin = min; }

	void PID_SetOut(float max, float min) { outputMax = max; outputMin = min; }

	void PID_Reset() { iterm = 0; }

	float PID_Compute(float error) {
		pterm = kp*error;
		dterm = kd*(error - prev_error)/dt;
		iterm = iterm + ki*error;

		if(iterm>iMax)
			iterm = iMax;
		if(iterm<iMin)
			iterm = iMin;

		if(dterm>dMax)
			dterm = dMax;
		if(dterm<dMin)
			dterm = dMin;

		float out = pterm + dterm + iterm;

		if(out<outputMin) {
			out = outputMin;
			PID_Reset();
		}
		if(out>outputMax) {
			out = outputMax;
			PID_Reset();
		}

		prev_error = error;

		return out;
	}
};