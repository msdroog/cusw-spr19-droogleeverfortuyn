ArrayList<Ball> balls;
float xspeed;
float yspeed;
int numballs;
float bal;

void setup() {
  size(640,360);
  balls = new ArrayList<Ball>();  
  for(int i=0; i<5; i++) {
  Ball b = new Ball();
  balls.add(b);
  Ball bal = balls.get(i);
  }
  
}
    int d = 10;
void draw() {
  background(0);
  for (Ball b: balls) {
    b.drawBall();
    b.drawText();
    //text("number of balls" + numballs + '\n' + " speed in x direction" + xspeed + " speed in y direction" + yspeed, 10, bal + 10);
  }
    //text("number of balls" + numballs + '\n' + " speed in x direction" + xspeed + " speed in y direction" + yspeed, 10, 20);
}

void keyPressed() {
  for(int i=0; i<10; i++) {
    Ball b = new Ball();
    balls.add(b);
    }
}
