
float bpmToW(float bpm) {
  return bpm/60*2*PI;
}

public class Channel {
  
  float value;
  
  public Channel(float value) {
    this.value = value;
  }
  
  float getValue() {
    return value;
  }
  
}

public class SineChannel extends Channel {
  
  float a; // min value
  float b; // max value
  float w; // angular frequency
  
  public SineChannel(float a,float b,float w) {
    super(a);
    this.a= a;
    this.b= b;
    this.w= w;
  }
  
  float getValue() {
    return a + (sin(w*millis()/1000) +1) * (b-a);
  }

}

public class OSCChannel extends Channel {
  
  String addrPattern;
  float val;
  int index;
  int maxv;
  
  public OSCChannel(String addrPattern, int index, float initVal, int maxv) {
    super(initVal);
    this.addrPattern = addrPattern;
    this.val = initVal;
    this.maxv = maxv;
    this.index = index;
  }
  
  float getValue() {
    return val*maxv;
  }
  
  void update(OscMessage m) {
     if( m.checkAddrPattern( addrPattern ) ) {
       val = m.get(index).floatValue();
     }
  }

}

