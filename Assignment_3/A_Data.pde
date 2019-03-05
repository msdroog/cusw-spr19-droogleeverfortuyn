Table CountyBoundary, Blocks, Data;

void loadData(){
  //CountyBoundary = loadTable("data/geometrynodes.csv");
  Blocks = loadTable("data/geometrynodes.csv", "header");
  Data = loadTable("data/geometryattributes.csv", "header");
  println("Data Loaded");
}

void parseData(){
  ArrayList<PVector> coords = new ArrayList<PVector>();
  //  for(int i = 0; i<CountyBoundary.getRowCount(); i++){
  //       float lat = float(CountyBoundary.getString(i, 2));
  //       float lon = float(CountyBoundary.getString(i, 1));
  //       coords.add(new PVector(lat, lon));
  //  }
  // county = new Polygon(coords);
  // county.outline = true;
  // county.makeShape();  
  
  int previd = 0;
  coords = new ArrayList<PVector>();
  for(int i = 0; i<Blocks.getRowCount(); i+=2){
    int shapeid = int(Blocks.getString(i, 0));
       if(shapeid != previd){
           if(coords.size() > 0){
               Polygon poly = new Polygon(coords);
               poly.id = shapeid;
               CensusPolygons.add(poly);
           }
           //clear coords
           coords = new ArrayList<PVector>();
           //reset variable
           previd = shapeid;
       }
       if(shapeid == previd){
         float lat = float(Blocks.getString(i, 2));
         float lon = float(Blocks.getString(i, 1));
         //println(lat, lon);
         coords.add(new PVector(lat, lon));
       }
  }
  
  //Add attribute you want to your polygon (you can add more attributes if you want and look at the Tiger page for more info) 
  //Total household income
  for(int i = 0; i<CensusPolygons.size(); i+=2){
    CensusPolygons.get(i).score = (Data.getFloat(i, "POP_DENSIT") ); //this is ONLY if the IDs are accurate
    CensusPolygons.get(i).colorByScore();
    CensusPolygons.get(i).makeShape();
  }
  

  //Test case for point in Polygon
  //println(county.pointInPolygon(new PVector(118.298, 29.69301)));
  
  println("Data Parsed");
}
