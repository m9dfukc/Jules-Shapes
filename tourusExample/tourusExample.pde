PVector[] scalings = new PVector[70];

void setup() {
  frameRate(60);
  size(900, 900);
  smooth(8);
  
  colorMode(HSB);
}

void generate() {
  int t = frameCount;
  for (int i=0; i < scalings.length; i++){
    t = t + 1;
    
    // try one of these also:
    //float w = sin(radians(3*t));
    //float h = sin(radians(2*t));
    
    //float w = sin(radians(5*t));
    //float h = sin(radians(4*t));
    
    //float w = sin(radians(7*t));
    //float h = sin(radians(3*t));
    
    float w = sin(radians(3*t));
    float h = sin(radians(5*t));
    scalings[i] = new PVector(w, h);
  }
}

void draw() {
  rectMode(CENTER);
  println(frameRate);
  generate();
  
  background(255);
  noFill();
  
  pushMatrix();
  translate(width/2, height/2);
  
  for (int i=0; i < scalings.length; i++){
    float alpha = map(i, 0, scalings.length, 5, 255);
    //stroke(map(i, 0, scalings.length, 10, 100), 90, 50, alpha);
    stroke(0, alpha);
     
    float w = map(scalings[i].x, -1, 1, 200, width-200);
    float h = map(scalings[i].y, -1, 1, 200, height-200);
    
    rotate(frameCount / 10000.0); //try this !!
    //circle(w, h); 
    ellipse(0, 0, w, h);
  }
  
  popMatrix();
}

void circle(float w, float h) {
  int res = 5;
  beginShape();
  for(int i=0; i < res; i++) {
      float t = map(i, 0, res - 1, 0, TWO_PI);
      float _x = cos(t) * w / 2.0;
      float _y = sin(t) * h / 2.0;
      vertex(_x, _y);
    }
  endShape();
}