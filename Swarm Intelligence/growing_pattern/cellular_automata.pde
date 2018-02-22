class cellularAutomata
{
  int size, index;
  boolean condition;
  Vec3D loc;
  Vec3D moveVec = new Vec3D (int(random(-2, 2))*cellSize, int(random(-2, 2))*cellSize, 0);  


  cellularAutomata (Vec3D _loc, int _size, boolean _condition) {
    loc = _loc;
    size= _size;
    condition = _condition;
  }




  void run(int _index) {
    index = _index;

    //moveCell();
    //tendency();
    //growth();
    elliminate();
    render(index);
  }



  void render(int _index) {
    int i = _index;
    int counter = cells.size();
    float opacity  = map (i, 0, cells.size(), 50, 255);
    noStroke();
    if (condition == true) {
      strokeWeight(5);
      stroke(0, 255, 255, opacity/2);    
      fill (0, 255, 255, opacity);
      polygon(loc.x, loc.y, size/2, 6);
      //ellipse(loc.x, loc.y, size, size);
    }
  }





  void growth() {
    int nc =0;
    int xGrowthVec = int(random(-2, 2))*cellSize;
    if (xGrowthVec ==0 ) {
      xGrowthVec ++;
    }

    int yGrowthVec = int(random(-2, 2))*cellSize;
    if (yGrowthVec ==0 ) {
      yGrowthVec ++;
    }
    Vec3D growthVec = new Vec3D (xGrowthVec, yGrowthVec, 0);
    growthVec.addSelf(loc);
    cellularAutomata newCell = new cellularAutomata (growthVec, int(random(cellSize*.8, cellSize*1.2)), true);
    //cells.add(newCell);

    for (int i=0 ; i < cells.size(); i ++) {
      float distance = loc.distanceTo(newCell.loc);
      if ((distance < .9* cellSize)) {
        nc ++;
      }
    }
    if ( nc < 1 ) {
      cells.add(newCell);
    }
  }


  void setInitialColor() {
    condition = true;
  }

  void tendency() {
    for (int i=0 ; i < cells.size(); i ++) {

      cellularAutomata other =  (cellularAutomata) cells.get(i);
      if (other.condition == true) {
        float distance = loc.distanceTo(other.loc);
        if ((distance < 10 * cellSize) && (distance > 2*cellSize)) {
          Vec3D moveVec_ = loc.sub(other.loc);
          moveVec_.scaleSelf(0.02);
          moveVec.addSelf( moveVec_);
        }
        if ( (distance < 10*cellSize)) {
          moveVec.scaleSelf(-.1);
        }
      }
    }
  }


  void elliminate() {
    for (int i=0 ; i < cells.size(); i ++) {
      cellularAutomata other =  (cellularAutomata) cells.get(i);
      if (other.condition == true) {
        float distance = loc.distanceTo(other.loc);
        if ((distance <  cellSize) && (distance != 0)) {
          cells.remove(i);
        }
      }
    }
  }


 
  
  void moveCell( ) {
    // moveVec = new Vec3D (int(random(-2, 2))*cellSize, int(random(-2, 2))*cellSize, 0);
    loc.addSelf( moveVec);
  }
}

