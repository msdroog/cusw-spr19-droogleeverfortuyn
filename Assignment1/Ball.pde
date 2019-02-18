class Ball {
  PVector screenLocation;
  float radius = random(0, height/4);
  float R = random(255);
  float G = random (255);
  float B = random (255);
  float xspeed = random(-10, 10);
  float yspeed = random(-10, 10);
  int numballs;
  
  Ball() {
    screenLocation = new PVector(random(width), random(height));
  }
  
  void drawBall() {
    noStroke(); //no circle outline
    ellipse(screenLocation.x, screenLocation.y, radius, radius);
    fill(R, G, B);
    
    screenLocation.x = screenLocation.x + xspeed;
    screenLocation.y = screenLocation.y + yspeed;
    
    if (screenLocation.x > width) {
      xspeed = -xspeed;
    }
    
     if (screenLocation.x < 0) {
      xspeed = -xspeed;
    }
     if (screenLocation.y > height) {
      yspeed = -yspeed;
    }
     if (screenLocation.y < 0) {
      yspeed = -yspeed;
    }
  
  float xDistance = abs(mouseX - screenLocation.x);
  float yDistance = abs(mouseY - screenLocation.y);
  
     if (xDistance <= 20 && yDistance <= 20) {
       xspeed = 0;
       yspeed = 0;
     }
  }
  
  void drawText() {
    text("number of balls" + numballs + '\n' + " speed in x direction" + xspeed + " speed in y direction" + yspeed, 10, bal + 10);
  }
}
