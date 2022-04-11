class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets; // = new planet[3];
  float orbitspeed;
  PVector v;
  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit(){
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i =0; i <planets.length; i++) {
        planets[i].orbit();
    }
    }
  }

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i =0; i <planets.length; i++) {
      float r = radius / (level*2);
      float d = random((radius + r),(radius+r)*2);
      float o = random(-0.1, 0.1);
      int index = int(random(0,textures.length));
      planets[i] = new Planet(r, d,o, textures[index]);
      if (level < 2){
        int num = int(random(0,3)); //int(random(0,4));    parameter edit
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    //rotate(angle);
    PVector v2 = new PVector(0,0,1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    //line(0,0,0,v.x*10, v.y*10, v.z*10);
    //line(0,0,0,v.x*10, v.y*10, v.z*10);
    
    translate(v.x, v.y, v.z);
    noStroke();
    fill(255);
    shape(globe);
   // sphere(radius);
    if (planets != null) {
      println(planets.length);
      for (int i =0; i <planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}
