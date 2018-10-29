String releaseY;
void ReleaseYear(int n) {
  println(n, cp5.get(ScrollableList.class, "ReleaseYear").getItem(n));
  releaseY = ReYear[n];
  byYear(releaseY);
  //println(ReYear[n]);
  CColor c = new CColor();
  c.setBackground(bgc);
  cp5.get(ScrollableList.class, "ReleaseYear").getItem(n).put("color", c);
  
}

void byYear(String ye){
  showYear = true;
  showLove = false;
  showDance = false;

  String[] yy = split(freleaseDate, ' ');
  filterSong = ftrackes + "--" + yy[2];
  
  //String word = inputValue;
  if(yy[2].equals(ye)){
     fill(255);
     text(filterSong, 50 , height/20 + songX * 15 + 60);
     songX++;
  };
} 