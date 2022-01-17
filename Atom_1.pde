void setup(){ 
  size(500,400);
  background(#FFFFFF);
 
} 

void draw(){ 
   
  float period = 500;
  float amp = 100;
  float x= amp*cos(TWO_PI* frameCount/period);
  stroke(0);
  fill(175);
  translate(width/2,height/2);
  
  line(0,0,x,0);
  line(0,0,-x,0);
  
  line(0,0,-x/2,-x/2);
  line(0,0,-x/2,x/2);
  line(0,0,x/2,-x/2);
  line(0,0,x/2,x/2);
  
  line(0,0,0,x);
  line(0,0,0,-x);
  
  ellipse(-x,0,20,20);
  ellipse(x,0,20,20);
  ellipse(0,x,20,20);
  ellipse(0,-x,20,20);
  
  ellipse(-x/2,-x/2,16,16);
  ellipse(x/2,x/2,16,16);
  ellipse(x/2,-x/2,16,16);
  ellipse(-x/2,x/2,16,16);
  
}
