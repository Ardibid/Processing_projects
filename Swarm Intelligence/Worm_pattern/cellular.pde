class cellularAutomata
{
  int size;
  boolean condition;
  PVector loc;

  cellularAutomata (PVector _loc, int _size, boolean _condition) {
    loc = _loc;
    size= _size;
    condition = _condition;
  }


  void render(int _i, int _j) {
    int i = _i;
    int j = _j;
    noStroke();
    if (condition == true) {
      //fill (155, 155, 50, 50);
      fill (0, 255, 255,150);
    /*  rectMode(CENTER);
      rect(loc.x, loc.y, size+5, size+5, size);
      ellipse(loc.x, loc.y, size+2, size+2);
      ellipse(loc.x, loc.y, size+1, size+1);
      ellipse(loc.x, loc.y, size, size);
    */
strokeWeight(5);
stroke(0,255,255,50);
//noStroke();
 fill (0, 255, 255,150);
 ellipse(loc.x, loc.y, size, size);
 
 }
  }


  void setInitialColor(int _i, int _j) {
    condition = true;
  }




  void moveCell( int _i, int _j) {
    PVector moveVec = new PVector (int(random(-2, 2))*cellSize, int(random(-2, 2))*cellSize);
    int i = _i;
    int j = _j;
    if ( i+int(moveVec.x) > 0 && i+int(moveVec.x) < widthNum && j+int(moveVec.y) > 0 && j+int(moveVec.y) < heightNum ) {
      loc.add( moveVec);
    }
  }


  void testCondition( int _i, int _j) {
    int i = _i;
    int j = _j;
    println("["+i+"],"+"["+j+"]: "+ cells[i][j].condition);
  }
}

