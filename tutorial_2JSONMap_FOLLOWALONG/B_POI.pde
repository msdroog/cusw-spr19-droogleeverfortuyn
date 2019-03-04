ArrayList<POI> pois;

class POI{
  PVector coord;
  
  float lat;
  float lon;
  
  boolean ATM;
  
  String type;
  
  POI(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
  }
  
  void draw() {
    PVector screenLocation = map.getScreenLocation(coord);
    fill(poi_fill);
    noStroke();
    if(ATM) fill(atm);
    ellipse(screenLocation.x, screenLocation.y, 6, 6);
  }
}
