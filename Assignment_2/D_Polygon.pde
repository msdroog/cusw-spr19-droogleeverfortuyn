ArrayList<Polygon> polygons;
ArrayList<Polygon> waterpolygons;
ArrayList<Polygon> parkpolygons;
ArrayList<Polygon> buildingpolygons;
ArrayList<Polygon> parkingpolygons;
ArrayList<Polygon> hospitalpolygons;
ArrayList<Polygon> educationpolygons;

class Polygon{
  
  PShape p; //park polygons
  PShape w; //water polygons
  PShape b; //building polygons
  PShape a; //parking polygons
  PShape h; //hospital polygons
  PShape e; //education polygons
  
  ArrayList<PVector>coordinates;
  
  boolean Water;
  boolean Park;
  boolean Building;
  boolean Parking;
  boolean Hospital;
  boolean Education;
  
  Polygon(){
    coordinates = new ArrayList<PVector>();
  }
  
  Polygon(ArrayList<PVector> coords){
    coordinates = coords;
    makeWaterShape();
    makeParkShape();
    makeBuildingShape();
    makeParkingShape();
    makeHospitalShape();
    makeEducationShape();
  }
  
  void makeWaterShape(){
    w = createShape();
    w.beginShape();
    w.fill(water);
    Water = false;
    w.strokeWeight(.5);
    w.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        w.vertex(screenLocation.x, screenLocation.y);
    }
    w.endShape();
  }
  
    void makeParkShape(){
    p = createShape();
    p.beginShape();
    p.fill(park);
    p.strokeWeight(.5);
    p.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        p.vertex(screenLocation.x, screenLocation.y);
    }
    p.endShape();
  }
  
    void makeBuildingShape(){
    b = createShape();
    b.beginShape();
    b.fill(building);
    b.strokeWeight(.5);
    b.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        b.vertex(screenLocation.x, screenLocation.y);
    }
    b.endShape();
  }
  
    void makeParkingShape(){
    a = createShape();
    a.beginShape();
    a.fill(parking);
    a.strokeWeight(.5);
    a.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        a.vertex(screenLocation.x, screenLocation.y);
    }
    a.endShape();
  }
  
    void makeHospitalShape(){
    h = createShape();
    h.beginShape();
    h.fill(hospital);
    h.strokeWeight(.5);
    h.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        h.vertex(screenLocation.x, screenLocation.y);
    }
    h.endShape();
  }
  
    void makeEducationShape(){
    e = createShape();
    e.beginShape();
    e.fill(education);
    e.strokeWeight(.5);
    e.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        e.vertex(screenLocation.x, screenLocation.y);
    }
    e.endShape();
  }
  
  void draw(){
    if (Water) shape(w, 0, 0);
    if (Park) shape(p, 0, 0);
    if (Building) shape(b, 0, 0);
    if (Parking) shape(a, 0, 0);
    if (Hospital) shape(h, 0, 0);
    if (Education) shape(e, 0, 0);
  }
}
