String webSource[];
String rawText [];
String splittedText [];
String keyWords [] ;
int keyWordsRep [] ;
KeyWord myKeyWords [];
boolean fetched = false;
float globalNoise  = .01;

String address = "http://cumincad.scix.net/cgi-bin/works/BrowseAZ?name=titles";

void setup() {
  size(800, 800);
  background(150);
  smooth();
}


void draw() { 
  background(0);
  fetch();
  extract();
  if (fetched) {
    for (int i = 1; i < myKeyWords.length; i ++) {
      myKeyWords[i].run(i);
    }
  } else {
    textSize(32);
    text("Ready to fetch data from the URL:", 50, height/2);
    textSize(14);
    text(address, 50, height/2 + 35);
    textSize(18);
    text("Press m to continue", 50, height/2+ 70);
  }
} 

void keyPressed() {
  if (key == 'm' || key == 'M')
  {
    myKeyWords = new KeyWord [keyWords.length];
    println("m");
    text ("M pressed, fetching in progress...", 20, height-20);
    for (int i = 0; i < keyWords.length; i ++) {
      myKeyWords [i] = new KeyWord (keyWords[i], keyWordsRep[i], "null for now");
    }
    background(0);
    text ("Fetching Done.", 20, height-20);
    fetched = true;
  }
  if (key == 'r' || key == 'R')
  {
    saveFrame("###dataVis.jpg");
  }
}

void fetch() {
  webSource = loadStrings("http://cumincad.scix.net/cgi-bin/works/BrowseAZ?name=titles");
}



void extract() {
  rawText = trim(webSource);
  String rawTextJoin = join(rawText, ",");
  splittedText = split(rawTextJoin, "/cgi-bin/works/Search?search=");
  keyWords  = new String [splittedText.length];
  keyWordsRep  = new int [splittedText.length];


  for (int i = 0; i < splittedText.length; i++) {
    String newText [] = splitTokens (splittedText[i], "&");
    String newText_ [] = splitTokens (newText[0], "%");
    String newNum [] = splitTokens (newText[1], "(");

    if (newNum.length >1) {
      String newNum_ [] = splitTokens (newNum[1], ")");
      keyWordsRep [i] = int( newNum_[0]);
    }
    keyWords [i] = newText_ [0];
  }
}

class KeyWord {
  String word;
  int rep;
  String links ;
  KeyWord (String word_, int rep_, String links_) {
    word = word_;
    rep = rep_;
    links= links_;
  }

  void run(int i_) {
    display(i_);
  }


  void display (int i_) {
    float i = i_/2;
    float locX = noise(i+globalNoise)*width;
    float locY = noise(i+1000+globalNoise)*height;
    fill(rep);
    stroke(rep);
    textSize(rep/10);
    strokeWeight(1);
    // ellipse(locX, locY, 5, 5);
    text (word, locX, locY);
    // text (rep, locX, locY+ 20);
  }
}



