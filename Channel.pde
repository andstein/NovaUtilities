
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

public class LinChannel extends Channel {
  
  float start; // start value
  float end; // end value
  float duration; // transition duration
  int startMillis; // start
  
  public LinChannel(float start,float end,float duration) {
    super(0);
    this.start= start;
    this.end= end;
    this.duration= duration;
    this.startMillis = millis();
  }
  
  float getValue() {
    return start + (millis()-startMillis)/1000.0/duration*(end-start);
  }

}


public class OscChannel extends Channel {
  
  String addrPattern;
  float val;
  int index;
  int maxv;
  
  public OscChannel(String addrPattern, int index, float initVal, int maxv) {
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

