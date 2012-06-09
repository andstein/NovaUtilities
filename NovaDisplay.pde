
public class NovaDisplay {
  
  public int i,j,k;
  
  NovaDisplay(int i,int j,int k) {
    this.i= i; // x
    this.j= j; // y
    this.k= k; // z
  }
  
  int getSizeX() {
    return k*i;
  }
  int getSizeY() {
    return j+k;
  }
  
  int getX(PVector v) {
    return (int) (v.x+ v.z*i);
  }
  int getY(PVector v) {
    return (int) (v.y);
  }
  
  void renderLayers() {
    stroke(150);
    for(int a=1; a<k; a++)
      line(a*i,0,a*i,j);
    line(0,i,width,i);
  }
  
}
