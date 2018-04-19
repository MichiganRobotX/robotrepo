// WAM-V Motor Controller

#include <Servo.h>
// #include <ros.h>

// Somehwere in here we need to add getting the controller info from 

int outpin = 9; // PWM Output port 
int pos = 0;    // variable to store the servo position
int potpin = 1; // Analog In Location from the potentiometer 
int speed;

void setup() {
  
  // put your setup code here, to run once:
  Serial.begin(9600); // opens serial port, sets data rate to 9600 bps
  // Request a motor speed from the serial window 
  Serial.println("Please provide a motor speed between 0 and 255.");
}

void loop() {
  // Run motor only if you receive data 
  if (Serial.available() > 0) {
      // read the incoming byte:
      speed = Serial.parseInt();

      // say what you got:
      Serial.print("Motor speed set to: ");
      Serial.println(speed, DEC);

      if (speed > 255){
        speed = 255;
        Serial.println("Speed set too high, speed reset to 255.");
      }

      if (speed < 0){
        speed = 0;
        Serial.println("Speed cannot be less than 0, speed set to 0.");
      }
         
         
  analogWrite(outpin, speed); // tell servo to go to position in variable 'pos'   
  }
}
