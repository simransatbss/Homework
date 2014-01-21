void setup (){
  size(900, 900);
  ellipse (0, height/2, height/2, height/2);
  drawCircle(height/2, 0);
}


void drawCircle (float radius, float priorX){

  //new ellipse-smaller
  ellipse(priorX+10, height/2, radius-20, radius-20);
  
  if (radius>20){
  drawCircle (radius-20, priorX+10);  
  }
}
