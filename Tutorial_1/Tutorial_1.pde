//Step 1: Create/Allocate memory for your Person
ArrayList<Person> people;
ArrayList<Connection> frands;

// Run once
void setup(){
  size(800, 700);
  initialize();
}

//Runs over and over at 60FPS
void draw() {
  
  background(0);
  
  //fill(255);
  //ellipse(mouseX, mouseY, 50, 10*mouseY/100);
  
  for (Person p: people) {
    p.update(); //update location if selected
    p.drawPerson();
  }
  
    for (Connection c: frands) {
    c.draw();
  }

}

void mousePressed () {
  
  for (Person p : people) {
    if (p.checkSelection()){ // only slects when mose is clicked
      break;
    }
  }
}

void mouseReleased() {
  for (Person p : people) {
    p.locked = false; // only slects when mose is clicked
  }
}

void keyPressed(){
  initialize();
}

void initialize() {
  people = new ArrayList<Person>();
  frands = new ArrayList<Connection>();
  
  for(int i=0; i<10; i++) {
  Person p = new Person("Person" + i, str(int(random(1, 5))));
  p.randomLocation();
  people.add(p);
  }
  
  //who are frands
  for(Person origin: people) {
    for(Person destination: people) {
      //is peron referencing themself
      if (!origin.name.equals(destination.name)) {
        //are orgin and dest same year?
        if (origin.year.equals(destination.year)){
        frands.add(new Connection(origin, destination, "frands"));
        }
      }
    }
  }
  println(frands.size());
}
