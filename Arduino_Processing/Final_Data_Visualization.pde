// Ex11_03

color[] dessert = {
  #9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC
};
color[] palette = dessert;
PFont titleFont, labelFont;

Table artData;
int rowCount;
float mx = 29;
int right_border = 400;
int temp_max = 0;
int hum_max=0;
int co2_max =0;
int aq_max=0;
int graph_gap = int(right_border/5);
int graph_width=35;
int[] humArray = {
};
int[] tempArray= {
};
int[] co2Array= {
};
int[] aqArray = {
};


void setup() {
  size(1400, 600);
  artData = new Table ("type00.tsv");
  rowCount = artData.getRowCount();
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  smooth();
}

void draw() {

  noCursor();
  background(palette[0]);
  fill(palette[3]);
  stroke(palette[3]);
  textFont(titleFont);
  textAlign(LEFT);
  text("Environmental Variables measured in site", 30, 30);

  translate(0, 100);
  textFont(labelFont);



  //graph legend
  textAlign(CENTER);
  text("Temperature", width-right_border + graph_gap, 170 );
  text("Humidity", width-right_border+ 2*graph_gap, 170);
  text("CO2 Level", width-right_border+3*graph_gap, 170 );
  text("Air Quality", width-right_border+ 4*graph_gap, 170 );

  textAlign(LEFT);
  int posxt = width - 200; 
  int posyt = 0;
  int dist = 20;
  int rowJump =25;
  float indexJump_=   (width-right_border -30)/float(rowCount);
  int indexJump = int(indexJump_ * rowJump);
  int l = 0;


  //read popularity
  for (int row = 0 ; row < rowCount-rowJump ; row= row+rowJump) {

    float hum_ = artData.getFloat(row, 0);
    float temp_ = artData.getFloat(row, 1);
    float co2_ = artData.getFloat(row, 2);
    float aq_ = artData.getFloat(row, 3);

    int hum = int(hum_);
    int temp = int(temp_);
    int co2 = int(co2_);
    int aq = int(aq_);
    int limit = 200;



    hum = constrain (hum, 35, 100);
    temp = constrain (temp, 10, 30);
    co2 = constrain (co2, 15, limit);
    aq = constrain (aq, 15, limit);

    humArray = append (humArray, hum);
    tempArray = append (tempArray, temp);
    co2Array = append (co2Array, co2);
    aqArray = append (aqArray, aq);


    float x = map(row, 0, rowCount, 30, width-right_border);

    strokeWeight(1);

    if ((mx > 30) && (mx < width-right_border)) {
      line(mx, -10, mx, 150);
      if (abs(mx-x)<indexJump) {
        textAlign(LEFT);
        text("Temperature (C) : ", mx+10, posyt );
        text("Humidity (%) : ", mx+10, posyt+ dist);
        text("CO2 Level Index: ", mx+10, posyt + 2*dist);
        text("Air Quality Index : ", mx+10, posyt +  3*dist);


        int text_distance = 120;
        fill(palette[3]);
        text(temp, mx+text_distance, posyt );
        text(hum, mx+text_distance, posyt+ dist);
        text(co2, mx+text_distance, posyt + 2*dist);
        text(aq, mx+text_distance, posyt +  3*dist);


        // draw graph
        pushMatrix();
        translate(0, -400);
        translate(width-right_border, height-50);

        stroke(palette[3], 200);
        strokeWeight(1);
        for (int k = 0 ; k <= limit; k +=(limit /5)) {
          line(graph_gap - graph_width, -k, 4.5*graph_gap, -k);
        }

        fill(palette[3]);
        strokeWeight(1);

        rect (graph_gap - graph_width/2, 0, graph_width, - temp);
        rect (2*graph_gap - graph_width/2, 0, graph_width, - hum);
        rect (3*graph_gap - graph_width/2, 0, graph_width, - co2);
        rect (4*graph_gap - graph_width/2, 0, graph_width, - aq);

        if (  temp > temp_max) {
          temp_max = temp;
        }
        if (  hum > hum_max) {
          hum_max = hum;
        }
        if (  co2 > co2_max) {
          co2_max = co2;
        }
        if (  aq > aq_max) {
          aq_max = aq;
        }


        // draw max line
        stroke(palette[1]);
        strokeWeight(2);
        line (graph_gap - graph_width/2, -temp_max, graph_gap + graph_width/2, - temp_max);
        line (2*graph_gap - graph_width/2, -hum_max, 2*graph_gap + graph_width/2, - hum_max);
        line (3*graph_gap - graph_width/2, -co2_max, 3*graph_gap + graph_width/2, - co2_max);
        line (4*graph_gap - graph_width/2, -aq_max, 4*graph_gap + graph_width/2, - aq_max);



        textAlign(RIGHT);
        text("Max:"+str(temp_max)+" ", graph_gap- graph_width/2, -temp_max+5);
        text("Max:"+str(hum_max)+" ", 2*graph_gap- graph_width/2, -hum_max+5);
        text("Max:"+str(co2_max)+" ", 3*graph_gap- graph_width/2, -co2_max+5);
        text("Max:"+str(aq_max)+" ", 4*graph_gap- graph_width/2, -aq_max+5);


        textAlign(LEFT);
        //        for (int u=0; u < (tempArray.length) ; u+= 4) {
        //         stroke(palette[1], u * 150/tempArray.length);
        //        
        //          strokeWeight(.2);
        //          line (graph_gap - graph_width/2, -tempArray[u], graph_gap + graph_width/2, -tempArray[u]);
        //          line (2*graph_gap - graph_width/2, -humArray[u], 2*graph_gap + graph_width/2, - humArray[u]);
        //          line (3*graph_gap - graph_width/2, -co2Array[u], 3*graph_gap + graph_width/2, - co2Array[u]);
        //          line (4*graph_gap - graph_width/2, -aqArray[u], 4*graph_gap + graph_width/2, - aqArray[u]);
        //        }

        pushMatrix();
        translate(-1000, +300);
        int countM = 0; 
        float graphX_ =0;
        int jumping = 3;
        for (int m = 30 ; m < rowCount-(jumping) ; m+=jumping) {
          float pixel_jump =(width-60)/(rowCount);
          float graphX= countM;

          strokeWeight(1);

          stroke(palette[1]);
          line(graphX, -tempArray[m], graphX_, -tempArray[m-jumping]);
          
          stroke(palette[2]);
          line(graphX, -humArray[m], graphX_, -humArray[m-jumping]);
          
          stroke(palette[3]);
          line(graphX, -co2Array[m], graphX_, -co2Array[m-jumping]);
          
          stroke(palette[4]);
          line(graphX, -aqArray[m], graphX_, -aqArray[m-jumping]);
          
          
          
          
          
          
          
          
          
          graphX_ = graphX;
          countM ++;
        }
        popMatrix();
        popMatrix();
      }
    }

    // Small line and dots
    strokeWeight(1);
    stroke(palette[1]);
    line(x, 100, x, 150);
    noStroke();
    fill(palette[1]);
  }

  //read time
  for (int row = 0;row < rowCount ; row +=12*rowJump) {
    String time  = artData.getString(row, 4);    
    float x = map(row, 0, rowCount, 30, width-right_border);
    String [] time_ = splitTokens(time, ":");
    String time_h_m = (time_[0] +":"+ time_[1]);

    //time
    textAlign(CENTER);
    text(time_h_m, x, 170);
    textAlign(LEFT);

    //Draw Long lines
    stroke(palette[1]);
    strokeWeight(3);
    strokeCap(SQUARE);
    line(x, 80, x, 150);
    ellipse(x, 80, 2, 2);
    noStroke();
  }
}


void keyPressed() {

  int rowJump =25;
  float indexJump_=   (width-right_border -30)/float(rowCount);
  int indexJump = int(indexJump_ * rowJump);

  if (key == CODED) {
    if (keyCode ==LEFT) {
      mx -=indexJump;
    }
    else if (keyCode == RIGHT) {
      mx +=indexJump;
    }
  }
}

void mousePressed(){
  
 saveFrame("Frame-##.jpg"); 
  
}
void mouseMoved() {
  mx = mouseX;
}

