JSONObject example;
JSONArray features;
JSONObject wholeArea;

void loadData(){
  background = loadImage("data/background.png");
  background.resize(width, height);
  
  example = loadJSONObject("data/map.json");
  features = example.getJSONArray("features");
}

void parseData(){
  
  for(int i = 0; i< features.size(); i++){
    //Idenitfy 3 main things; the properties, geometry, and type 
    String type = features.getJSONObject(i).getJSONObject("geometry").getString("type");
    JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
    JSONObject properties =  features.getJSONObject(i).getJSONObject("properties");
    String amenity = properties.getJSONObject("tags").getString("amenity");
    String natural = properties.getJSONObject("tags").getString("natural");
    String leisure = properties.getJSONObject("tags").getString("leisure");
    String building = properties.getJSONObject("tags").getString("building");
    String dataAmenity = properties.getJSONObject("tags").getString("amenity");
    String dataNatural = properties.getJSONObject("tags").getString("natural");
    String dataLeisure = properties.getJSONObject("tags").getString("leisure");
    String dataBuilding = properties.getJSONObject("tags").getString("building");
    
    if(dataAmenity != null) amenity = dataAmenity;
    else amenity = "";
    if(dataNatural != null) natural = dataNatural;
    else natural = "";
    if(dataLeisure != null) leisure = dataLeisure;
    else leisure = "";
    if(dataBuilding != null) building = dataBuilding;
    else building = "";
    
    if(type.equals("Point")){
      //create new POI
      float lat = geometry.getJSONArray("coordinates").getFloat(1);
      float lon = geometry.getJSONArray("coordinates").getFloat(0);
      POI poi = new POI(lat, lon);
      poi.type = amenity;
      if(amenity.equals("school")) poi.School = true;
      pois.add(poi);
    }
    
    if(type.equals("Polygon")){
      ArrayList<PVector> coords = new ArrayList<PVector>();
      //get the coordinates and iterate through them
      JSONArray coordinates = geometry.getJSONArray("coordinates").getJSONArray(0);
      for(int j = 0; j<coordinates.size(); j++){
        float lat = coordinates.getJSONArray(j).getFloat(1);
        float lon = coordinates.getJSONArray(j).getFloat(0);
        PVector coordinate = new PVector(lat, lon);
        coords.add(coordinate);
      }

      Polygon poly = new Polygon(coords);
      if(natural.equals("water")) {
        poly.Water = true;
        waterpolygons.add(poly);
       }
      if(leisure.equals("park")) {
        poly.Park = true;
        parkpolygons.add(poly);
      }
      if(building.equals("") == false && amenity.equals("parking") == false && amenity.equals("school") == false && amenity.equals("university") == false) {
        poly.Building = true;
        buildingpolygons.add(poly);
      }
      if(amenity.equals("parking")) {
        poly.Parking = true;
        parkingpolygons.add(poly);
      }
      if(amenity.equals("hospital")) {
        poly.Hospital = true;
        hospitalpolygons.add(poly);
      }
      
      if(amenity.equals("school") || amenity.equals("university")) {
        poly.Education = true;
        educationpolygons.add(poly);
        println(educationpolygons.size());
      }
    }
    
    if(type.equals("LineString")){
      ArrayList<PVector> coords = new ArrayList<PVector>();
      //get the coordinates and iterate through them
      JSONArray coordinates = geometry.getJSONArray("coordinates");
      for(int j = 0; j<coordinates.size(); j++){
        float lat = coordinates.getJSONArray(j).getFloat(1);
        float lon = coordinates.getJSONArray(j).getFloat(0);
        //Make a PVector and add it
        PVector coordinate = new PVector(lat, lon);
        coords.add(coordinate);
      }
      //Create the Way with the coordinate PVectors
      Way way = new Way(coords);
      ways.add(way);
    }
  }
 }
