float angle=0;
float Avel=0;
float Acc=0.001;
int c=50;

void setup(){ 
  size(500,500);
  //background(#FFFFFF);
} 

void draw(){ 
  fill(175);
  stroke(#FFFFFF);
  //rectMode(CENTER);
 // translate(width/2,height/2);
  background(#000000);
  rotate(angle);
  ellipse(width/2-c,height/2-c,20,20);
  ellipse(width/2+c,height/2+c,20,20);
  c-=0.0001;
   Avel+=Acc;
   angle+=Avel;
}
