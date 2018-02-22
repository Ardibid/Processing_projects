// This function rotate the coordination system in order to make the rotating box setup

void rotation() {
  translate(bbxpos, bbypos, 0);
  rotateY(map(mouseX, 0, width, -PI, PI));
  noFill();
  stroke(200, 255, 0);
  strokeWeight(2);
  fill(150);
  rotateX(radians(90));
  translate(-bbx/2, -bbx/2, -bbx/2);
}

