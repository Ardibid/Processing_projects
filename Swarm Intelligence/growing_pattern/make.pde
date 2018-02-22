void drawGrid() {
   strokeWeight(5);
    stroke(100, 25);
  for (int i = 0 ; i < widthNum ; i++) {
    line ((i+.5)* cellSize, 0, (i+.5)* cellSize, height);}
    for ( int j = 0 ; j < heightNum ; j++) {
     
    line (0, (j+.5) * cellSize, width , (j+.5) * cellSize);
    
  }
}

