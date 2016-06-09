class CustomShape {
  float dim;
  float time;
  color c;

  CustomShape(float t) {
    time = t;
    dim = 0.0;
    c = color(random(255), random(255), random(255));
  }
  
  void setTime(float t) {
    time = t; 
  }
  
  void setSensor(float v) {
    float mapped = map(v, 1000, 500000, 0, 1);
    Ani.to(this, time, "dim", mapped);
  }
  
  void draw() {
    float size = width * dim;
    stroke(c);
    noFill();
    strokeWeight(3);
    ellipse(0, 0, size, size);
  }
}