import processing.serial.*;
import processing.sound.*;
import cc.arduino.*;

Arduino arduino; 

int photocellPin0_0 = 0;
int photocellPin0_1 = 1;
int photocellPin0_2 = 2;
int photocellPin0_3 = 3;

int photocellPin1_0 = 4;
int photocellPin1_1 = 5;
int photocellPin1_2 = 6;
int photocellPin1_3 = 7;

int photocellPin2_0 = 8;
int photocellPin2_1 = 9;
int photocellPin2_2 = 10; 
int photocellPin2_3 = 11;

int photocellPin3_0 = 12;
int photocellPin3_1 = 13;
int photocellPin3_2 = 14;
int photocellPin3_3 = 15;

float photocellPin0_0_raw = 0;
float photocellPin0_1_raw = 1;
float photocellPin0_2_raw = 2;
float photocellPin0_3_raw = 3;

float photocellPin1_0_raw = 4;
float photocellPin1_1_raw = 5;
float photocellPin1_2_raw = 6;
float photocellPin1_3_raw = 7;

float photocellPin2_0_raw = 8;
float photocellPin2_1_raw = 9;
float photocellPin2_2_raw = 10; 
float photocellPin2_3_raw = 11;

float photocellPin3_0_raw = 12;
float photocellPin3_1_raw = 13;
float photocellPin3_2_raw = 14;
float photocellPin3_3_raw = 15;

boolean photocellPin0_0_active = false;
boolean photocellPin0_1_active = false;
boolean photocellPin0_2_active = false;
boolean photocellPin0_3_active = false;

boolean photocellPin1_0_active = false;
boolean photocellPin1_1_active = false;
boolean photocellPin1_2_active = false;
boolean photocellPin1_3_active = false;

boolean photocellPin2_0_active = false;
boolean photocellPin2_1_active = false;
boolean photocellPin2_2_active = false; 
boolean photocellPin2_3_active = false;

boolean photocellPin3_0_active = false;
boolean photocellPin3_1_active = false;
boolean photocellPin3_2_active = false;
boolean photocellPin3_3_active = false;

int track_1_interval = 1;
int track_2_interval = 1;
int track_3_interval = 1;
int track_4_interval = 1;

int timer;
int current_period = 0;
int UNIVERSAL_TIMER = 1000;

SoundFile kick, hat, guitar, tabla, crash;

void setup() { 
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[1], 57600);

  kick = new SoundFile(this, "kick.aif");
  hat = new SoundFile(this, "hat.aif");
  guitar = new SoundFile(this, "guitarchord.aif");
  tabla = new SoundFile(this, "tabla.aif");
  crash = new SoundFile(this, "crash.wav");  
}

