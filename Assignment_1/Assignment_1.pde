ArrayList<Ball> balls;

void setup() {
  size(640,360);
  balls = new ArrayList<Ball>();
  
  for(int i=0; i<5; i++) {
  Ball b = new Ball();
  balls.add(b);
  }
  
}

void draw() {
  background(0);
  for (Ball b: balls) {
    b.drawBall();
  }
}