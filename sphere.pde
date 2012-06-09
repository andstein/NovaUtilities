
public class Sphere
{
  
  PVector c;
  float r;
  
  Sphere(PVector center,float radius) {
    this.c= center;
    this.r= radius;
  }
  
  public void render() {
    ellipseMode(CENTER);
    for(int k=0; k<display.k; k++) {
      float kr= sqrt(max( r*r-(c.z-k)*(c.z-k) ,0));
      PVector v= new PVector( c.x,c.y,k );
//      print(kr + "\n");
      ellipse(display.getX(v),display.getY(v),kr,kr);
    }
  }
}


