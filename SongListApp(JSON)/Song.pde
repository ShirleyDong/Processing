int n, k;

Album[] songList, trackSong;
int SrectX, SrectY;
String artistsName;
String spotifyIDs;
Double tempo;
Double valence;
Double danceability;
String trackes, tr;
int vi;
JSONObject song;
JSONArray artists;
boolean overAlbum;
Album [] getInfo(){
    song = values.getJSONObject(vi);
    artists = song.getJSONArray("artists");
    k = artists.size();
    trackSong = new Album[k];
    for(n = 0; n < k; n ++){
      artistsName = song.getJSONArray("artists").getString(n);
      spotifyIDs = song.getJSONArray("spotifyIDs").getString(n);
      tempo = song.getJSONArray("tempo").getDouble(n);
      valence = song.getJSONArray("valence").getDouble(n);
      danceability = song.getJSONArray("danceability").getDouble(n);
      trackes = song.getJSONArray("tracks").getString(n);
      //println(vi);
      //println(artistsName);
      tr = trackes + "        " + artistsName;
      fill(150);
      SrectX = 3 * width/5;
      SrectY = 55 + n * 30;
      rect(SrectX, SrectY, 350, 20);
      //text
      fill(255);
      textSize(12);
      text(tr, 3 * width/5 + 50, 55 + n * 30 + 14); 
      //println(n + "----" + tr);
    }
    return trackSong;
}

void mouseInRectangle(float x, float y, float w, float h){
  
  if((mouseX >= x) && (mouseY < x + w) && (mouseY >= y) && (mouseY < y+ h)) {
     //println(v);
     vi = v - 1;
     overAlbum = true;  
  }
}