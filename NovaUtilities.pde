import ch.ethz.nova.processing.*;
import oscP5.*;

OscP5 oscP5;

NovaDisplay display= new NovaDisplay(50,50,10);
Sphere s;

OSCChannel osc1;
OSCChannel osc2;

void setup() {
  /* start oscP5, listening for incoming messages at port 10000 */
  oscP5 = new OscP5(this,10000);
  
  size(display.getSizeX(),display.getSizeY()+10);
  osc1 = new OSCChannel("/multi/1",0,0.5,50);
  osc2 = new OSCChannel("/multi/1",1,0.5,50);
  s= new Sphere(osc1,osc2,new Channel(5), new SineChannel(0,5,bpmToW(30f)));
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


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.get(1).floatValue());
  
  osc1.update( theOscMessage );
  osc2.update( theOscMessage );
}
