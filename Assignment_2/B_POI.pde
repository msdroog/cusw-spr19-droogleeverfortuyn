ArrayList<POI> pois;

class POI{
  
  PVector coord;
  
  float lat;
  float lon;
  
  boolean School;
  
  String type;
  
  POI(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
  }

  void draw() {
    PVector screenLocation = map.getScreenLocation(coord);
    noFill();
    noStroke();
    if (School) fill(education);
    rect(screenLocation.x -7, screenLocation.y -7, 14, 14);
  }
}
