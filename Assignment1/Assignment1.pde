ArrayList<Ball> balls;
float xspeed;
float yspeed;
int numballs;

void setup() {
  size(640,360);
  balls = new ArrayList<Ball>();  
  for(int i=0; i<5; i++) {
  Ball b = new Ball();
  balls.add(b);
  numballs = i + 1;
  }
  
}

void draw() {
  background(0);
  for (Ball b: balls) {
    b.drawBall();
    b.drawText();
  }
}

void keyPressed() {
  for(int i=0; i<10; i++) {
    Ball b = new Ball();
    balls.add(b);
    numballs += 1;
    }
}
