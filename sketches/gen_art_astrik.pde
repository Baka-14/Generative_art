class Mover{ 
  PVector location;
  PVector vel;
  PVector acc;
  float m;
  
  Mover(float ma,float x,float y){
    m=ma;
    location = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector (0,0);
  } 
  
  void applyforce(PVector force){ 
    PVector f = PVector.div(force,m);
    acc.add(f);
  } 
  
  void update(){
    vel.add(acc);
    location.add(vel);
    acc.mult(0);
  }
  
  void display(){ 
    stroke(#add8e6); //no outline aka border 
    fill(#FFFFFF);
    ellipse(location.x,location.y,m*16,m*16);
  } 
  
  void checkEdges() {
    if (location.x > width) {
    location.x = width;
    vel.x *= -1;
    } 
    else if (location.x < 0) {
        vel.x *= -1;
        location.x = 0;
     }
   if (location.y > height) {
     vel.y*=-1;
     location.y=height;
   }
  }
}

class Attractor{ 
  float mass;
  PVector location;
  float G;
  
  Attractor(){
    location = new PVector(width/2,height/2);
    mass=20; 
    G=5;
  }
  
  PVector attract(Mover m){ 
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    //if distance is really small
    //say dis=0; then the force would be infinite 
    //so to handle shit like this we constrain the distance
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength =(G*mass*m.m)/(distance*distance); 
    force.mult(strength);
    return force;
  }
  
  void display(){ 
    stroke(0);
    fill(175,200);
   // ellipse(location.x,location.y,mass*2,mass*2);
  }
}
    
   
   Mover[] movers = new Mover[10];
  // Mover up;
   Attractor a;
   
  void setup(){ 
    background(#00008B);
    size(600,600);
    for(int i=0;i<movers.length;i++){
   movers[i] = new Mover(1.7,random(width),random(height));
    }
    
   a = new Attractor();
  }
  
  void draw(){ 
  // background(225);
  for(int i=0;i<movers.length;i++){
   PVector f = a.attract(movers[i]);
   movers[i].applyforce(f);
   //a.display();
   movers[i].update();
   movers[i].display();
  }
  }
