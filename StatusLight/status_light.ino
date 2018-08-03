// WAM-V Light controller
// Version 2.0
// Last Updated: August 3, 2018
// Owner: James Controller

// Libraries
#include <ros.h>

// Set the Arduino Parameters
#define RELAY_ON 0
#define RELAY_OFF 1
#define Relay_Red  2
#define Relay_Orange  3
#define Relay_Green  4
#define Relay_Blue  5

// Setup Sequence
void setup() {
//-------( Initialize Pins so relays are inactive at reset)----
  digitalWrite(Relay_Red, RELAY_OFF);
  digitalWrite(Relay_Orange, RELAY_OFF);
  digitalWrite(Relay_Green, RELAY_OFF);
  digitalWrite(Relay_Blue, RELAY_OFF);

//---( THEN set pins as outputs )----
  pinMode(Relay_Red, OUTPUT);
  pinMode(Relay_Orange, OUTPUT);
  pinMode(Relay_Green, OUTPUT);
  pinMode(Relay_Blue, OUTPUT);
  delay(5000);
}

// Run Loop
void loop(){
  digitalWrite(Relay_Red, RELAY_ON);// set the Relay ON
  digitalWrite(Relay_Orange, RELAY_ON);// set the Relay ON
  digitalWrite(Relay_Green, RELAY_ON);// set the Relay ON
  digitalWrite(Relay_Blue, RELAY_ON);// set the Relay ON
  delay(1000);              // wait for a second
  digitalWrite(Relay_Red, RELAY_OFF);// set the Relay OFF
  digitalWrite(Relay_Orange, RELAY_OFF);// set the Relay OFF
  digitalWrite(Relay_Green, RELAY_OFF);// set the Relay OFF
  digitalWrite(Relay_Blue, RELAY_OFF);// set the Relay OFF
  delay(1000);

}
