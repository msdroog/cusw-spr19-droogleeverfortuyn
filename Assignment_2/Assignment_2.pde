/*
Template for Assignment 2 for 11.S195 Spring 2019 
Nina Lutz, nlutz@mit.edu 

This template is just a suggested structure but feel free to modify it, use code from class, etc
*/

MercatorMap map;
PImage background;

void setup(){
  size(1000, 650);
  
  map = new MercatorMap(width, height, 34.7921, 34.7530, 113.6879, 113.7677, 0);
  polygons = new ArrayList<Polygon>();
  waterpolygons = new ArrayList<Polygon>();
  parkpolygons = new ArrayList<Polygon>();
  buildingpolygons = new ArrayList<Polygon>();
  parkingpolygons = new ArrayList<Polygon>();
  hospitalpolygons = new ArrayList<Polygon>();
  educationpolygons = new ArrayList<Polygon>();
  ways = new ArrayList<Way>();
  pois = new ArrayList<POI>();
  
  loadData();
  parseData();
}

void draw(){
  image(background, 0, 0);
  fill(0, 120);
  rect(0, 0, width, height);
  
  for(int i = 0; i<ways.size(); i++){
    ways.get(i).draw();
  }
  
  //Draw all polygons 
  for(int i = 0; i<waterpolygons.size(); i++){
    waterpolygons.get(i).draw();
  }
  
  for(int i = 0; i<parkpolygons.size(); i++){
    parkpolygons.get(i).draw();
  }
  
  for(int i = 0; i<buildingpolygons.size(); i++){
    buildingpolygons.get(i).draw();
  }
  
  drawInfo();
}
  
void keyPressed(){
  if (key == 'p') {
    for(int i = 0; i<parkingpolygons.size(); i++){
      parkingpolygons.get(i).draw();
    }
  }
  
  if (key == 'h') {
    for(int i = 0; i<hospitalpolygons.size(); i++){
      hospitalpolygons.get(i).draw();
    }
  }
  
  if (key == 'e') {
    for(int i = 0; i<educationpolygons.size(); i++){
      educationpolygons.get(i).draw();
    }
    for(int i = 0; i<pois.size(); i++){
    pois.get(i).draw();
  }
  }
}
