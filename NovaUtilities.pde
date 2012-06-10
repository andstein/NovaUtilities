import ch.ethz.nova.processing.*;
import oscP5.*;

OscSource ipad;
ArrayList<Actor> actors;
NovaDisplay display = new NovaDisplay(50,50,10);

Sphere r,g,b;

void setup() {
  /* start oscP5, listening for incoming messages at port 10000 */
  ipad = new OscSource(this,8000);
  ipad.plug(this, "newDrop", "/spheres/multi/1");
  actors = new ArrayList<Actor>();
  
  size(display.getSizeX(),display.getSizeY());
  actors.add( new Sphere(  ipad.newChannel("/spheres/r/xy",1,0.5,50),
                  ipad.newChannel("/spheres/r/xy",0,0.5,50), 
                  ipad.newChannel("/spheres/r/h",0,0.5,10),
                  ipad.newChannel("/spheres/r/opacity",0,0.5,10) ) );
                  
  actors.add( new Sphere(  ipad.newChannel("/spheres/g/xy",1,0.5,50),
                  ipad.newChannel("/spheres/g/xy",0,0.5,50), 
                  ipad.newChannel("/spheres/g/h",0,0.5,10),
                  ipad.newChannel("/spheres/g/opacity",0,0.5,10) ) );
                  
  actors.add( new Sphere(  ipad.newChannel("/spheres/b/xy",1,0.5,50),
                  ipad.newChannel("/spheres/b/xy",0,0.5,50), 
                  ipad.newChannel("/spheres/b/h",0,0.5,10),
                  ipad.newChannel("/spheres/b/opacity",0,0.5,10) ) );
               
                  
  frameRate(25);
  new NOVA(this, 50, 50, 10, false); // 50x50x10 NOVA without wrapping

}

void draw() {
  background(0);
  strokeWeight(1);
  //stroke(128);
  noStroke();
  fill(255);
  
  for (int i=0; i<actors.size(); i++){
    actors.get(i).render();
  }
   
  //display.renderLayers();
}

public void newDrop(float x, float y) { // called whenever a message at /spheres/multi arrives
  
  actors.add(
    new Sphere(
      new Channel(x*50),
      new Channel(y*50),
      new LinChannel(-5, 15, 2.0),
      new Channel(5)
    )
  );
  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  
  /*
  print(" OSC: "+theOscMessage.addrPattern());
  println(" = "+theOscMessage.get(0).floatValue());
  */
  
  ipad.update( theOscMessage );
}
