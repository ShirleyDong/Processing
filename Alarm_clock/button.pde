//button
int btnX, btnY;
int btnSize = 90;
color btnColor;
color btnHighlight;
boolean btnOver = false;
boolean callMethod = true;
boolean alarmIsOn = false;


void update(int x, int y){
  if ( overBtn(btnX, btnY, btnSize, btnSize) ) {
    btnOver = true;
  } else {
    btnOver = false;
  }
}

boolean overBtn(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}



void mousePressed() {
  if (btnOver) {
    file.stop();
    callMethod = true;
    
  }
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

public void On(){
    //get the setTime
  setHour = int(hourField.getText());
  setMinute = int(minuteField.getText());
  print(setHour+":"+setMinute);
  alarmIsOn = true;
}

public void Off(){
  setHour = 25;
  alarmIsOn = false;
}

public void SnoozeOn(){
  print("Son");
  snooze = true;
}

public void SnoozeOff(){
  print("Soff");
  snooze = false;
}