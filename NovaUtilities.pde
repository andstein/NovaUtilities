
NovaDisplay display= new NovaDisplay(50,50,10);
Sphere s;

void setup() {
  size(display.getSizeX(),display.getSizeY());
  s= new Sphere(new PVector(10,20,5), 4);
  frameRate(25);
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  s.render();
  display.renderLayers();
}
