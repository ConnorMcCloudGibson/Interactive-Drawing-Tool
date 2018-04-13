

class Button {
  PImage img;
  PVector Pos = new PVector(0, 0); 
  float h;
  float w;
  int id;
  color colour = color(255, 255, 255);
  boolean clicked=false;
  boolean clicked2;
  int aSize;
  float offSetX;
  float offSetY;
  int i;
  float imgScale=0.5; 

  Button[] others;

  Button(int idin, float xin, float yin, float Width, float Height, PImage icon, Button[] oin, float oSx, float oSy, int size) {
    Pos.x = xin;
    Pos.y = yin;
    w=Width; 
    h=Height; 
    id = idin;
    others = oin;
    aSize=size;
    offSetX=oSx;
    offSetY=oSy;
    img= icon;
  }
  void mouseReleased() {
    for (int i = id+1; i < aSize; i++) { 
      clicked2 = others[i].clicked;
      //println(Buttons[2].clicked);
    }
    if (mousePressed && mouseX>0+offSetX && mouseX <Pos.x+offSetX && mouseY>((Pos.y*id)+(s/2))+offSetY && mouseY<(Pos.y*id)+h+(s/2)+offSetY) { 
      clicked=true;
      colour = color(255, 0, 200, 255);
      imgScale=0.8;
    } else if (mousePressed && mouseX>0+offSetX && mouseX<Pos.x +offSetX && mouseY> offSetY && mouseY<(Pos.y*aSize)+(s/2)+offSetY) {
      clicked=false;
      colour = color(255, 0, 255, 255);
      imgScale=0.6;
    }
  } 

  void display() {

    stroke(0);
    rectMode(CENTER);
    colorMode(HSB);
    fill(255, 0, 255, 255);
    rect((Pos.x/2)+offSetX, (id*Pos.y)+(Pos.y/2)+(s/2)+offSetY, w, h);
    fill(colour); 
    rect((Pos.x/2)+offSetX, (id*Pos.y)+(Pos.y/2)+(s/2)+offSetY, w*0.8, h*0.8);
    tint(255,255);
    imageMode(CENTER);
    image(img, (Pos.x/2)+offSetX, (id*Pos.y)+(Pos.y/2)+s/2+ offSetY, w*imgScale, h*imgScale);
    fill(255, 0, 255);
  }
}

//COLOUR SLIDER OBJECT
class colourSlide { 

  float barWidth=300; 
  float _hueValue =barWidth/2; 
  float xP;
  float yP;
  float hueValue;
  float sWidth;
  float sHeight;

  colourSlide(float barW, float x, float y) { 
    barWidth=barW; 
    xP=x; 
    yP=y;
  } 

  colourSlide() {
  }

  void sDraw() {
    _hueValue=drawSlider(xP, yP, barWidth, 10, _hueValue);
  }

  float drawSlider(float xPos, float yPos, float sWidth, float sHeight, float hueValue) {
    fill(255);
    noStroke(); 
    //rect(xPos-5,yPos-10,sWidth+10,sHeight+20);

    float sliderPosition=map(hueValue, 0.0, 255.0, 0.0, sWidth);

    for (int i=0; i<sWidth; i++) { 
      float hueValues=map(i, 0.0, sWidth, 0.0, 255.0); 
      stroke(hueValues, 255, 255, 255);
      line(xPos+i, yPos, xPos+i, yPos+sHeight);
    }
    if (mousePressed && mouseX>xPos && mouseX<(xPos+sWidth) && mouseY> yPos && mouseY<(yPos+sHeight)) { 
      sliderPosition=mouseX-xPos; 
      hueValue=map(sliderPosition, 0.0, sWidth, 0.0, 255.0);
    } 
    colorMode(HSB);
    stroke(_hueValue, 220, 180, 255);
    fill(_hueValue, 255, 255, 255); 
    rect(sliderPosition+xPos, yPos+(sHeight/2), 2, sHeight);
    //float Hues=hueValue;
    return hueValue;
  }
}

//BRIGHTNESS SLIDER OBJECT
class mrbrightSlide { 

  float barWidth=300; 
  float _hueValue =barWidth/2; 
  float xP;
  float yP;
  float hueValue;
  float sWidth;
  float sHeight;
  float h;

  mrbrightSlide(float barW, float x, float y) { 
    barWidth=barW; 
    xP=x; 
    yP=y;
  } 

  mrbrightSlide() {
  }

  void sDraw() {
    _hueValue=drawSlider(xP, yP, barWidth, 10, _hueValue);
  }

  float drawSlider(float xPos, float yPos, float sWidth, float sHeight, float hueValue) {
    fill(255);
    noStroke(); 
    //rect(xPos-5,yPos-10,sWidth+10,sHeight+20);

    float sliderPosition=map(hueValue, 0.0, 255.0, 0.0, sWidth);

    for (int i=0; i<sWidth; i++) { 
      float hueValues=map(i, 0.0, sWidth, 0.0, 255.0); 
      stroke(h, 0, hueValues);
      line(xPos+i, yPos, xPos+i, yPos+sHeight);
    }

    if (mousePressed && mouseX>xPos && mouseX<(xPos+sWidth) && mouseY> yPos && mouseY<(yPos+sHeight)) { 
      sliderPosition=mouseX-xPos; 
      hueValue=map(sliderPosition, 0.0, sWidth, 0.0, 255.0);
    } 

    colorMode(HSB);
    stroke(255, 255, (-1*_hueValue)+_hueValue, 255);
    fill(h, 0, hueValue, 255); 
    rect(sliderPosition+xPos, yPos+(sHeight/2), 2, sHeight);
    //float Hues=hueValue;
    return hueValue;
  }
}
//BRIGHTNESS SLIDER OBJECT
class saturator { 

