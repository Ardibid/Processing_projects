

void setup() {
  background(125);
  size(800, 800, P3D);
  smooth();

  // Setup Functions
  GUI();
  OSC();
  ballGenerator();
}


void draw() {
  background(125);
  frameBox();
  GUIR();
  ballRunner();
  helpTexts();
  ballTracker(index, index+1);
  ballTrackShow();
  disCrv();
  if (curves) {
    drawLine();
  }
  roolingCurves();
}

