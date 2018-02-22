cellularAutomata [][] cells;
int counter = 0;
int sizeX = 1200;
int sizeY = 1200;

int cellSize =5;
int initialPop = 50;
int widthNum = int (sizeX / cellSize);
int heightNum = int (sizeY / cellSize);

PFont titleFont;


void setup () {

  size(sizeX, sizeY);
  background(0);
  
  titleFont = loadFont("ArialNarrow-20.vlw");
  textFont(titleFont); 
  cells = new cellularAutomata[ widthNum ][ heightNum  ];
  makeCells();
  conditionZero();
}


void draw() {
  // background(0); 
  fill(0, 1);
  rectMode(CENTER);
  rect( width/2, height/2, width, height);
  for ( int i = 0 ; i < widthNum ; i ++) {
    for (int j = 0; j < heightNum ; j++) {
      if ( cells[i][j].condition == true  ) {
        cells[i][j].render(i, j);
      }
    }
  }
  int k = 0;
  for ( int i = 0 ; i < widthNum ; i ++) {
    for (int j = 0; j < heightNum ; j++) {
      if ( cells[i][j].condition == true  ) {
        cells[i][j].moveCell(i, j);
      }
    }
  }
  counter ++;
  saveFrame("moldTest-#####.jpg");
  println(counter);
  fill(0);
  rectMode(CORNER);
  noStroke();
  rect(0, 0, 100, 30);
  fill(155, 155, 50);
  text("Cycle: "+ counter, 20, 20);
}

