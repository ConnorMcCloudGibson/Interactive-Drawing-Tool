//Drawing tools as functions
//Animated drawing function as an array 
//Capture screen pixels and process for bonus function 
//DRAWING VARIABLES 

//PGraphics pg2; 
PVector beginCornerL = new PVector();
PVector endCornerL = new PVector();
int xLine=1;
int mOdulo;
boolean click=false;
PImage brush; 
boolean welcome=true;
PGraphics pg;
boolean bClear=false;



//float R;
//float G;
//float B;
int bG=color(255);//(R,G,B);
float H;
float S; 
float B;
float A;
color c =color(H, S, B, A);
float diameter;
boolean brush1;
boolean brush2;
boolean brush3;

//INTERFACE VARIABLES
int sSx=1440;
int sSy=900;
int i;
int j;
boolean Pressed;
PFont mono;
//BUTTON CLASS
int aSize1=6; 
int aSize2=6; 
int xDim=50;
int yDim=50;
int s=10;
float oSx;
float oSy=55;
//CLICK
boolean iPressed=false; //CLICKING BOOLEANS
boolean Paint=false; //CLICKING BOOLEANS


Line df1; //DRAW OBJECT INIT
Rectangle df2; // DRAW RECTANGLES
eraser df4; //DRAW FUNCTION 4 (ERASER)
brush0 d0; //BRUSH 0
brush1 d1; //DRAW BRUSH 1 
brush2 d2; //DRAW BRUSH2
SquareFun d3;//DRAW BRUSH 3
Cones d4;
//GUI OBJECT INIT
colourSlide r1;
mrbrightSlide r2;
saturator r3;
weightSlider r4;
opacitySlider r5;
brush5 d5;
brush6 d6;
welcome ws;



//OBJECT/IMAGE ARRAY DEFINITION
PImage icon[] = new PImage[aSize1];
PImage icon2[] = new PImage[aSize2];
Button[] Buttons = new Button[aSize1];
Button[] Buttons2 = new Button[aSize1];

void settings() { 
  fullScreen(P2D);
  //size(800,800, P2D);

}
void setup() { 


  //colorMode(HSB);
  pg= createGraphics(width, height, P2D);
  
  cols =floor(width/scl);
  rows = floor(height/scl);
  pg2 = createGraphics(width, height, P2D); 

  for (int i=0; i<particle.length; i++) {
    particle[i] = new Particle();
    flowField = new PVector[cols * rows];
  }
  
   


  //CREATE COLOUR SLIDER
  background(255);
  brush = loadImage("tool14.png"); 

  //LOAD IMAGE ARRAY 1
  for (int i=0; i<aSize1; i++) {
    icon[i] = loadImage("tool"+i+".png");
    //LOAD IMAGE ARRAY 2
  }
  for (int l=0; l<aSize2; l++) {
    icon2[l] = loadImage("tool1"+l+".png");
  }
  r1 = new colourSlide(4*(xDim+s)-10, (xDim+s)+s/2+5, s/2+4);
  r2 = new mrbrightSlide(4*(xDim+s)-10, (xDim+s)+s/2+5, (s/2)+12+7);
  r3 = new saturator(4*(xDim+s)-10, (xDim+s)+s/2+5, (s/2)+24+11);
  //CREATE WEIGHT SLIDER
  r4= new weightSlider(2*(xDim+s)-10, (5*xDim+(2*(xDim+s))/2+(s/2)), s/2, yDim);
  r5= new opacitySlider(2*(xDim+s)-10, (5*xDim+(2*(xDim+s))/2+(s/2)), (yDim+s)/2, yDim);
  //CREATE DRAW TOOLS 
  d0= new brush0();
  d1= new brush1();
  d2= new brush2();
  d3= new SquareFun();
  d4 = new Cones();
  d5= new brush5(icon2[4]);
  d6= new brush6(icon2[5]);
  df1 = new Line();
  df2= new Rectangle(xLine);
  df4= new eraser();
  ws = new welcome();

  //LOAD BUTTON ARRAYS 1 & 2
  for (int j=0; j<aSize1; j++) {
    Buttons[j] = new Button(j, xDim+s, yDim, xDim, yDim, icon[j], Buttons, 0, oSy, aSize1);
    for (int k=0; k<aSize2; k++) {
      Buttons2[k]= new Button(k, xDim+s, yDim, xDim, yDim, icon2[k], Buttons2, 50, oSy, aSize2);
    }
  }
}

