import toxi.geom.*;

ArrayList cells;
int counter = 0;
int sizeX = 800;
int sizeY = 800;

int cellSize =10;
int initialPop = 250;
int widthNum = int (sizeX / cellSize);
int heightNum = int (sizeY / cellSize);
int totalNumber = widthNum *heightNum;
int frameCounter = 0;

float cellSizeToll = .4;

PFont titleFont;

void setup () {

  size(sizeX, sizeY);
  smooth();
  background(0);

  titleFont = loadFont("ArialNarrow-20.vlw");
  textFont(titleFont); 
  cells = new ArrayList();

  for (int i = 0 ; i < initialPop ; i++) {
    int column = int(i / widthNum);
    int raw = i % widthNum ;
    Vec3D origin = new Vec3D (int(random (0, widthNum)) *cellSize, int(random (0, heightNum)) *cellSize, 0);
    cellularAutomata cell = new cellularAutomata (origin, int(random(cellSize*(1-cellSizeToll), cellSize*(1+cellSizeToll))), true);
    cells.add(cell);
  }
}


void draw() {
  
//  noStroke();
//  fill(0, 100);
//  rectMode(CORNER);
//  rect(0, 0, width, height);
  background(0);
  drawGrid();
  //call functionality
  for (int i = 0; i < cells.size() ; i ++) {
    cellularAutomata tempCell =(cellularAutomata) cells.get(i);
    tempCell.run(i);
  }
  
  mainGrowth();
  counter ++;

  if (counter %100 == 0) {
    replanting();
    
    
  }
  
 println(int(frameRate)+"-"+ cells.size());
 
    //saveFrame("cellularAuto-#####.jpg");
   // frameCounter ++;
   // println(frameCounter);
    
}


void mousePressed() {

  Vec3D origin = new Vec3D (mouseX, mouseY, 0);
  cellularAutomata cell = new cellularAutomata (origin, cellSize, true);
  cells.add(cell);
  
  if  (mouseButton == CENTER) {
   
   saveFrame("Frame-##.jpg");
   
   }
}




void replanting() {
   for (int i = 0 ; i < cells.size() / 100 ; i++) {
      cells.remove(i);
    }
  for (int i = 0 ; i < initialPop/20 ; i++) {
    cells.remove(i);
    int column = int(i / widthNum);
    int raw = i % widthNum ;
    Vec3D origin = new Vec3D (int(random (0, widthNum)) *cellSize, int(random (0, heightNum)) *cellSize, 0);
    cellularAutomata cell = new cellularAutomata (origin, int(random(cellSize*.8, cellSize*1.2)), true);
    cells.add(cell);
  }
 
}


void mainGrowth(){
     for (int i = 0; i < 10 ; i ++) {
    int index =  int (random(cells.size()));
    cellularAutomata tCell =(cellularAutomata) cells.get(index);
    tCell.growth();
    tCell.elliminate();
      }

}


