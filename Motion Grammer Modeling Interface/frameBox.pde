// Draw the cube borders in space


void frameBox() {

  pushMatrix();
  rotation();
  // translate(bbx/2, bbx/2, bbx/2);
  //rect(0, 0, bbx, bbx);
  PVector oo =  new PVector (0, 0, 0);
  PVector ox = new PVector(100, 0, 0);
  PVector oy = new PVector(0, 100, 0);
  PVector oz =  new PVector(0, 0, 100);
  fill(150);
  line(0, 0, 0, 100, 0, 0);
  line(0, 0, 0, 0, 100, 0);
  line(0, 0, 0, 0, 0, 100);
  fill(200, 255, 255);
  text ("X", 100, 0, 0);
  text("Y", 0, 100, 0);
  text ("Z", 0, 0, 100);

  noFill();
  stroke(200, 255, 0);
  strokeWeight(2);
  translate(bbx/2, bby/2, bbz/2);
  box(bbx, bby, bbz);
  popMatrix();
}


// Draw the connecting lines between the points
void drawLine() {
  pushMatrix();
  rotation();
  noFill();
  strokeWeight(1);
  beginShape();
  Walker ball0 = myBalls.get(0);
  vertex(ball0.loc.x, ball0.loc.y, ball0.loc.z);
  for (int z = 0; z < myBalls.size (); z++) {
    Walker ballz = myBalls.get(z);
    curveVertex( ballz.loc.x, ballz.loc.y, ballz.loc.z);
  }
  ball0 = myBalls.get(myBalls.size()-1);
  vertex(ball0.loc.x, ball0.loc.y, ball0.loc.z);
  endShape();
  popMatrix();
}