void draw() {  



    

  //loadPixels();
  pg.beginDraw();
  
//////WELCOME SCREEEN/////  
    if (welcome==true) { 
      noCursor();

   ws.drawWelcome();  
  //for (int i=0; i<particle.length; i++) {
  //  particle[i].fol(flowField);
  //  //particle[i].appForce(vector);
  //  particle[i].update();
  //  particle[i].display();
  //  particle[i].edgedet();
  //} 
    }
    if (welcome==false){
    c2=0;
    ps=0;

    cursor();
    textSize(12);
    //bClear=true;
    
  //////////DRAW FUNCTION RENDERING///////////  
  //BRUSH0 (pen tool)
  if (Buttons[0].clicked == true && Buttons2[0].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) {
    d0.brush0d(H, S, B, A, diameter);
  }
  //BRUSH2
  else if (Buttons[0].clicked == true && Buttons2[1].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    d2.brush2d(H, S, B, A, diameter);
  }

  //BRUSH3
  else if (Buttons[0].clicked == true && Buttons2[2].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    d3.drawSquares(H, S, B, A, diameter);
  }

  //BRUSH4
  else if (Buttons[0].clicked == true && Buttons2[3].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    d4.drawCone(H, diameter, A);
  }

  //BRUSH5
  else if (Buttons[0].clicked == true && Buttons2[4].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    d5.drawBrush5(H, S, B, A, diameter);
  }
  //BRUSH6
  else if (Buttons[0].clicked == true && Buttons2[5].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    d6.drawBrush6(H, S, B, A, diameter);
  }
  // PEN TOOL 
  if (Buttons[1].clicked==true&& mouseX>2*(xDim+s) && mouseY>yDim+s) {  
    d1.penDraw(H, S, B, A, diameter);
  }

  //LINE TOOL
  if (Buttons[2].clicked==true&& mouseX>2*(xDim+s) && mouseY>yDim+s) {  
    df1.lineDraw(H, S, B, A, diameter);
  }

  //RECTANGLE TOOL 
  else if (Buttons[3].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    df2.rectDraw(H, S, B, A, diameter);
    df2.distCalc();
  }

  //ERASER
  if (Buttons[4].clicked==true && mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    df4.erase(int(bG), diameter);
  }
  //BUCKETFILL
  else if (Buttons[5].clicked == true&& mouseX>2*(xDim+s) && mouseY>yDim+s) { 
    bG=c;
  }

    }
      if (bClear==true) {
    background(bG);
    }
     if(welcome==false){ 

  pg.endDraw(); 
    

      //}
 
  //////////SCREEN CAPTURE///////////

  loadPixels();

  imageMode(CORNER);
  image(pg, 0, 0, width, height); 
  updatePixels();


  //////////GUI RENDERING/////////// 
  //DIAMETER FROM OBJECT 
  diameter= r4.sW; 

  //HSB VARIABLES FROM SLIDER OBJECTS 
  c =color(H, S, B, A);
  H=r1._hueValue;
  S=r3._hueValue;
  B=r2._hueValue;
  A=r5.sW;
  //TASK BAR BACKGROUND
  taskBar();
  colorMode(RGB);
  //DRAW SLIDER BACKGROUND
  strokeWeight(1);
  stroke(0);
  fill(245);
  rectMode(CENTER);
  rect(4*(xDim+s)/2+xDim+(3*s/2), (yDim/2)+(s/2), 4*(xDim+s)+3, yDim-1);

  //DRAW SLIDERS 
  colorMode(HSB);
  r1.sDraw();
  r2.sDraw();
  r3.sDraw();
  r4.wDraw();
  r5.wDraw();

  //COLOUR SWATCH ICON
  fill(255);
  stroke(0);
  rectMode(CENTER);
  rect((xDim/2)+s/2, (yDim/2)+s/2, xDim, yDim);
  colorMode(HSB);
  strokeWeight(1); 
  stroke(0, 0, 0);
  fill(c);
  rectMode(CENTER);
  rect((xDim/2)+s/2, (yDim/2)+s/2, diameter/2*0.8, diameter/2*0.8);


  bDraw1();
  if (Buttons[0].clicked==true) {
    bDraw2();
  }
    }
  }


void bDraw1() {  
  //BUTTON SET ONE ARRAY RENDER FUNCTION
  color(255, 0, 255, 255);
  for (int i=0; i<aSize1; i++) {
    Buttons[i].display(); 
    Buttons[i].mouseReleased();
  }
  color(HSB);
}
//BUTTON SET TWO ARRAY RENDER FUNCTION

void bDraw2() {
  color(255, 0, 255, 255);
  for (int i=0; i<aSize2; i++) {
    Buttons2[i].display();
    Buttons2[i].mouseReleased();
  }
  color(HSB);
}
//DRAW TASK BAR BACKGROUND 
void taskBar() { 
  noStroke();
  fill(255);
  rectMode(CORNER);

  rect(0, 0, (2*xDim)+s, (aSize1+1)*(yDim+s)+(s/2));
  rect(0, 0, 2*(xDim+s)-10 +(5*xDim+(2*(xDim+s))/2+s)+(s/2), yDim+s);
  stroke(0);
  strokeWeight(1);
  line((2*xDim)+s, yDim+s, 2*(xDim+s)-10 +(5*xDim+(2*(xDim+s))/2+s)+(s/2), yDim+s);
  line((2*xDim)+s, yDim+s, (2*xDim)+s, (aSize1+1)*(yDim+s)+(s/2));
}
//BUTTON INTERACTION
void mousePressed() {

  //beginCornerL = new PVector(mouseX, mouseY);
}

void mouseReleased() {
  if (click==false) { 
    click=true;
  } else {
    click=false;
  }
}

//endCornerL = new PVector(mouseX, mouseY);

void mouseClicked() {

  if (Buttons[1].clicked==true || Buttons[2].clicked==true || Buttons[3].clicked==true) {

    if (mouseX>2*(xDim+s) && mouseY>yDim+s) {  

      xLine+=1;
    }
  }

}
void keyPressed() {
  if (key == 'c'&& bClear==false) {
    bClear=true;
  }
  if (key ==  's') {
    pg.save("sketch-####.png");
  }
  if (keyCode == ENTER) {
    welcome=false;
    
  }
}
void keyReleased() {
 if (keyCode == ENTER) {
    //bClear=false;
 }
  if (key == 'c'&& bClear==true) {
    bClear=false;
  }
}
void mouseMoved(){
 
  angles = atan2(mouseY - pmouseY,mouseX - pmouseX);

}