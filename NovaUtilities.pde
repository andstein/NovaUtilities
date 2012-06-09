
NovaDisplay display= new NovaDisplay(50,50,10);
Sphere s;

void setup() {
  size(display.getSizeX(),display.getSizeY());
  s= new Sphere(new Channel(10),new Channel(20),new Channel(5), new SineChannel(4,10,bpmToW(6f)));
  frameRate(25);
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  s.render();
  display.renderLayers();
}
