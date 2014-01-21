void setup() {
  size(800,800);
}
 
void draw() {
  background(255);
  drawCircle(width/2,height/2,200);
}
 
void drawCircle(float x, float y, float radius) {
  float newRadius = radius - 20;
  float newx = x + 20;
  float newy = y - 20;
  float newx2 = x - 20;
  float newy2 = y - 20;
  
    
  stroke(0);
  noFill();
  ellipse(newx, newy, newRadius, newRadius);
  if(radius > 2) {
    drawCircle(newx, newy, newRadius);
    drawCircle(newx2, newy2, newRadius);
 
  }
}
