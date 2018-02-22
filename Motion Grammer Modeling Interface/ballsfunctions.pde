void ballGenerator() {
  for (int i = 0; i < n; i++) {
    Walker thisBall = new Walker  (0, random(5, bby), 0, random(0, 5000), rate);
    myBalls.add(thisBall);
    if (n == 0) {  
      PVector p = new PVector (thisBall.loc.x, thisBall.loc.y, thisBall.loc.z);
      p1.add(p);
    }
    if (n == 1) {  
      PVector p = new PVector (thisBall.loc.x, thisBall.loc.y, thisBall.loc.z);
      p2.add(p);
    }
  }
}

void ballRunner() {

  for (int i = 0; i < myBalls.size (); i++) {
    Walker thisBall = myBalls.get(i);
    thisBall.run();
  }
}


void ballTracker(int i, int j) {
  if (myBalls.size () >=index+1) {
    Walker tb =   myBalls.get(i);
    Walker thisBall = new Walker (tb.loc.x, tb.loc.y, tb.loc.z, tb.rate, tb.seed);
    ballTrack0.add(thisBall);
    if (ballTrack0.size()> ballTrackSize) {
      ballTrack0.remove(0);
    }

    tb =   myBalls.get(j);
    thisBall = new Walker (tb.loc.x, tb.loc.y, tb.loc.z, tb.rate, tb.seed);
    ballTrack1.add(thisBall);
    if (ballTrack1.size()> ballTrackSize) {
      ballTrack1.remove(0);
    }
  }
}


void ballTrackShow() {
  float c =0;
  float k = 0.2;
  for (int j = 0; j < ballTrack0.size (); j++) {
    Walker disBall = ballTrack0.get(j);
    disBall.display();
    pushMatrix();
    translate (guixpos, guimatrixYpos);
    strokeWeight(2);
    if (c > 255 || c < 0) {
      k *=-1;
    }
    c += k;
    stroke(0, 255-c, c);
    point(map(disBall.loc.x, 0, bbx, 0, bbx/2), map(disBall.loc.y, 0, bby, 0, bby/2));
    strokeWeight(1);
    stroke(255, 255, 0);
    rect(0, 0, bbx/2, bby/2);
    translate(0, bby/2 +30);

    if (c > 255 || c < 0) {
      k *=-1;
    }
    c += k;
    stroke(0, 255-c, c);
    strokeWeight(2);
    point(map(disBall.loc.y, 0, bbx, 0, bbx/2), map(disBall.loc.z, 0, bby, 0, bby/2));
    stroke(255, 255, 0);
    strokeWeight(1);
    rect(0, 0, bbx/2, bbz/2);
    popMatrix();
    stroke(0, 255, 255);
  }

  for (int j = 0; j < ballTrack1.size (); j++) {
    Walker disBall = ballTrack1.get(j);
    disBall.display();
  }


  pushMatrix();
  translate (guixpos, guimatrixYpos);
  translate( 0, bby/2 + guitextdist);
  fill(255);
  text("XY Plane View", 0, 0);
  translate(0, bbz/2 + 2*guitextdist);
  text("YZ Plane View", 0, 0);
  noFill();
  popMatrix();
} 

void disCrv() {
  pushMatrix();
  rotation();
  noFill();
  strokeWeight(2);
  stroke(0, 255, 255);
  beginShape();
  Walker ballZ = ballTrack0.get(0);
  vertex(ballZ.loc.x, ballZ.loc.y, ballZ.loc.z);
  for (int z = 0; z < ballTrack0.size (); z++) {
    Walker ballz = ballTrack0.get(z);
    stroke(0, 255, 255, z);
    curveVertex( ballz.loc.x, ballz.loc.y, ballz.loc.z);
    //  println(ballz.loc.z+"-"+ballz.loc.y );
  }
  ballZ = ballTrack0.get(ballTrack0.size()-1);
  vertex(ballZ.loc.x, ballZ.loc.y, ballZ.loc.z);
  endShape();


  beginShape();
  ballZ = ballTrack1.get(0);
  vertex(ballZ.loc.x, ballZ.loc.y, ballZ.loc.z);
  for (int z = 0; z < ballTrack1.size (); z++) {
    Walker ballz = ballTrack1.get(z);
    stroke(0, 255, 255, z);
    curveVertex( ballz.loc.x, ballz.loc.y, ballz.loc.z);
    // println(ballz.loc.z+"-"+ballz.loc.y );
  }
  ballZ = ballTrack1.get(ballTrack0.size()-1);
  vertex(ballZ.loc.x, ballZ.loc.y, ballZ.loc.z);
  endShape();


  popMatrix();
}


void roolingCurves() {
  for (int k = 0; k < ballTrack1.size (); k++) {
    Walker b1 = ballTrack0.get(k);
    Walker b2 = ballTrack1.get(k);
    pushMatrix();
    rotation();
    float c1 = map(k, 0, ballTrack1.size (), 0, 255);
    stroke(0, 255, 255, c1);
    strokeWeight(1);
    PVector p1_ = new PVector ( b1.loc.x, b1.loc.y, b1.loc.z);
    p1.add(p1_);
    PVector p2_ = new PVector ( b2.loc.x, b2.loc.y, b2.loc.z);
    p2.add(p2_);
    line(b1.loc.x, b1.loc.y, b1.loc.z, b2.loc.x, b2.loc.y, b2.loc.z);
    popMatrix();
    if (p1.size()> ballTrackSize) {
      p1.remove(0);
      p2.remove(0);
    }
    //  PVector p1= new PVector (b1.loc.x,b1.loc.y,b1.loc.z);
  }
}


void Reset () {
  int size2 =  ballTrack0.size();
  for (int m = 0; m < size2; m++) {
    ballTrack0.remove(0);
    ballTrack1.remove(0);
    p1.remove(0);
    p2.remove(0);
  }
}

