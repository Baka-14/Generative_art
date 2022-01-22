class Ball{ 
  PVector location;
  float angle;
  float r;
  float Avel;
  float Aacc;
  float m;
  
  Ball(float ma,float x){ 
    m=ma;
    r=x;
    location = new PVector(r*cos(angle),r*sin(angle)); 
    //Avel = new PVector(0,0); 
    //Aacc = new PVector(0,0); 
  }
  
  void display(){ 
    stroke(0);
    if(r<200){
    fill(#c00000);
    }
     if(r<300){
      fill(#096EE0);
    }
     if(r<35){
     fill(#1dc43f);
    }
     if(r<10){
       fill(#fff700);
    }
  else{
    fill(#FFFFFF);
  }
  ellipse(location.x,location.y,m*16,m*16);
  }
  
  void update(){
    angle+=0.05;
  }
  
}

Ball[] balls = new Ball[10];
Ball cen;

void setup(){
  size(500,500);
  background(#000000);
  cen = new Ball(2.0,0.0);
  for(int i=0;i<balls.length;i++){
    balls[i] = new Ball(1.5,random(0,400));
    //balls[i].display();
  }
}
  
void draw(){ 
  //background(#FFFFFF);
  fill(175);
  stroke(0);
  rectMode(CENTER);
  translate(width/2,height/2);
  cen.display();
  for(int i=0;i<balls.length;i++){
    pushMatrix();
  rotate(balls[i].angle);
  balls[i].angle+=120;
  balls[i].display();
  popMatrix();
  }
  
} 


  
  
  
  
  
