PImage gradient;
PGraphics shape;

void setup() {
  size(500, 500);
  gradient = createImage(width, height, RGB);
  shape = createGraphics(width, height, JAVA2D);
}
 
void draw() {
  background(255);
  drawGradient();
  drawShape(8, 0.005);
  gradient.mask(shape);
  image(gradient, 0, 0);
}
 
void drawGradient() {
  colorMode(HSB, 300, 100, 100);
  gradient.loadPixels();
  for (int y=0; y<gradient.height; y++) {
    for (int x=0; x<gradient.width; x++) {
      int index = x + y * gradient.width;
      float distance = dist(x, y, mouseX, mouseY);
      gradient.pixels[index] = color(distance, 100, 100);
    }
  }
  gradient.updatePixels();
  colorMode(RGB, 255, 255, 255);
}
 
void drawShape(int numPoints, float speed) {
  shape.beginDraw();
  shape.background(0);
  shape.noStroke();
  shape.fill(255);
  shape.beginShape();
  float fc = frameCount * speed;
  float x = noise(fc+numPoints-1)*shape.width;
  float y = noise(fc+numPoints)*shape.height;
  shape.curveVertex(x, y);
  for (int i=0; i<numPoints; i++) {
    x = noise(fc+i)*shape.width;
    y = noise(fc+i+1)*shape.height;
    shape.curveVertex(x, y);
  }
  x = noise(fc)*shape.width;
  y = noise(fc-1)*shape.height;
  shape.curveVertex(x, y);
  shape.endShape();
  shape.endDraw();
}