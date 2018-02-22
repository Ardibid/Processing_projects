//Create the Graphic user interface 
// I used COntrolP5 library to make different bottuns and switches

import controlP5.*;
ControlP5 cp5;
int myColorBackground = color(0, 0, 0);
ControlWindow controlWindow;
public int sliderValue = 40;

void myTextfield(String theValue) {
  println(theValue);
}

void myWindowTextfield(String theValue) {
  println("from controlWindow: "+theValue);
}


void GUI() {

  comments = loadFont("CenturyGothic-12.vlw");
  cp5 = new ControlP5(this);

  Group group = cp5.addGroup("myGroup3")
    .setBackgroundColor(color(0, 64))
      .setBackgroundHeight(150)
        ;

  cp5.addBang("send_Data")
    .setPosition(20, 100)
      .setSize(50, 20)
        .moveTo(group)
          ;

  cp5.addBang("Reset")
    .setPosition(80, 100)
      .setSize(40, 20)
        .moveTo(group)
          ;

  cp5.addSlider("Box Height")
    .setRange(1, 400)
      .setPosition(20, 20)
        .setSize(100, 15)
          .setValue(200)
            .moveTo(group)
              ;
  cp5.addSlider("Box Width")
    .setRange(1, 400)
      .setPosition(20, 40)
        .setSize(100, 15)
          .setValue(200)
            .moveTo(group)
              ;
  cp5.addSlider("Box Depth")
    .setRange(1, 400)
      .setPosition(20, 60)
        .setSize(100, 15)
          .setValue(200)
            .moveTo(group)
              ;
  cp5.addSlider("Track Size")
    .setRange(1, 400)
      .setPosition(20, 80)
        .setSize(100, 15)
          .setValue(20)
            .moveTo(group)
              ;

  // create a new accordion
  accordion = cp5.addAccordion("acc")
    .setPosition(guixpos, 40)
      .setWidth(200)
        .addItem(group)
          ;

  accordion.open(0, 1, 2);

  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.open(0, 1, 2);
    }
  }
  , 'o');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.close(0, 1, 2);
    }
  }
  , 'c');
}



void GUIR() {
  bbx= int(cp5.getController("Box Height").getValue());
  bby= int(cp5.getController("Box Width").getValue());
  bbz= int(cp5.getController("Box Depth").getValue());
  ballTrackSize = int(cp5.getController("Track Size").getValue());
}

