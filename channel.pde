
float bpmToW(float bpm) {
  return bpm/60*2*PI;
}

public class Channel {
  
  float value;
  
  Channel(float value) {
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
  
  SineChannel(float a,float b,float w) {
    super(a);
    this.a= a;
    this.b= b;
    this.w= w;
  }
  
  float getValue() {
    return a + (sin(w*millis()/1000) +1) * (b-a);
  }

}

