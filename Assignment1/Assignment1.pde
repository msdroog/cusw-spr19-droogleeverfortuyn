ArrayList<Ball> balls;
float xspeed;
float yspeed;
int numballs;
int stopballs;

void setup() {
  size(640,360);
  balls = new ArrayList<Ball>();  
  for(int i=0; i<10; i++) {
  Ball b = new Ball();
  balls.add(b);
  numballs = i + 1;
  }
  
}

void draw() {
  background(0);
  for (Ball b: balls) {
    b.drawBall();
    //b.drawText();
  }
  
  fill(255);
  rect(0, 0, 400, 20);
  fill(0);
  text("Number of balls: " + numballs + " of which " + stopballs + " have been stopped. ", 10, 10);
}

void keyPressed() {
  for(int i=0; i<10; i++) {
    Ball b = new Ball();
    balls.add(b);
    numballs += 1;
    }
}
