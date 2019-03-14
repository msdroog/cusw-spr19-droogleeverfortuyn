/*  PATHFINDER AND NETWORK ALGORITHMS
 *  Ira Winder, ira@mit.edu
 *  Nina Lutz, nlutz@mit.edu
 *  Coded w/ Processing 3 (Java)
 *
 *  The Main Tab "Tutoiral_3A_Agents" shows an example implementation of 
 *  algorithms useful for finding shortest pathes snapped to a gridded or OSM-based 
 *  network. Explore the various tabs to see how they work.
 *
 *  CLASSES CONTAINED:
 *
 *    Pathfinder() - Method to calculate shortest path between to nodes in a graph/network
 *    Graph() - Network of nodes and wighted edges
 *    Node() - Fundamental building block of Graph()
 *    ObstacleCourse() - Contains multiple Obstacles; Allows editing, saving, and loading of configuration
 *    Obstacle() - 2D polygon that can detect overlap events
 *    MercatorMap() - translate lat-lon to screen coordinates
 *    
 *    Standard GIS shapes:
 *    POI() - i.e. points, representing points of interest, etc
 *    Way() - i.e. lines, representing streets, paths, etc
 *    Polygons() - representing buildings, parcels, etc
 *
 *  FUNDAMENTAL OUTPUT: 
 *
 *    ArrayList<PVector> shortestPath = Pathfinder.findPath(PVector A, PVector B, boolean enable)
 *
 *  CLASS DEPENDENCY TREE: 
 *
 *
 *     POI() / Way()  ->  Node()  ->      Graph()        ->      Pathfinder()  ->  OUTPUT: ArrayList<PVector> shortestPath
 *
 *                                            ^                                        |
 *                                            |                                        v
 *
 *     Polygon()  ->  Obstacle()  ->  ObstacleCourse()                             Agent()                                   
 *
 */

PGraphics b;

// Make a blank map 
MercatorMap map;
PImage background;

// Declare GIS-style Objects
ArrayList<POI> pois;
ArrayList<Way> ways; 
ArrayList<Polygon> polygons;
ArrayList<Polygon> waterpolygons;
ArrayList<Polygon> buildingspolygon;

boolean incubator = true;

// A function to contain model initialization
void initModel() {
  
  /* Step 1: Initialize Network Using ONLY ONE of these methods */
  //randomNetwork(0.5); // a number between 0.0 and 1.0 specifies how 'porous' the network is
  waysNetwork(ways);
  //randomNetworkMinusBuildings(0.1, polygons); // a number between 0.0 and 1.0 specifies how 'porous' the network is
  
  /* Step 2: Initialize Paths Using ONLY ONE of these methods */
  //randomPaths(1);
  poiPaths(1);
  
  /* Step 3: Initialize Population */
  initPopulation(30*paths.size());
}

void setup() {
  size(900, 650);
  
  b = createGraphics(width, height);
  
  /* Intialize your data structures early in setup */
  map = new MercatorMap(width, height, 34.8044, 34.7820, 113.7771, 113.8245, 0); // Coordinates pulled from OSM Export
  polygons = new ArrayList<Polygon>();
  waterpolygons = new ArrayList<Polygon>();
  buildingspolygon = new ArrayList<Polygon>();
  ways = new ArrayList<Way>();
  pois = new ArrayList<POI>();
  
  /* Load in and parse your data in setup -- don't want to do this every frame! */
  loadData();
  parseData();
  
  /* Initialize our model and simulation */
  initModel();
  
  background(0);
  
  b.beginDraw();
  
  for(int i = 0; i<waterpolygons.size(); i++){
    waterpolygons.get(i).draw();
    waterpolygons.get(i).drawGraphic();
  }
  for(int i = 0; i<buildingspolygon.size(); i++){
    buildingspolygon.get(i).draw();
    buildingspolygon.get(i).drawGraphic();
  }
  
  b.endDraw();
  
  
  background(0);
  drawGISObjects();
  image(b, 0, 0);
  
  
  //University labels
  fill(34, 150, 41);
  text("Henan Agricultural University", 650, 150);
  text("Henan Police College", 670, 350);
  text("Henan University of Economics and Law", 600, 550);
  text("Henan University of Traditional Chinese Medicine", 330, 600);
  text("North China University of Water Resources and Hydropower", 20, 620);
  text("Zhengzhou Aviation Industry" + '\n' + "Management College", 20, 350);
  text("Henan Vocational and Technical College", 20, 200);
  text("Henan Economic and Trade Vocational College", 250, 50);
  text("Innovation Island", 370, 350);
  
  fill(255);
  text("Press i to place incubators", 10, 20);
  text("Press g to place interactive games", 10, 30);
  
}

void draw() {
  
  //image(b, 0, 0);
  
  /* background image from OSM */
  //image(background, 0, 0);
  //drawGISObjects();
  
  /*  Displays the Graph in grayscale */
  //tint(255, 75); // overlaid as an image
  //image(network.img, 0, 0);
  
  /*  Displays the path last calculated in Pathfinder.
   *  The results are overridden everytime findPath() is run.
   *  FORMAT: display(color, alpha)
   */
  //boolean showVisited = true;
  //finder.display(255, 200, showVisited);
  
  /*  Displays the path properties.
   *  FORMAT: display(color, alpha)
   */
  //for (Path p: paths) {
  //  p.display(100, 100);
  //}
  
  /*  Update and Display the population of agents
   *  FORMAT: display(color, alpha)
   */
  boolean collisionDetection = true;
  for (Agent p: people) {
    p.update(personLocations(people), collisionDetection);
    p.display(#FFffff,20);
  }
  
  
  if (incubator == true) {
    fill(#163693,255);
    rect(10, 35, 140, 15);
    fill(255,0,0);
    text("Placing Incubators", 10, 45);
  }
  if (incubator == false) {
    fill(#163693,255);
    rect(10, 35, 140, 15);
    fill(0,255,0);
    text("Placing Interactive Games", 10, 45);
  }
  
}

//void mouseMoved(){
//  if (incubator == true){
//    fill(255, 0, 0);
//    noStroke();
//    rect(mouseX, mouseY, 20, 20);
//  }
//  if (incubator == false){
//    fill(0, 255, 0);
//    noStroke();
//    ellipse(mouseX, mouseY, 20, 20);
//  }
//}

void mousePressed(){
  if (incubator == true){
    fill(255, 0, 0);
    noStroke();
    rect(mouseX, mouseY, 20, 20);
  }
  if (incubator == false){
    fill(0, 255, 0);
    noStroke();
    ellipse(mouseX, mouseY, 20, 20);
  }
}

void keyReleased() {
    if (key == 'i') {
      incubator = true;
    }
    if (key == 'g') {
      incubator = false;
    }
}
