class Incubator {
  PVector loc;
  float l, w, h; // length, width, and height
  color col;
  int DIAM = 10;
  float MIN_RANGE = 0.5*75;  // ft
  float MAX_RANGE = 0.5*450; // ft
  
  Incubator() {
    loc = new PVector(0, 0);
    l = DIAM;
    w = DIAM;
    h = DIAM;
    col = #E0115F;
  }
  
  Incubator(float x, float y) {
    loc = new PVector(x, y);
    l = DIAM;
    w = DIAM;
    h = DIAM;
    col = #E0115F;
  }
  
  void randomize(float x_max, float y_max, float l_max, float w_max, float d_min, float d_max) {
    loc.x = random(x_max + d_max/2, x_max + l_max - d_max/2);
    loc.y = random(y_max + d_max/2, y_max + w_max - d_max/2);
    //col = color(random(100, 200), 255, 255);
  }
  
  void randomize(float x_max, float y_max, float d_min, float d_max) {
    loc.x = random(d_max/2, x_max - d_max/2);
    loc.y = random(d_max/2, y_max - d_max/2);
    //col = color(random(100, 200), 255, 255);
  }
  
  //// Determines if a nearby person is being detected by sensor
  //boolean detect(PVector pos, boolean currentlyReading) {
  //  PVector d = new PVector(pos.x-loc.x, pos.y-loc.y);
  //  float distance = d.mag();
  //  boolean detect = false;
  //  if (distance > MAX_RANGE) {
  //    detect = false;
  //  } else if (currentlyReading) {
  //    detect = true;
  //  } else if (distance <= MIN_RANGE) {
  //    detect = true;
  //  } else if (distance <= MAX_RANGE && distance > MIN_RANGE) {
  //    float probability =  pow(1.0 - (distance - MIN_RANGE) / (MAX_RANGE - MIN_RANGE), 3);
  //    if (random(1.0) < probability) {
  //      detect = true;
  //    } else {
  //      detect = false;
  //    }
  //  }
  //  return detect;
  //}
  
  void draw(){
    fill(col);
    noStroke();
    ellipse(mouseX, mouseY, DIAM, DIAM);
  }
}


class InteractiveGame {
  PVector loc;
  float l, w, h; // length, width, and height
  color col;
  int DIAM = 10;
  float MIN_RANGE = 0.5*75;  // ft
  float MAX_RANGE = 0.5*450; // ft
  
  InteractiveGame() {
    loc = new PVector(0, 0);
    l = DIAM;
    w = DIAM;
    h = DIAM;
    col = #E0115F;
  }
  
  InteractiveGame(float x, float y) {
    loc = new PVector(x, y);
    l = DIAM;
    w = DIAM;
    h = DIAM;
    col = #E0115F;
  }
  
  void randomize(float x_max, float y_max, float l_max, float w_max, float d_min, float d_max) {
    loc.x = random(x_max + d_max/2, x_max + l_max - d_max/2);
    loc.y = random(y_max + d_max/2, y_max + w_max - d_max/2);
    //col = color(random(100, 200), 255, 255);
  }
  
  void randomize(float x_max, float y_max, float d_min, float d_max) {
    loc.x = random(d_max/2, x_max - d_max/2);
    loc.y = random(d_max/2, y_max - d_max/2);
    //col = color(random(100, 200), 255, 255);
  }
  
  // Determines if a nearby person is being detected by sensor
  boolean detect(PVector pos, boolean currentlyReading) {
    PVector d = new PVector(pos.x-loc.x, pos.y-loc.y);
    float distance = d.mag();
    boolean detect = false;
    if (distance > MAX_RANGE) {
      detect = false;
    } else if (currentlyReading) {
      detect = true;
    } else if (distance <= MIN_RANGE) {
      detect = true;
    } else if (distance <= MAX_RANGE && distance > MIN_RANGE) {
      float probability =  pow(1.0 - (distance - MIN_RANGE) / (MAX_RANGE - MIN_RANGE), 3);
      if (random(1.0) < probability) {
        detect = true;
      } else {
        detect = false;
      }
    }
    return detect;
  }
  
  void draw(){
    fill(col);
    noStroke();
    ellipse(mouseX, mouseY, DIAM, DIAM);
  }
}
