color poi_fill = color(255,99,71);
color atm = color(255, 255, 0);
//color polygon_fill = color(32, 178, 170); (130, 70, 50), (115, 125, 200)
color road_color = color(195, 195, 210);
color park = color(85, 132, 54);
color water = color(54, 67, 132);
color building = color(19, 174, 164);
color parking = color(115, 125, 200);
color hospital = color(255,99,71);
color education = color(125, 50, 180);
  
void drawInfo(){
  fill(0);
  rect(20, 20, 250, 160);
  textSize(16);
  fill(road_color);
  text("Roads", 25, 40);
  fill(water);
  text("Water", 25, 60);
  fill (park);
  text("Park", 25, 80);
  fill (building);
  text("Building", 25, 100);
  fill (parking);
  text("Parking (press p)", 25, 120);
  fill (hospital);
  text("Hospital (press h)", 25, 140);
  fill (education);
  text("School & University (press e)", 25, 160);
}
