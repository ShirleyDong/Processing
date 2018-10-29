import controlP5.*;
import java.util.*;

PImage bg;
ControlP5 cp5;

String file = "NOW-US-1-61.json";


//album
Album[] albumList;
int h, i, j, v;
boolean ten;
JSONArray values;
int numberOfAlbum;
Album [] album;
JSONObject music;
int volume;
String releaseDate, name, d;
int b = 0;
int rectW = 300;
int rectH = 50;
int rectX;
int rectY;

boolean showAlbum = true, showSong = false;

//search
String inputValue;

//filter
String[] ReYear = {"1998", "1999", "2000", "2001", "2002", "2003", 
                   "2004", "2005", "2006", "2007", "2008", "2009", 
                   "2010", "2011", "2012", "2013", "2014", "2015", "2016"}; 
//color
color bgc = color(43,201,139);
color la = color(255, 255, 255);


void setup() {
  bg = loadImage("bg.jpg");
  size (1024, 700);
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  cp5.addButton("P1")
     .setPosition(width/2, 14* height/15)
     .setSize(30,30)
     .setColorBackground(bgc)
     .setColorLabel(la)
     ;
  cp5.addButton("P2")
     .setPosition(width/2 + 50, 14* height/15)
     .setSize(30,30)
     .setColorBackground(bgc)
     .setColorLabel(la)
     ;
  cp5.addButton("P3")
     .setPosition(width/2 + 100, 14* height/15)
     .setSize(30,30)
     .setColorBackground(bgc)
     .setColorLabel(la)
     ; 
  cp5.addButton("Home")
     .setPosition(width/2 - 70, 14* height/15)
     .setSize(60,30)
     .setColorBackground(bgc)
     .setColorLabel(la)
     ;
  cp5.addButton("Love")
     .setPosition(50, 50)
     .setSize(60,30)
     .setColorBackground(color(187, 15, 36))
     .setColorLabel(la)
     ;
  cp5.addButton("TOP10")
     .setPosition(120, 50)
     .setSize(60,30)
     .setColorBackground(bgc)
     .setColorLabel(la)
     ;

  List l = Arrays.asList(ReYear);

  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("ReleaseYear")
     .setPosition(210, 50)
     .setSize(100, 120)
     .setBarHeight(30)
     .setItemHeight(30)
     .addItems(l)
     // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
     ; 
     
  
}

Album [] createAlbum(String fromFile, int a){
  //JSONObject jsonData = loadJSONObject(fromFile);
  values = loadJSONArray(fromFile);
  numberOfAlbum = values.size();
  album = new Album[numberOfAlbum];
  
  for(i = a; i< a + 10; i++){
    music = values.getJSONObject(i);
    volume = music.getInt("volume");
    releaseDate = music.getString("releaseDate");
    name = music.getString("name");
    //getInfo();
    //print("\n" + volume + "\n" + releaseDate + "\n" + name);
    //draw the rect
    //noStroke();
    fill(150);
    rectX = width/3 + 5; 
    rectY = 55 + i % 10 * 55;
    noStroke();
    rect(rectX, rectY, rectW, rectH);
    //text
    v = volume;
    d = releaseDate;
    h = 50 + i % 10 * 15;
    fill(255);
    textSize(17);
    text(v, width/3 + 75, 55 + 25 + 55 * (i % 10)); 
    textSize(12);
    text(d, width/3 + 75, 55 + 45 + 55 * (i % 10)); 
    mouseInRectangle(rectX, rectY, rectW, rectH);
;
    //text(d, width/3, h);
  }
  for(j = a + 10; j< a + 20; j++){
    music = values.getJSONObject(j);
    volume = music.getInt("volume");
    releaseDate = music.getString("releaseDate");
    name = music.getString("name");
    //getInfo();
    //print("\n" + volume + "\n" + releaseDate + "\n" + name);
    //draw the rect
    //noStroke();
    fill(150);
    rectX = 2 * width/3 + 5; 
    rectY = 55 + j % 10 * 55;
    noStroke();
    rect(rectX, rectY, rectW, rectH);
    //text
    v = volume;
    d = releaseDate;
    h = 50 + j % 10 * 15;
    fill(255);
    textSize(17);
    text(v, 2 * width/3 + 75, 55 + 25 + 55 * (j % 10)); 
    textSize(12);
    text(d, 2 * width/3 + 75, 55 + 45 + 55 * (j % 10)); 
    mouseInRectangle(rectX, rectY, rectW, rectH);
  }
  return album;
  
}


void draw() {
  background(bg);
  allData();
  overAlbum = false;
  overSong = false;
  //loadedImage();
  
  
  //inputValue = cp5.get(Textfield.class,"Search").getText().toString();
  //print(display);
  
  if(showAlbum == true && showSong == false){
    albumList = createAlbum(file, b);
  }
  if(showAlbum == false && showSong == true){
    songList = getInfo();
  }

}

void mousePressed(){
  if(overAlbum == true){
    showAlbum = false;
    showSong = true;
    println("click");
  }
}

void keyPressed() {
  switch(key) {
    case('1'):
    /* make the ScrollableList behave like a ListBox */
    cp5.get(ScrollableList.class, "ReleaseYear").setType(ControlP5.LIST);
    break;
    case('2'):
    /* make the ScrollableList behave like a DropdownList */
    cp5.get(ScrollableList.class, "ReleaseYear").setType(ControlP5.DROPDOWN);
    break;
    case('3'):
    /*change content of the ScrollableList */
    List l = Arrays.asList("a-1", "b-1", "c-1", "d-1", "e-1", "f-1", "g-1", "h-1", "i-1", "j-1", "k-1");
    cp5.get(ScrollableList.class, "ReleaseYear").setItems(l);
    break;
    case('4'):
    /* remove an item from the ScrollableList */
    cp5.get(ScrollableList.class, "ReleaseYear").removeItem("k-1");
    break;
    case('5'):
    /* clear the ScrollableList */
    cp5.get(ScrollableList.class, "ReleaseYear").clear();
    break;
  }
}