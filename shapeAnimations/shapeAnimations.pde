import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

AlphaShape alphaShape;
CustomShape betaShape;
CustomShape gammaShape;
CustomShape thetaShape;
DeltaShape deltaShape;


float easeTime;

void setup() {
  frameRate(60);
  size(800, 800);  
  smooth(8);
  
  easeTime = 3;
  
  Ani.init(this);
  
  alphaShape = new AlphaShape(easeTime);
  betaShape = new CustomShape(easeTime);
  gammaShape = new CustomShape(easeTime);
  thetaShape = new CustomShape(easeTime);
  deltaShape = new DeltaShape(easeTime);

}

void draw() {
  
  background(0);
  
  if (frameCount%60 == 0) {
    alphaShape.setSensor(random(1000, 500000)); // here your sensor readings should go
    betaShape.setSensor(random(1000, 500000));
    gammaShape.setSensor(random(1000, 500000));
    thetaShape.setSensor(random(1000, 500000));
    deltaShape.setSensor(random(1000, 500000));
  }
  
  pushMatrix();
  translate(width/2, height/2);
  alphaShape.draw();
  //betaShape.draw();
  //gammaShape.draw();
  //thetaShape.draw();
  deltaShape.draw();
  popMatrix();
  

}