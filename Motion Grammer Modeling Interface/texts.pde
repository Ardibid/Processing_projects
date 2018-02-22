// Texts that I wanted to be displayed on the screen
void helpTexts() {
  fill(255);
  textFont(comments, 12);
  text("bbxpos= " + bbxpos + "| bbypos= "+ bbypos, guixpos, 710);
  text("Point No.= " + myBalls.size(), guixpos, 710 +guitextdist);
  text("Press B to toggle connecting curves", guixpos, 710 + guitextdist+ guitextdist);
}






