
public class Sphere
{
  
  Channel x,y,z,r;
  
  Sphere(Channel x,Channel y,Channel z,Channel r)  {
    this.x= x;
    this.y= y;
    this.z= z;
    this.r= r;
  }
  
  public void render() {
    ellipseMode(CENTER);
    for(int k=0; k<display.k; k++) {
      float x= this.x.getValue();
      float y= this.y.getValue();
      float z= this.z.getValue();
      float r= this.r.getValue();
      
      float kr= sqrt(max( r*r-(z-k)*(z-k) ,0));
      PVector v= new PVector( x,y,k );
//      print(kr + "\n");
      ellipse(display.getX(v),display.getY(v),kr*2,kr*2); // dimensions in width and height, not radius!
    }
  }
}


