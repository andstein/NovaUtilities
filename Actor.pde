
public class Actor {
  // Any repeatedly drawn object
  
  int deadTime;
  
  public Actor(float life){
    deadTime = millis()+int(1000*life);
    if (life == 0)
      deadTime = -1; // workaround for infinite lifespan
  }
  
  void render(){
  }
  
  boolean checkAge(){
    if (deadTime < 0)
      return true;
    return ( deadTime < millis() );
  }
  
  /*
  possible to include:
  - lifetime (conversion to parent object?)
  - x
  - y
  - z
  - color
  
  */
}
