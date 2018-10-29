int songId;
int songX, albumX;
int c, f;
Album [] fSong;
Album [] fList;
JSONObject fmusic;
int fvolume;
String freleaseDate;
String fname;
JSONObject ffsong;
JSONArray fartists;
String fartistsName;
String fspotifyIDs;
double ftempo;
double fvalence;
double fdanceability;
String ftrackes;

String filterSong;

//boolean
boolean showLove = false, showDance = false, showYear  = false;

boolean g = false;
//Image
boolean overSong = false;
PImage img;
void allData(){
  values = loadJSONArray(file);
  //album = new Album[60];
  //println(numberOfItem);
  songId = 0;
  songX = 0;
  albumX = 0;
  for (c = 0; c < 60; c ++){
    fmusic = values.getJSONObject(c);
    fvolume = fmusic.getInt("volume");
    freleaseDate = fmusic.getString("releaseDate");
    fname = fmusic.getString("name");
    ffsong = values.getJSONObject(c);
    fartists = ffsong.getJSONArray("artists");
    k = fartists.size();
    //print(albumX);
    for (f = 0; f < k; f++){
      fartistsName = ffsong.getJSONArray("artists").getString(f);
      fspotifyIDs = ffsong.getJSONArray("spotifyIDs").getString(f);
      ftempo = ffsong.getJSONArray("tempo").getDouble(f);
      fvalence = ffsong.getJSONArray("valence").getDouble(f);
      fdanceability = ffsong.getJSONArray("danceability").getDouble(f);
      ftrackes = ffsong.getJSONArray("tracks").getString(f);
      songId ++; 
      filter();
      
    }
  }
  //println(songX);
  fSong = new Album[songId];
  //println(songId + "---" + artistsName + "---" + danceability);
}

void filter(){
  if(showDance == true && showLove == false && showYear == false){
    dance();
    //println("dance");
  }
  if(showDance == false && showLove == true && showYear == false){
    //println("love");
    key();
  }
  if(showYear == true && showDance == false && showLove == false){
    byYear(releaseY);
  }
}

void dance(){
  filterSong = ftrackes + "--" + fdanceability;
  if(fdanceability > 0.925){
      fill(255);
      text(filterSong, 50 , height/20 + songX * 15 + 100);
      
      
      //print(songX);
      songX++;
      //println(songId + "----" + fspotifyIDs + "\n" + overSong);
      mouseInSong(50, height/20 + songX * 15 +70, width/3, 15);
      if(overSong == true){
        loadedImage(fspotifyIDs);
      }
      }
      
      text("Move your mouse to song name to show the image information!!!", 50, height/20);

}

void mouseInSong(float x, float y, float w, float h){
  
  if((mouseX >= x) && (mouseY < x + w) && (mouseY >= y) && (mouseY < y+ h)) {
     //println(v);
     vi = v - 1;
     overSong = true;  
  }
}

void key(){
  filterSong = songId + "--" + ftrackes;
  //String word = inputValue;
  if(ftrackes.contains("Love")){
     fill(255);
     text(filterSong, 50 , height/20 + songX * 15 + 60);
     songX++;
  }
}



void loadedImage(String SID){
  if(overSong){
  String[] url = loadStrings("http://moody2.ucc.ie/test/Authoring/getSpot.php?track=" + SID);
  img = loadImage(url[0], "jpg") ;
  print("get");
  overSong = false;
  }else{
  img = createImage(150, 150, ARGB);
  }
  image(img, 40, height/2);
}  