void draw() {
  // START PARSING
  float photocellPin0_0_raw = arduino.analogRead(photocellPin0_0);
  float photocellPin0_1_raw = arduino.analogRead(photocellPin0_1);
  float photocellPin0_2_raw = arduino.analogRead(photocellPin0_2);
  float photocellPin0_3_raw = arduino.analogRead(photocellPin0_3);

  float photocellPin1_0_raw = arduino.analogRead(photocellPin1_0);
  float photocellPin1_1_raw = arduino.analogRead(photocellPin1_1);
  float photocellPin1_2_raw = arduino.analogRead(photocellPin1_2);
  float photocellPin1_3_raw = arduino.analogRead(photocellPin1_3);

  float photocellPin2_0_raw = arduino.analogRead(photocellPin2_0);
  float photocellPin2_1_raw = arduino.analogRead(photocellPin2_1);
  float photocellPin2_2_raw = arduino.analogRead(photocellPin2_2);
  float photocellPin2_3_raw = arduino.analogRead(photocellPin2_3);  

  float photocellPin3_0_raw = arduino.analogRead(photocellPin3_0);
  float photocellPin3_1_raw = arduino.analogRead(photocellPin3_1);
  float photocellPin3_2_raw = arduino.analogRead(photocellPin3_2);
  float photocellPin3_3_raw = arduino.analogRead(photocellPin3_3);

  int THRESHOLD = 200;

  if (photocellPin0_0_raw > THRESHOLD) {
    photocellPin0_0_active = true;
  } else {
    photocellPin0_0_active = false;
  }
  if (photocellPin0_1_raw > THRESHOLD) {
    photocellPin0_1_active = true;
  } else {
    photocellPin0_1_active = false;
  }
  if (photocellPin0_2_raw > THRESHOLD) {
    photocellPin0_2_active = true;
  } else {
    photocellPin0_2_active = false;
  }
  if (photocellPin0_3_raw > THRESHOLD) {
    photocellPin0_3_active = true;
  } else {
    photocellPin0_3_active = false;
  }    

  if (photocellPin1_0_raw > THRESHOLD) {
    photocellPin1_0_active = true;
  } else {
    photocellPin1_0_active = false;
  }
  if (photocellPin1_1_raw > THRESHOLD) {
    photocellPin1_1_active = true;
  } else {
    photocellPin1_1_active = false;
  }
  if (photocellPin1_2_raw > THRESHOLD) {
    photocellPin1_2_active = true;
  } else {
    photocellPin1_2_active = false;
  }
  if (photocellPin1_3_raw > THRESHOLD) {
    photocellPin1_3_active = true;
  } else {
    photocellPin1_3_active = false;
  }   

  if (photocellPin2_0_raw > THRESHOLD) {
    photocellPin2_0_active = true;
  } else {
    photocellPin2_0_active = false;
  }
  if (photocellPin2_1_raw > THRESHOLD) {
    photocellPin2_1_active = true;
  } else {
    photocellPin2_1_active = false;
  }
  if (photocellPin2_2_raw > THRESHOLD) {
    photocellPin2_2_active = true;
  } else {
    photocellPin2_2_active = false;
  }
  if (photocellPin2_3_raw > THRESHOLD) {
    photocellPin2_3_active = true;
  } else {
    photocellPin2_3_active = false;
  }

  if (photocellPin3_0_raw > THRESHOLD) {
    photocellPin3_0_active = true;
  } else {
    photocellPin3_0_active = false;
  }
  if (photocellPin3_1_raw > THRESHOLD) {
    photocellPin3_1_active = true;
  } else {
    photocellPin3_1_active = false;
  }
  if (photocellPin3_2_raw > THRESHOLD) {
    photocellPin3_2_active = true;
  } else {
    photocellPin3_2_active = false;
  }
  if (photocellPin3_3_raw > THRESHOLD) {
    photocellPin3_3_active = true;
  } else {
    photocellPin3_3_active = false;
  }

  boolean[] station0 = { photocellPin0_0_active, photocellPin0_1_active, photocellPin0_2_active, photocellPin0_3_active }; 
  boolean[] station1 = { photocellPin1_0_active, photocellPin1_1_active, photocellPin1_2_active, photocellPin1_3_active }; 
  boolean[] station2 = { photocellPin2_0_active, photocellPin2_1_active, photocellPin2_2_active, photocellPin2_3_active }; 
  boolean[] station3 = { photocellPin3_0_active, photocellPin3_1_active, photocellPin3_2_active, photocellPin3_3_active }; 

  for (int i = 0; i < station0.length; i++) {
    if (station0[i] == true) {
      track_1_interval = i + 1;
    }
  }

  for (int i = 0; i < station1.length; i++) {
    if (station1[i] == true) {
      track_2_interval = i + 1;
    }
  }

  for (int i = 0; i < station2.length; i++) {
    if (station2[i] == true) {
      track_3_interval = i + 1;
    }
  }

  for (int i = 0; i < station3.length; i++) {
    if (station3[i] == true) {
      track_4_interval = i + 1;
    }
  }

  // END PARSING
  
  if (millis() - timer >= UNIVERSAL_TIMER) {
    current_period++;
    current_period = (current_period % 4);
    println(current_period + 1);
    timer = millis();
  }
  
  if ((current_period + 1) % track_1_interval == 0) {
    kick.play();
  }
  if ((current_period + 1) % track_2_interval == 0) {
    hat.play();
  }
  if ((current_period + 1) % track_3_interval == 0) {
    tabla.play();
  }
  if ((current_period + 1) % track_4_interval == 0) {
    crash.play();
  }  
  delay(UNIVERSAL_TIMER);  
}