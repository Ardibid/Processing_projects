// This class is responsible for making a series of point that virtually walk on the surface of a box
class Walker {
  float posX, posX0, posY0, posY, posZ, posZ0, rate, seed;
  PVector  speed = new PVector (0, 0, 0);
  PVector  loc = new PVector (0, 0, 0);
  int j =15;
  int k =15;
  int l =15;


  int m=1;
  int n=1;
  int o = 0;
  
  // Class initiator 
  Walker(float posX_, float posY_, float posZ_, float seed_, float rate_) {
    posX = posX_;
    posX0=  posX_;
    posY = posY_;
    posY0 = posY_;
    posZ = posZ_;
    posZ0 =posZ_; 
    loc.x = posX;
    loc.y = posY;
    loc.z = posZ;
    rate = rate_;
    seed = seed_;
    // display();
  }


// Main function that call two other functions of the class
  void run() {
    move();
    display();
  }
// Responsible for displaying the points 
  void display() {
    pushMatrix();
    rotation();
    noFill();
    stroke(0, 255, 255);
    strokeWeight(1);
    point (loc.x, loc.y, loc.z);
    popMatrix();
  }

// Responsible for making points stay on the box surface and continue moving
  void move() {
    float x = loc.x;
    float y = loc.y;
    float z = loc.z;
    if (y < 0 || y >=bby) {
      k*=-1;
    }

    if (x >= bbx) {
      if ( z >= bbz) {
        o=0;
        m=-1;
        n=-1;
      } else {
        m=0;
        o = 1;
      }
    }
    if (z >= bbz) {

      if (x <=0) {
        // x = 0;
        m= 0;
        n = 1;
        o=-1;
      }
    }

    if (z <0) {
      m =1;
      n=1;
      o=0;
      loc.x = posX0;
     loc.y = posY0;
      loc.z = posZ0;
    }
    speed.x = rate*m*j*map(noise(seed), 0, 1, -1, 4);
    speed.y = rate*n*k*map(noise(seed+4000), 0, 1, -1, 4);
    speed.z = rate*o*l*map(noise(seed+32768), 0, 1, -1, 4);
    loc.add(speed);

    float  d = -.1;
    loc.x = constrain(loc.x, d, bbx-d);
    loc.y = constrain(loc.y, d, bby-d);
    loc.z = constrain(loc.z, d, bbz-d);
    seed+=.01;
  }
}

