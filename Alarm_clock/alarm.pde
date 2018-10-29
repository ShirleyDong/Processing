int nextAlHour, nextAlMinutes;
float currentVolume;
int currentSecond;
int t;
boolean snooze1 = true;
boolean snooze2 = true;
boolean snooze3 = true;
void alarm(){
  currentSecond = second();
  //print(currentSecond);
  if (currentHour == setHour && currentMinutes == setMinute && currentSecond == 1 && alarmIsOn == true){
      // Load a soundfile from the /data folder of the sketch and play it back
      //currentTime
      if(callMethod){
      print("play");
      file.amp(min(currentVolume, 1.0));
      file.play();
      callMethod = !callMethod;
  }
  }
}

void add1(){
  if(setMinute == 59){
    nextAlMinutes = 0;
    nextAlHour = currentHour + 1;
  }else{
    nextAlMinutes = setMinute + 1;
    nextAlHour = setHour;
  }
}

void add2(){
  if(setMinute == 59){
    nextAlMinutes = 1;
    nextAlHour = currentHour + 1;
  }else{
    nextAlMinutes = setMinute + 2;
    nextAlHour = setHour;
  }
}

void snooze(){
  currentSecond = second();
  if(t == 1){
    if (currentHour == setHour && currentMinutes == setMinute && currentSecond == 1 && alarmIsOn == true){
      // Load a soundfile from the /data folder of the sketch and play it back
      //currentTime
      if(callMethod){
      print("snooze 1");
      file.amp(min(0.05, 1.0));
      file.play();
      callMethod = !callMethod;
  }
  }
  }else if(t == 2){
    add1();
    if (currentHour == nextAlHour && currentMinutes == nextAlMinutes && currentSecond == 1 && alarmIsOn == true){
      // Load a soundfile from the /data folder of the sketch and play it back
      //currentTime
      if(callMethod){
      print("snooze 2");
      file.amp(0.5);
      file.play();
      callMethod = !callMethod;
  }
}
  }else{
    add2();
    if (currentHour == nextAlHour && currentMinutes == nextAlMinutes && currentSecond == 1 && alarmIsOn == true){
      // Load a soundfile from the /data folder of the sketch and play it back
      //currentTime
      if(callMethod){
      print("snooze 3");
      file.amp(1.0);
      file.play();
      callMethod = !callMethod;
  }
}
  
  }
}