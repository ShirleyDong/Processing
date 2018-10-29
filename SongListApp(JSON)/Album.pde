class Album{
  private int id;
  private int volume;
  private String releaseDate;
  private String artists;
  private String name;
  private String spotifyIDs;
  private double tempo;
  private double valence;
  private double danceability;
  private String tracks;
  
  Album(int iid,int ivolume, String ireleaseDate, String iname, String iartists, String ispotifyIDs, 
         double itempo, double ivalence, double idanceability, String itracks)
   {
    this.id = iid;
    this.volume = ivolume;
    this.releaseDate = ireleaseDate;
    this.name = iname;
    this.artists = iartists;
    this.spotifyIDs = ispotifyIDs;
    this.tempo = itempo;
    this.valence = ivalence;
    this.danceability = idanceability;
    this.tracks = itracks;
  }
  
}