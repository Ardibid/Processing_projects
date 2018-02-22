


import toxi.geom.*;

ArrayList cells;
ArrayList foods;

int counter = 0;
int sizeX = 1000;
int sizeY = 800;

int cellSize =10;
int initialPop = 500;
int initialFood = 25;
int foodSearchRadious = 25;
int widthNum = int (sizeX / cellSize);
int heightNum = int (sizeY / cellSize);
int totalNumber = widthNum *heightNum;
float cellSizeToll = 0;
int frameCounter = 0;


PFont titleFont, simpleFont;

void setup () {

  size(sizeX, sizeY);
  smooth();
  background(0);

  titleFont = loadFont("ArialNarrow-12.vlw");
  simpleFont = loadFont("ArialNarrow-8.vlw");
  textFont(simpleFont); 


  cells = new ArrayList();
  foods = new ArrayList();


  for (int i = 0 ; i < initialPop ; i++) {
    int column = int(i / widthNum);
    int raw = i % widthNum ;
    Vec3D origin = new Vec3D (int(random (0, widthNum)) *cellSize, int(random (0, heightNum)) *cellSize, 0);
    cellularAutomata cell = new cellularAutomata (origin, int(random(cellSize*(1-cellSizeToll), cellSize*(1+cellSizeToll))), true);
    cells.add(cell);
  }


  for (int i = 0 ; i < initialFood ; i++) {

    Vec3D origin = new Vec3D (int(random (0, widthNum)) *cellSize, int(random (0, heightNum)) *cellSize, 0);
    Food food = new Food (origin, int(random(2, 5))*cellSize);
    foods.add(food);
  }
}




void draw() {
  background(0);
  if (foods.size()<1) {

    pause();
  }

  for (int i = 0; i < cells.size() ; i ++) {
    cellularAutomata tempCell =(cellularAutomata) cells.get(i);
    tempCell.run(i);
  }

  for (int i = 0; i < foods.size() ; i ++) {
    Food tempFood =(Food) foods.get(i);
    tempFood.run(i);
    tempFood.feedingCount = 0;
  }
  
  
  
  textFont(titleFont);
  fill(255,255,255);
 text("Frame # "+frameCounter, 10,15) ;
   //  saveFrame("cellularAuto-#####.jpg");
     frameCounter ++;
   //  println(frameCounter+"-"+ frameRate);
  
}


void mousePressed() {
  if (mouseButton == RIGHT) {
    Vec3D origin = new Vec3D (int(random (0, cellSize))+mouseX, int(random (0, cellSize))+ mouseY,0);
    Food food = new Food (origin, int(random(2, 5))*cellSize);
    foods.add(food);
  }


  if  (mouseButton ==LEFT) {
    Vec3D origin = new Vec3D (int(random (0, cellSize))+mouseX, int(random (0, cellSize))+mouseY, 0);
    cellularAutomata cell = new cellularAutomata (origin, int(random(cellSize*(1-cellSizeToll), cellSize*(1+cellSizeToll))), true);
    cells.add(cell);
  }
   if  (mouseButton == CENTER) {
   
   saveFrame("Frame-##.jpg");
   
   }
}

