#include "control.h"

/* ch:  0 ,1 ,2 ,3 for two wheels, 4 for direction , 5 for capture
 * div  设置预分频为div分频 100MHz输入，则pwm的时钟clk为100/(div+1) MHz
 * period 设置周期为  clk/period = frequency
 * duty  设置占空比为duty/period*100%=50%
 * 例如：输出10KHz，占空比50%的pwm0波形
 * ch = 0 , div = 1 得到50MHz , period = 5000 得到10KHz ，duty = 2500，占空比为50%
 */
/*
 * 轮子电机频率 10kHz   100MHz -> 50MHz -> 10 kHz
 * ch = 0 , div = 1 ,period = 5000
 *
 * 两个舵机频率50Hz   100MHz -> 1MHz -> 50 Hz
 *
 * ch=2 ,div = 9, period =  20 000
 */
void setpwm(uint8_t ch1, uint8_t div1, uint32_t period1, uint32_t duty1)
{
	set_pwm_clkdiv(ch1, div1);
	set_pwm_period(ch1, period1);
	set_pwm_duty(ch1, duty1);
	pwm_cmd(ch1, ENABLE);
}


void Go_Forward(uint32_t PWM)
{
	// 左轮
		setpwm(0,1,50000,PWM); // AIN1
		setpwm(1,1,50000,20000); // AIN2

	// 右轮
		setpwm(0,1,50000,PWM); // BIN1
		setpwm(1,1,50000,20000); // BIN2
}

void Back_Forward(uint32_t PWM)
{
	setpwm(4,9,200000,15000);  //舵机 90°
	// 左轮
		setpwm(0,1,50000,45000); // AIN1
		setpwm(1,1,50000,PWM); // AIN2
	// 右轮
		setpwm(0,1,50000,45000); // BIN1
		setpwm(1,1,50000,PWM); // BIN2
}
void Go_Right_Forward(uint32_t PWM) // 15000时为90°，10000时为45°
{
	setpwm(4,9,200000,PWM);  //舵机 90°
	// 左轮
	setpwm(0,1,50000,45000); // AIN1
	setpwm(1,1,50000,20000); // AIN2

	// 右轮
	setpwm(2,1,50000,45000); // BIN1
	setpwm(3,1,50000,20000); // BIN2
}
void Go_Left_Forward(uint32_t PWM) // 15000时为90°，10000时为45°
{
	setpwm(4,9,200000,PWM);  //舵机
	// 左轮
	setpwm(0,1,50000,45000); // AIN1
	setpwm(1,1,50000,20000); // AIN2

	// 右轮
	setpwm(2,1,50000,45000); // BIN1
	setpwm(3,1,50000,20000); // BIN2
}
void Capture_set(uint32_t PWM)  // 15000时为90°，10000时为45°
{
	setpwm(4,9,200000,PWM);  //舵机
}


void Stop(void)
{
	setpwm(5,9,200000,14222);  //舵机回正

	// 左轮
	setpwm(0,1,50000,20000); // AIN1
	setpwm(1,1,50000,20000); // AIN2

	// 右轮
	setpwm(2,1,50000,20000); // BIN1
	setpwm(3,1,50000,20000); // BIN2
}
