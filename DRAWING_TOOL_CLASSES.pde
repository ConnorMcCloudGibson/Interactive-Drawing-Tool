 //<>//

class eraser {

  eraser() {
  }
  void erase(color bG, float d) {
    pg.noStroke();
    pg.fill(bG);
    pg.ellipse(mouseX, mouseY, d, d);
  }
}
class brush0 {
  float c;
  float d;
  float H;
  float S;
  float B;
  float sW;
  float pX; 
  float pY;
  float swM;
  //brush2(color colour, float stroke){ 
  //c=colour;
  //d=stroke;
  brush0()
  {
  }
  void brush0d(float H, float S, float B, float A, float d) {

    if (mousePressed) {
      float absdif = dist(pX, pY, mouseX, mouseY);
      //println(absdif);
      pX= lerp(pX, pmouseX, 0.1);
      pY= lerp(pY, pmouseY, 0.1);
      swM=0.01;
      if (absdif > 150) {
        absdif= 150;
      }
      sW=absdif/50;
      float swM = lerp(0, sW, 0.15); 
      float swMM = lerp(0, swM, 0.1); 

      color(HSB);
      pg.stroke(H+(swM*5), S-(swM*10), B+(swM*10), A);
      pg.strokeWeight(swM*d);
      pg.line(pmouseX, pmouseY, mouseX, mouseY);
      //println(sW);
      //color(HSB);
      //stroke(H+(swMM*5),S-(swMM*10),swMM*B);
      //strokeWeight(swMM*d);
    }
  }
}
class brush1 {
  float d;
  float H;
  float S;
  float B;

  brush1() {
  } 

