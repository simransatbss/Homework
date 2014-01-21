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
  float newy = y -20;
  
    
  stroke(0);
  noFill();
  ellipse(newx, newy, newRadius, newRadius);
  if(radius > 2) {
    drawCircle(newx + 100, newy - 100, newRadius);
 
  }
}