  float barWidth=300; 
  float _hueValue =barWidth/2; 
  float xP;
  float yP;
  float hueValue;
  boolean Hue=false;
  boolean paint;
  float sWidth;
  float sHeight;

  //SATURATION SLIDER

  saturator(float barW, float x, float y) { 
    barWidth=barW; 
    xP=x; 
    yP=y;
  } 

  saturator() {
  }

  void sDraw() {
    _hueValue=drawSlider(xP, yP, barWidth, 10, _hueValue);
  }

  float drawSlider(float xPos, float yPos, float sWidth, float sHeight, float hueValue) {
    fill(255,255);
    noStroke(); 
    //rect(xPos-5,yPos-10,sWidth+10,sHeight+20);

    float sliderPosition=map(hueValue, 0.0, 255.0, 0.0, sWidth);

    for (int i=0; i<sWidth; i++) { 
      float hueValues=map(i, 0.0, sWidth, 0.0, 255.0); 
      stroke(255, hueValues, 255, 255);
      line(xPos+i, yPos, xPos+i, yPos+sHeight);
    }

    if (mousePressed && mouseX>xPos && mouseX<(xPos+sWidth) && mouseY> yPos && mouseY<(yPos+sHeight)) { 
      sliderPosition=mouseX-xPos; 
      hueValue=map(sliderPosition, 0.0, sWidth, 0.0, 255.0);
    } 

    colorMode(HSB);
    stroke(0, _hueValue, 0, 255);
    fill(255, _hueValue, 0, 255); 
    rect(sliderPosition+xPos, yPos+(sHeight/2), 2, sHeight);
    //float Hues=hueValue;
    return hueValue;
  }

  //STROKE-WEIGHT SLIDER
}
class weightSlider {

  float _barWidth=300.0;    
  float _hueVal=_barWidth/2;  
  float xPos;
  float yPos;
  float barHeight;
  float sW;

  weightSlider(float Width, float x, float y, float bHeight) { 
    _barWidth=Width;
    xPos=x;
    yPos=y;
    barHeight=bHeight;
  }
  void wDraw() {

    _hueVal= drawSlider(xPos, yPos, _barWidth, barHeight, _hueVal);
  }

  float drawSlider(float xPos, float yPos, float sWidth, float sHeight, float pixSize) {
    fill(255, 255);
    stroke(0);
    rectMode(CENTER);
    rect(xPos+sWidth/2, yPos+sHeight/4, sWidth, sHeight*0.5);  
    fill(245, 255);
    rect(xPos+sWidth/2, yPos+sHeight/4, sWidth*0.9, sHeight*0.32);  

    float sliderPos=map(pixSize, 0.0, 255, 0.0, sWidth); 

    if (mousePressed && mouseX>xPos && mouseX<xPos+sWidth && mouseY>yPos && mouseY <yPos+(sHeight*0.32)) {
      sliderPos=mouseX-xPos;
      pixSize=map(sliderPos, 0.0, sWidth, 0.0, 255);
    }
    float sliderPos2=map(sliderPos, 0, sWidth, sWidth*0.05, sWidth*0.95);
    float strokeWeight=map(pixSize, 0, 255, 0, 100);
    stroke(100, 255);
    fill(0);  
    rectMode(CENTER);
    rect(sliderPos2+xPos, yPos+(sHeight/4), 2, sHeight*0.32); 

    sW=strokeWeight;
    mono = loadFont("ArialMT-10.vlw");
    //textAlign(CORNER); 
    text("STROKE " + int(strokeWeight), xPos+sWidth/5, yPos+(sHeight/4)+4);
    return(pixSize);
  }
}
class opacitySlider {

  float _barWidth=300.0;    
  float _hueVal=_barWidth/2;  
  float xPos;
  float yPos;
  float barHeight;
  float sW;

  opacitySlider(float Width, float x, float y, float bHeight) { 
    _barWidth=Width;
    xPos=x;
    yPos=y;
    barHeight=bHeight;
  }
    void wDraw() {

    _hueVal= drawSlider(xPos, yPos, _barWidth, barHeight, _hueVal);
  }

  float drawSlider(float xPos, float yPos, float sWidth, float sHeight, float pixSize) {
    fill(255,255);
    stroke(0);
    rectMode(CENTER);
    rect(xPos+sWidth/2, yPos+sHeight/4, sWidth, sHeight*0.5);  
    fill(245,255);
    rect(xPos+sWidth/2, yPos+sHeight/4, sWidth*0.9, sHeight*0.32);  

    float sliderPos=map(pixSize, 0.0, 255, 0.0, sWidth); 

    if (mousePressed && mouseX>xPos && mouseX<xPos+sWidth && mouseY>yPos && mouseY <yPos+(sHeight*0.32)) {
      sliderPos=mouseX-xPos;
      pixSize=map(sliderPos, 0.0, sWidth, 0.0, 255);
    }
    float sliderPos2=map(sliderPos, 0, sWidth, sWidth*0.05, sWidth*0.95);
    float strokeWeight=map(pixSize, 0, 255, 0, 255);
    stroke(100,255);
    fill(0,255);  
    rectMode(CENTER);
    rect(sliderPos2+xPos, yPos+(sHeight/4), 2, sHeight*0.32); 

    sW=strokeWeight;
    mono = loadFont("ArialMT-10.vlw");
    text("OPACITY " + int(strokeWeight), xPos+sWidth/5, yPos+(sHeight/4)+4);
    return(pixSize);
  }
}