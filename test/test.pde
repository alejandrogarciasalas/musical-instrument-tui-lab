 import processing.sound.*;
SoundFile kick, hat, guitar, tabla, crash;

int timer;
int current_period = 0;

int track_1_interval = 1;
int track_2_interval = 2;
int track_3_interval = 2;
int track_4_interval = 2;

void setup() {
  //size(640, 360);
  //background(255);
  
  kick = new SoundFile(this, "kick.aif");
  hat = new SoundFile(this, "hat.aif");
  guitar = new SoundFile(this, "guitarchord.aif");
  tabla = new SoundFile(this, "tabla.aif");
  crash = new SoundFile(this, "crash.wav");
  
}      

void draw() {
  
  if (millis() - timer >= 1000) {
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
    guitar.play();
  }
  if ((current_period + 1) % track_4_interval == 0) {
    tabla.play();
  }  
  delay(1000);
}