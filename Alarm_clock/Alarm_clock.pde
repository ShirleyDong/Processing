import processing.sound.*;
import controlP5.*;

PImage bg;
//define the UI
ControlP5 cp5;
Textlabel setTimelabel;
Textfield hourField, minuteField;

int setHour,setMinute;
int currentHour, currentMinutes;

//define the sound file
SoundFile file;
DigitalClock digitalClock;

//clock
int cx, cy;
int dx, dy;
float secondsR;
float minutesR;
float hoursR;
float clockD;
boolean snooze = false;




void setup(){
  bg = loadImage("bg.jpg");
  size(924, 600);
  stroke(255);//set the outline to black
  
  //setup the clock
  int radius = min(width, height) /4;
  secondsR = radius * 0.72;
  minutesR = radius * 0.60;
  hoursR = radius * 0.50;
  clockD = radius * 1.8;
  //the coordinates of the center of the clock
  cx = width / 4;
  cy = height / 4;
  
  //the coordinates of the center of the digital clock
  dx = width / 4;
  dy = 3*height / 4;
  
  //setup the digital clock
  digitalClock = new DigitalClock(40, dx, dy); 
  
  //setup the button
  btnColor = color(0);
  btnHighlight = color(51);
  btnX = width/2 ;
  btnY = 2* height/3;
  
  
  //setuo the font and the inputbox
  PFont font = createFont("arial",20);
  cp5 = new ControlP5(this);
  setTimelabel = cp5.addTextlabel("timelabel")
                    .setText("Please input alarm time:")
                    .setPosition(width/2,height/30)
                    .setColor(color(255,255,255))
                    .setFont(font)
                    ;
 
  cp5.addTextlabel("Stoplabel")
                    .setText("Stop")
                    .setPosition(btnX+20,btnY+35)
                    .setColor(color(255,255,255))
                    .setFont(font)
                    ;
  cp5.addTextlabel("resetlabel")
                    .setText("Please click the stop if you want to reset the time!")
                    .setPosition(btnX,btnY-50)
                    .setColor(color(255,255,255))
                    .setFont(font)
                    ;
  hourField = cp5.addTextfield("Hour")
     .setPosition(width/2 ,  height/10)
     .setSize(50,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,255,255))
     ;
  minuteField = cp5.addTextfield("Minute")
     .setPosition(width/2 + 100 ,  height/10)
     .setSize(50,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,255,255))
     ;
   cp5.addButton("On")
     .setValue(0)
     .setPosition(width/2,height/10 + 100)
     .setSize(50,30)
     ;
   cp5.addButton("Off")
     .setValue(0)
     .setPosition(width/2 + 50,height/10 + 100)
     .setSize(50,30)
     ;
     
    cp5.addButton("SnoozeOn")
     .setValue(0)
     .setPosition(width/2,height/2-35)
     .setSize(50,30)
     ;
   cp5.addButton("SnoozeOff")
     .setValue(0)
     .setPosition(width/2 + 50,height/2-35)
     .setSize(50,30)
     ;
     
  //music
  file = new SoundFile(this, "ring.mp3");
  

  

}

void draw(){
  //currentTime
  currentHour = hour();
  currentMinutes = minute();
  
  
  
  update(mouseX, mouseY);
  background(bg);
  
  //draw the digital clock
  noFill();
  //noStroke();
  ellipse(dx, dy, 2*secondsR, 2*secondsR);
  fill(255);
  digitalClock.getTime();
  digitalClock.display();
  
  //button color
  if (btnOver) {
    fill(btnHighlight);
  } else {
    fill(btnColor);
  }
  //a button stop the ring
  stroke(255);
  rect(btnX, btnY, btnSize, btnSize);
  
  //draw the clock
  //the angles of the sin(), cos() start at the 3 o'clock
  //HALF_PI make it start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0 , 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsR, cy + sin(s) * secondsR);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesR, cy + sin(m) * minutesR);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursR, cy + sin(h) * hoursR);
  
  //Draw the minites ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6){
    float angle = radians(a);
    float x = cx + cos(angle) * secondsR;
    float y = cy + sin(angle) * secondsR;
    //the coordinates of the points
    vertex(x, y);
  }
  endShape();
  
  
  if (alarmIsOn == false) {
    fill(255);
    text("Alarm is off!", width/2 + 150,height/2-50);
    
    textSize(15);
    text("Please click ON after setting up the alarm time!",2 * width/3 + 13, height/10 + 90);
    
     
    
 
  } else {
    fill(255);
    text("Alarm is on!", width/2 + 150,height/2-50);
    textSize(15);
    text("Please click OFF if you want to cancel the clock!",2 * width/3 + 13, height/10 + 90);  
    
     if(snooze == false){
        fill(255);
        textSize(20);
        text("No snooze, press a SNOOZEON to add snooze!",width/2 + 200, 5* height/6 + 50);
        currentVolume = 1.0;
        alarm();
    
      }else{
        fill(255);
        textSize(20);
        text("Snooze on!",width/2 + 200, 5* height/6 + 50);
        for(t = 1; t< 4; t ++){
          snooze();
          print(t);
        }
      }
  }

  
  
}