  void penDraw(float H, float S, float B, float A, float d) {

    color(HSB);


    if (mousePressed) {

      pg.stroke(H, S, B, A);
      pg.strokeWeight(d);

      pg.line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}


class brush2 {
  float c;
  float d;
  float H;
  float S;
  float B;
  //brush2(color colour, float stroke){ 
  //c=colour;
  //d=stroke;
  brush2()
  {
  }
  void brush2d(float H, float S, float B, float A, float d) {


    float absdif = dist(pmouseX, pmouseY, mouseX, mouseY);

    if (mousePressed == true) {
      if (absdif > 20) {
        absdif= 20;
      }
      color(HSB);
      pg.stroke((absdif/20)*15+H, (absdif/20)*15+S, (absdif/20)*15+B, A);
      pg.strokeWeight(d-d*(absdif/20)+3);
      pg.line(pmouseX, pmouseY, mouseX, mouseY);
      color(HSB);
      pg.stroke((absdif/30)*15+H, (absdif/30)*15+S, (absdif/30)*15+S, A);
      pg.strokeWeight(d-d*(absdif/20));
      pg.line(pmouseX+1, pmouseY+1, mouseX+1, mouseY+1);
    }
  }
}

class SquareFun { 
  SquareFun() {
  }
  int angle = 0;
  float op1; 
  float op2; 
  float n;
  float xoff; 
  float xoff3;
  float theta = 0.0;  
  float amplitude = 1;  
  float dx;
  float x;




  void drawSquares(float H, float S, float B, float A, float d) {
    theta += 0.01;
    float x = theta;
    for (int i = 0; i < 10; i++) {
      dx = sin(x)*amplitude;
      x+=dx;
    }

    pg.colorMode(HSB);

    float z =+ 1; 
    op1=noise(z);
    op1 +=5; 
    if (mousePressed == true) {
      angle += op1;

      xoff = xoff + .01;
      float n = noise(xoff) * 255;

      float op1 = noise(xoff3)*10;
      xoff3 += 0.01;



      // For every x value, calculate a y value with sine function


      float val = cos(radians(angle)) * (60*(op2/40)+2);
      for (int a = 0; a < 360; a += op1+d) {
        float xoff2 = sin(radians(a)) * val;
        float yoff2 = cos(radians(a)) * val;

        pg.fill(n+H/2, n+S/2, n+B/2, A);
        pg.noStroke();
        //stroke(255, 0, 0);
        pg.rect(mouseX + xoff2, mouseY + yoff2, val+val*(x/val), val+val*(x/val));
        pg.fill(n+H/3, n+S/3, n+B/4, A);
        pg.rect(mouseX+2 + xoff2, mouseY + yoff2+2, val+val*(x/val), val+val*(x/val));
        pg.fill(255, 0, 255);
        pg.ellipse(mouseX, mouseY, 2, 2);
      }


      op2= dist(pmouseX, pmouseY, mouseX, mouseY);
      if (op2>20) {
        op2=20;
      }
    }
  }
}
//stroke controls multiplier 
//colour controls angle
class Cones { 
  Cones() {
  }
  int angle = 0;

  void drawCone(float H, float d, float A) {

    if (mousePressed == true) {
      angle +=H/10;
      float val = tan(radians(angle)) * (d/4);
      for (int a = 0; a < 359; a += d/12) {
        float xoff = sin(radians(a)) * val;
        float yoff = cos(radians(a)) * val;
        //pg.fill(0);
        pg.strokeWeight(1);
        pg.stroke(255,A);
        pg.line(pmouseX+yoff, pmouseY+xoff, mouseX +val, mouseY+val);
        pg.stroke(0,A);
        pg.line(pmouseX+yoff+1, pmouseY+xoff+1, mouseX +val+1, mouseY+val+1);
      }
      //stroke(255,255,255);
      //line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

class Line { 
  PVector beginCornerL = new PVector();
  PVector endCornerL = new PVector();
  //int xLine=1;
  int mOdulo;

  Line() {
  }

  void lineDraw(float H, float S, float B, float A, float d) { 
    mOdulo= xLine % 2;

    if (mOdulo==1) { 
      beginCornerL = new PVector(mouseX, mouseY);
    }
    if (mOdulo==0) {
      endCornerL = new PVector(mouseX, mouseY);


      if (mOdulo==0 && mousePressed) { 
        pg.colorMode(HSB);
        pg.stroke(H, S, B, A); 
        pg.strokeWeight(d)  ; 
        pg.line(beginCornerL.x, beginCornerL.y, mouseX, mouseY);
      }
    }
  }
}
class Rectangle {
  PVector beginCornerL = new PVector();
  PVector endCornerL = new PVector();
  //int xLine=1;
  int mOdulo;
  float distX;
  float distY;

  Rectangle(int xL) {
    xLine= xL;
  }


  void rectDraw(float H, float S, float B,float A, float d) { 
    mOdulo= xLine % 2;
    //println(mOdulo);
    println(xLine);


    if (mOdulo==1) { 
      beginCornerL = new PVector(mouseX, mouseY);
    }
    if (mOdulo==0) {
      endCornerL = new PVector(mouseX, mouseY);


      if (mOdulo==0 && mousePressed) { 
        pg.rectMode(CORNER);
        pg.fill(H, S, B, A);
        pg.strokeWeight(d); 
        pg.rect(beginCornerL.x, beginCornerL.y, distX, distY);
      }
    }
  }
  void distCalc() {
    distX= dist(endCornerL.x, endCornerL.y, beginCornerL.x, endCornerL.y); 
    distY= dist(endCornerL.x, endCornerL.y, endCornerL.x, beginCornerL.y);
  }
}
class brush5 {
  PImage st; 
  float pX;
  float pY;

  brush5(PImage stroke) {
    st=stroke;
  }

  void drawBrush5(float H, float S, float B, float A, float d) { 
      pX= lerp(pX, pmouseX, 0.5);
      pY= lerp(pY, mouseY, 0.5);
    if (mousePressed) {
      for (float i=0.5; i<1; i+=0.1) {
        pg.colorMode(HSB);
        pg.tint(H, S, B, A); 
        pg.imageMode(CENTER);

        pg.image(st, pX, pY, d, d);
      }
    }
  }
}
class brush6 {
  PImage st; 
  float pX;
  float pY;
  brush6(PImage stroke2) {
    st=stroke2;
  }

  void drawBrush6(float H, float S, float B, float A, float d) { 
      pX= lerp(pX, pmouseX, 0.5);
      pY= lerp(pY, mouseY, 0.5);
    if (mousePressed) {
      for (float i=0.5; i<1; i+=0.1) {
        pg.colorMode(HSB);
        pg.tint(H, S, B, A); 
        pg.imageMode(CENTER);

        pg.image(st, pX, pY, d, d);
      }
    }
  }
}