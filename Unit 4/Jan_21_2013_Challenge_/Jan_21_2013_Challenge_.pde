void setup() {
  noFill();
  size(800,800);
  background(255);
  drawCircle(width/2,height/2, height/4, 20, -20);
  drawCircle(width/2,height/2, height/4, 20, 20);
  drawCircle(width/2,height/2, height/4, -20, -20);
  drawCircle(width/2,height/2,height/4, -20, 20);
}
  
void drawCircle(float x, float y, float radius, float xchange, float ychange) {
  ellipse(x, y, radius-15, radius-15);
  if(radius > 20) {
    drawCircle(x+ xchange, y + ychange, radius-15, xchange, ychange);
   
  }
}
