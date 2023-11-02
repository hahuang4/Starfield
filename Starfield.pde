class Particle {
  double myX, myY, mySpeed, myAngle;
  int myColor;

  Particle() {
    myX = myY = 200;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }

  void move() {
    myX += mySpeed * Math.cos(myAngle);
    myY += mySpeed * Math.sin(myAngle);
  }

  void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, 10, 10);
  }
}

class OddballParticle extends Particle {
  OddballParticle() {
    super(); 
  }

  void move() {
    myX = 200; 
    myY = 300;
    myX += mySpeed + (int)(Math.random()*10)-1; 
    myY += mySpeed + (int)(Math.random()*10)-1;
  }

  void show() {
    fill(255, 0, 0); 
    noStroke();
    ellipse((float)myX, (float)myY, 50, 50);
  }
}

Particle[] parts = new Particle[1000];
boolean start = false;

void setup() {
   size(400,600);
    for(int i=0; i<parts.length;i++)
    parts[i]=new Particle();
    parts[0]=new OddballParticle();

}

void draw() {
  background(0);
  for (int i = 0; i < parts.length; i++) {
    parts[i].move();
    parts[i].show();
  }
}
