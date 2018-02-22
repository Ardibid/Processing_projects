// Keyboard interactions
void keyPressed() {

  if (key == 'b' || key =='B') {
    print ("B!");
    curves = ! curves;
  }

  if (key == 'c' || key =='C') {
    guimatrixYpos = guimatrixYposC;
  }
  if (key == 'o' || key =='O') {
    guimatrixYpos = guimatrixYposO;
  }

  if (key == 's' || key =='S') {
    send_Data();
  }
}

