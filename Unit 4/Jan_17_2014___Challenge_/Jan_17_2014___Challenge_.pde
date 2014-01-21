void setup() {
  size(640,360);
}
 
void draw() {
  background(255);
  drawCircle(0,height/2,400);
}
 
void drawCircle(float x, float y, float radius) {
  stroke(0);
  noFill();
  ellipse(x, y, radius, radius);
  if(radius > 2) {
    drawCircle(x + radius/1.39, y, radius/2);
 
  }
}
