class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets; // = new planet[3];
  float orbitspeed;

  Planet(float r, float d, float o) {
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    orbitspeed = o;
    
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
      float d = random(50, 150);
      float o = random(-0.1, 0.1);
      planets[i] = new Planet(r, d/level,o);
      if (level < 4){
        int num = int(random(0,4));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  void show() {
    pushMatrix();
    rotate(angle);
    translate(distance,0);
  
    fill(255,100);
    ellipse(0, 0, radius*2, radius*2);
    if (planets != null) {
      println(planets.length);
      for (int i =0; i <planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}
