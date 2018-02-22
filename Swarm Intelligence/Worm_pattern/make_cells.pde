
void makeCells() {
  for ( int i = 0 ; i < widthNum ; i ++) {
    for (int j = 0; j < heightNum ; j++) {
      PVector loc  = new PVector (i*cellSize, j*cellSize);
      cells[i][j] = new cellularAutomata (loc, cellSize, false);
    }
  }}



void conditionZero(){
    for (int k = 0 ; k < initialPop; k++) {
    int i =int (random (widthNum));
    int j =int (random (heightNum));
    //cells[i][j].condition = true;
   cells[i][j].setInitialColor(i,j);
  }
  
}

