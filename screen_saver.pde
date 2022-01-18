class Oscillator{ 
  PVector angle;
  PVector vel;
  PVector amp;
  
  Oscillator(){ 
    angle = new PVector();
    vel = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amp = new PVector(random(width/2),random(height/2));
  } 
  
  void oscillate(){ 
    angle.add(vel);
    //angle+=vel;
  } 
  
  void display(){ 
    float x= sin(angle.x)*amp.x;
    float y=sin(angle.y)*amp.y;
    
    pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    fill(#ADD8E6);
   line(0,0,x,y);
   // ellipse(x,y,16,16);
    popMatrix();
  }
}

Oscillator[] oscillate = new Oscillator[10];
void setup(){
  size(500,500);
  background(#FFFFFF);
  for(int i=0;i<oscillate.length;i++){ 
    oscillate[i] = new Oscillator();
  }
}

void draw(){ 
  for(int i=0;i<oscillate.length;i++){ 
    oscillate[i].display();
    oscillate[i].oscillate();
  }
}
