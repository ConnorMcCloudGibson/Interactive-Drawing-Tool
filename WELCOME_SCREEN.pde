float inc=0.1;
float angles;
int scl=10; 
int cols; 
int rows; 
float zoff=0; 
//int i;
int ps=250;
Particle[] particle = new Particle[ps];
PVector[] flowField;
PGraphics pg2; 
float c2=5; 
float c3=255;



class welcome { 
  welcome() {
  }

  void drawWelcome() { 
      c3-=0.01;
    //background(255); 



    float yoff= 0; 
    for (int y=0; y< rows; y++) { 
      float xoff=0;

      for (int x=0; x< cols; x++) { 
        int i = (x+y*cols);
        float angle = ((noise(xoff, yoff, zoff)*TWO_PI+(angles*PI))); 

        PVector vector = new PVector(0, 0).fromAngle(angle).setMag(5);
        flowField[i]= vector;



        //fill(an);
        xoff +=inc;
        //stroke(0, 0, 0, 125); 
        //pushMatrix();
        //translate(x*scl, y*scl);
        //rotate(vector.heading());
        ////rect(x*scl,y*scl,scl,scl);
        //line(0, 0, scl, 0);
        angle = (angles/360)*TWO_PI;
        //popMatrix();
      }
      yoff +=inc;
    } 
    zoff += 0.008;


    for (int i=0; i<particle.length; i++) {
      particle[i].fol(flowField);
      //particle[i].appForce(vector);
      particle[i].update();
      particle[i].display();
      particle[i].edgedet();
    }
    float sC;
    for (sC =0; sC<0.3; sC++);

    //loadPixels();
    ////pushMatrix(); 
    //// //translate(-width/2, -height/2);
    //// scale(1);
    ////translate(+width/2, +height/2);
    //imageMode(CENTER); 
    //image(pg2, height/2, width/2, width,height); 
    ////popMatrix(); 
    //updatePixels();
  }
}

class Particle {

  PVector pos = new PVector(random(width), random(height));
  PVector vel = new PVector(0,0); 
  PVector acc = new PVector(0, 0); 
  int maxSpeed=1;


  void update() { 
    pos.add(vel);
    vel.add(acc); 
    vel.limit(maxSpeed);
    acc.mult(0);
  }


  void fol(PVector[] v) {  
    int x = floor(pos.x/scl); 
    int y = floor(pos.y/scl); 
    int index = x + y* cols; 
    PVector force = v[index]; 
    applyForce(force);
  }
  void applyForce(PVector force) { 
    acc.add(force);
  }

  void display() {

    stroke(0, 0, 0, c2); 
    strokeWeight(2);

    point(pos.x, pos.y);



    strokeWeight(2);
    //textMode(CORNER);


    stroke(255, 120, 0, c2);
    point(pos.x+2, pos.y+2);
    fill(c3);
    textSize(60);
    text("PRESS ENTER", 20, 50);
    //textAlign(RIGHT);

  }

  void edgedet() { 
    if (pos.x > width-0.1) pos.x = 0.1;
    if (pos.x <0.1) pos.x = width- 0.1;
    if (pos.y >height-0.1) pos.y = 0.1;
    if (pos.y <0.1) pos.y = height- 0.1;
  }
}   