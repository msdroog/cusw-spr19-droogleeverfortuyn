class Raster{
  //Simple class for a square raster
  float cellSize, w, h;
  int numX, numY;
  PVector start;
  PVector[][] centers;
  float[][] scores;
  int score;
  color fill;
  
  Raster(float _size, float _w, float _h){
    w = _w;
    h = _h;
    numX = int(w/_size);
    numY = int(h/_size);
    cellSize = _size;
    centers = new PVector[numX][numY];
    scores = new float[numX][numY];
    start = new PVector(0, 0);
    generateCenters();
    bucketRasterPolys(CensusPolygons);
  }
  
  void generateCenters(){
    for(int i = 0; i<numX; i++){
      for(int j = 0; j<numY; j++){
        centers[i][j] = new PVector(i*(start.x + cellSize) + cellSize/2, j*(start.y + cellSize) + cellSize/2);
      }
    }
  }
  
  void bucketRasterPolys(ArrayList<Polygon>polys){
    //For now, we're just going to assign each cell a score based on what polygon its center is in 
    //If it isn't in any, then we just give it a score of 0 
    //You can always assign multiple scores, etc 
    //And then combine this with a HeatMap situation, like in another tutorial
    
    for(int i = 0; i<numX; i++){
      for(int j = 0; j<numY; j++){
        scores[i][j] = 250;
        for(int k = 0; k<polys.size();k ++){
          Polygon p = polys.get(k);
          PVector l = centers[i][j];
          if(p.pointInPolygon(map.getGeo(l))){
            println(p.score);
            scores[i][j] = p.score;
            score = int(p.score);
            //println(score);
          }
        }
      }
    }
  }
  
//  // getting the maximum value
//  int getMaxValue(int[] score) {
//    int maxValue = score[0];
//    for (int i = 1; i < scores.length; i++) {
//        if (score[i] > maxValue) {
//            maxValue = score[i];
//            println(maxValue);
//        }
//    }
//    return maxValue;
//}

//// getting the miniumum value
//  int getMinValue(int[] scores) {
//    int minValue = scores[0];
//    for (int i = 1; i < scores.length; i++) {
//        if (scores[i] < minValue) {
//            minValue = scores[i];
//            println(minValue);
//        }
//    }
//    return minValue;

//}
  
  void draw(){
    for(int i = 0; i<numX; i++){
      for(int j = 0; j<numY; j++){
      stroke(0);
      //obviously you could change this to a score situation like the heatmap
      fill(((scores[i][j])/100));
    //      if (scores[i][j] <= 5441) { fill = color(250);
    //}
    //else if (scores[i][j] <= 11398 && scores[i][j] >= 5442) { fill = color(200);
    //}
    //else if (scores[i][j] <= 19864 && scores[i][j] >= 11399) { fill = color(150);
    //}
    //else if (scores[i][j] <= 34669 && scores[i][j] >= 19865) { fill = color(100);
    //}
    //else if (scores[i][j] >= 34670) { fill = color(0);
    //}
    //  fill(fill);
      //fill(255);
      rect(i*(start.x + cellSize), j*(start.y + cellSize), cellSize, cellSize);
      ellipse(centers[i][j].x, centers[i][j].y, 1, 1);
      }
    }
  }

}
