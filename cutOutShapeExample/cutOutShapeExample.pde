import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import controlP5.*;
ControlP5 cp5;

int sliderValue = 10;
float sliderValue2 = 0.85;
PShape s;
float r;

void setup() {
  size(800, 800);  
  smooth(8);
  
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setRange(1, 20);
     
  cp5.addSlider("sliderValue2")
     .setPosition(100, 70)
     .setRange(0.5, 1.0);
     
  r = 1.0;
  
  Ani.init(this);

}

void draw() {
  s = createShape();
  s.beginShape();
  s.noStroke();
  s.fill(250, 30, 30);
  
  int pNum = 100;
  if (frameCount%60 == 0) {
    Ani.to(this, 3.5, "r", random(0.55, 1.55));
  }
  
  for(int i=0; i < pNum; i++) {
    float oneCirc = map(i, 0, pNum - 1, 0, TWO_PI);
    float dyn = map(i, 0, pNum - 1, 0, sliderValue*TWO_PI);
    float mod = map(sin(dyn), -1, 1, sliderValue2, 1);
    float _x = cos(oneCirc) * 400 * mod * r;
    float _y = sin(oneCirc) * 400 * mod * r;
    s.vertex(_x, _y);
  }
  
  s.beginContour();
  for(int i=0; i < pNum; i++) {
    float oneCirc = map(i, 0, pNum - 1, 0, TWO_PI);
    float dyn = map(i, 0, pNum - 1, 0, sliderValue*TWO_PI);
    float mod = map(sin(dyn), -1, 1, sliderValue2, 1);
    float _x = sin(oneCirc) * 100;
    float _y = cos(oneCirc) * 100;
    s.vertex(_x, _y);
  }
  s.endContour();
  s.endShape();
  
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  shape(s);
  popMatrix();
  
  
}