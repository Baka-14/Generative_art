class Mover{ 
  PVector location;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover(float m,float x,float y){ 
    mass = m;
    location = new PVector(x,y);
    vel= new PVector(0,0);
    acc = new PVector(0,0); 
  } 
  
  void applyForce(PVector force){ 
    PVector f = PVector.div(force,mass);
    acc.add(f);
  }
  
  void update(){ 
    vel.add(acc);
    location.add(vel);
    acc.mult(0);
  } 
  
  void display(){ 
    stroke(0);
    fill(random(1,225),random(1,225),random(1,225));
    ellipse(location.x,location.y,mass*16,mass*16);
  }
  
  void checkEdges(){ 
    if(location.x>width){ 
      location.x=width;
      vel.x*=-1;
    }
    else if(location.x<0){ 
      vel.x*=-1;
      location.x=0;
    }
    
    if(location.y>height){ 
      vel.y*=-1;
      location.y=height;
    }
  }
}

Mover[] movers = new Mover[100];

void setup(){ 
  background(225);
  size(1000,1000);
  for(int i=0;i<movers.length;i++){ 
    movers[i]=new Mover(random(0.1,2),0,0);
  }
}

void draw(){ 
  
  PVector wind = new PVector(0.01,0); //slight wind in the positive x direction aka right
  PVector g = new PVector(0,0.1); //more stronger gravitational force that acts downward 
  
  for(int i=0;i<movers.length;i++){ 
    movers[i].applyForce(wind);
    movers[i].applyForce(g);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
