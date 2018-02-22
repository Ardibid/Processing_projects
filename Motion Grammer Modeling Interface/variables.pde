// All global variables are declared here 

import toxi.*;
import toxi.geom.Vec2D;
import toxi.math.noise.PerlinNoise;
import oscP5.*;
import netP5.*;


int bbx =200;
int bby = 200;
int bbz= 200;
int bbxpos = 500;
int bbypos = 400;
int n = 2;
int index = 0;
float rate = 0.5;
int ballTrackSize = 250;
float [] t = new float [n];

ArrayList < Walker> myBalls = new ArrayList <Walker> ();
ArrayList < Walker> ballTrack0 = new ArrayList <Walker> ();
ArrayList < Walker> ballTrack1 = new ArrayList <Walker> ();
ArrayList <PVector> p1 = new  ArrayList <PVector> ();
ArrayList <PVector> p2 = new  ArrayList <PVector> ();


Walker [] myBall = new Walker [n];
PVector myArray = new PVector (0, 0, 0);



// Font and Texts
PFont comments;
boolean curves = true; 

//GUI
Accordion accordion;
int guixpos = 40;
int guitextdist = 15;
int guimatrixYpos = 250;
int guimatrixYposO = 250;
int guimatrixYposC = 100;

//OSC
OscP5 oscP5;
NetAddress myBroadcastLocation;
OscMessage arrayMsg = new OscMessage("/array"); 

