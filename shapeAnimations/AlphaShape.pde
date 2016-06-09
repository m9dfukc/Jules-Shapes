class AlphaShape extends CustomShape {
  PVector[] scalings;
  
  AlphaShape(float t) {
    super(t);
    scalings = new PVector[70];
  }
  
  void generate() {
    int t = frameCount;
    for (int i=0; i < scalings.length; i++){
      t = t + 1;
      float w = sin(radians(3*t));
      float h = sin(radians(5*t));
      scalings[i] = new PVector(w, h);
    }
  }
  
  void draw() {
    generate();
    noFill();
    stroke(255);
    pushMatrix(); 
    for (int i=0; i < scalings.length; i++){
      float alpha = map(i, 0, scalings.length, 5, 255);
      //stroke(map(i, 0, scalings.length, 10, 100), 90, 50, alpha);
      stroke(255, alpha);
      
      float w = map(scalings[i].x, -1, 1, 100 * dim, (width -100) * dim);
      float h = map(scalings[i].y, -1, 1, 100 * dim, (height-100) * dim);
      
      rotate(frameCount / 10000.0); //try this !!
      if (dim < 0.4) {
        ellipse(0, 0, w, h);
      } else {
        circle(w, h);
      }
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
 
}