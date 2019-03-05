MercatorMap map;
Raster raster;

void setup(){
  CensusPolygons = new ArrayList<Polygon>();
  size(1200, 800);
  map = new MercatorMap(width, height, 34.8476, 34.6679, 113.4997, 113.8791, 0);
  loadData();
  parseData();
  raster = new Raster(30, 1200, 800);
}

void draw(){
  background(0);
  raster.draw();
  //county.draw();
}
