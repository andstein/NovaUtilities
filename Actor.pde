
public class Actor {
  // Any repeatedly drawn object
  
  long deadTime;
  
  public Actor(float life){
    deadTime = millis()*1000*life;
  }
  
  void render(){
  }
  
  boolean checkAge(){
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
