import ch.ethz.nova.processing.*;

NovaDisplay display= new NovaDisplay(50,50,10);
Sphere s;

void setup() {
  
  size(display.getSizeX(),display.getSizeY()+10);
  s= new Sphere(new Channel(10),new Channel(20),new Channel(5), new SineChannel(0,5,bpmToW(30f)));
  frameRate(25);
  new NOVA(this, 50, 50, 10, false); // 50x50x10 NOVA without wrapping

}

void draw() {
  background(0);
  fill(255);
  strokeWeight(1);
  stroke(128);
  s.render();
  //display.renderLayers();
}
