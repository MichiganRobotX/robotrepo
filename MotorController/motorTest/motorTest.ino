// WAM-V Motor Controller

#include <Servo.h>
// #include <ros.h>

// Somehwere in here we need to add getting the controller info from 

int outpin = 9; // PWM Output port 
int pos = 0;    // variable to store the servo position
int potpin = 1; // Analog In Location from the potentiometer 

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600); // opens serial port, sets data rate to 9600 bps

}

void loop() {
  // put your main code here, to run repeatedly:
  pos = analogRead(potpin); // Read the position from the potentiometer  

  Serial.print("Servo: ");
  Serial.println(outpin, DEC);
         
         
  analogWrite(outpin, pos/4); // tell servo to go to position in variable 'pos'   
  // Input is 0 to 1023, Output is 0 to 255, hence the divide by 4
           
}
