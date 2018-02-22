// In order to send data between grasshopper and processing I used oscP5 library which let us use osc standard, on the grasshopper side i used Ghowl add-on to receive this data set

void OSC() {
  oscP5 = new OscP5(this, 6882); 
  myBroadcastLocation = new NetAddress("localhost", 6881);  //broadcast to port 6881 and
}


void send_Data() {

  String toSend=""; 
  arrayMsg=new OscMessage("/array");
  toSend+= bbx + "%";
  toSend+= bby + "%";
  toSend+= bbz + "%";

  for (int i = 0; i < p1.size (); i++) {
    PVector temp1 = p1.get(i);
    PVector temp2 = p2.get(i);

    toSend+="{"; 
    toSend+=temp1.x + ",";
    toSend+=temp1.y + ",";
    toSend+=temp1.z + "}";
    toSend+="|"; 
    toSend+="{"; 
    toSend+=temp2.x + ",";
    toSend+=temp2.y + ",";
    toSend+=temp2.z + "}";
    if (i < p1.size ()-1) { 
      toSend+="*";
    }
  }
  arrayMsg.add(toSend);
  oscP5.send(arrayMsg, myBroadcastLocation);
}

