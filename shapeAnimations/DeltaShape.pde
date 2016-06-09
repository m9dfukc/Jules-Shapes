class DeltaShape extends CustomShape {
  PShape s;
  float amp;
  int res;
  float randomWobbles;
  float randomAmp;
  float randomWobbles2;
  float randomAmp2;
  
  
  DeltaShape(float t) {
    super(t);
    res = 200;
    amp = 1.15;
    randomWobbles = round(random(3, 15));
    randomWobbles2 = round(random(3, 15));
    randomAmp  = 0.5;
    randomAmp2 = 0.5;
    generate();
  }
  
  void generate() {
    s = createShape();
    s.beginShape();
    s.noStroke();
    s.fill(c, 170);
    
    for(int i=0; i < res; i++) {
      float oneCirc = map(i, 0, res - 1, 0, TWO_PI);
      float dyn = map(i, 0, res - 1, 0, round(randomWobbles)*TWO_PI);
      float mod = map(sin(dyn), -1, 1, 1, randomAmp);
      float _x = cos(oneCirc) * 1 * mod;
      float _y = sin(oneCirc) * 1 * mod;
      s.vertex(_x, _y);
    } 
    
    s.beginContour();
    int bRes = int(res / 1.5);
    for(int i=0; i < bRes; i++) {
      float oneCirc = map(i, 0, bRes - 1, 0, TWO_PI);
      float dyn = map(i, 0, bRes - 1, 0, round(randomWobbles2)*TWO_PI);
      float mod = map(sin(dyn), -1, 1, 1, randomAmp2);
      float _x = sin(oneCirc) * 1 * mod * 0.5;
      float _y = cos(oneCirc) * 1 * mod * 0.5;
      s.vertex(_x, _y);
    }
    s.endContour();
    
    s.endShape();
  }
  
  void setSensor(float v) {
    super.setSensor(v);
    
    if (v > 300000) {
      Ani.to(this, time*2.0, "randomAmp", random(0.75, 1.25));
      Ani.to(this, time*2.0, "randomAmp2", random(0.75, 1.25));
      Ani.to(this, time*2.0, "randomWobbles", random(3, 15));
      Ani.to(this, time*2.0, "randomWobbles2", random(2, 12));
    }
  }
  
  void draw() {
    generate();
    float size = width * dim / 2.0;
    pushMatrix();
    scale(size);
    shape(s);
    popMatrix();
  }
}