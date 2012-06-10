import java.util.ArrayList;

public class OscSource extends OscP5 {
  
  ArrayList<OscChannel> channels = new ArrayList<OscChannel>();
  
  public OscSource (Object t, int port) {
    super(t, port);
  }
  
  OscChannel newChannel(String addr, int index, float initVal, int maxv) {
    OscChannel c = new OscChannel( addr, index, initVal, maxv );
    channels.add( c );
    return c;
  }
  
  void update( OscMessage m ){
   for (int i=0; i<channels.size(); i++){
     channels.get(i).update( m );
   }
  }
}
