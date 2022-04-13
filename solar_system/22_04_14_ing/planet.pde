class Planet {
  float radius;
  float angle;
  float distance;

  Planet[] planets; // = new planet[3];
  
  float orbitspeed;
  PVector v;
  PVector rot;
  PShape globe;
  

  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    orbitspeed = o;
    v.mult(distance);
    angle = random(TWO_PI);
    
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
 
  void spawnMoons(int total) {
    float[] pl_radius= {0.4,0.9,1,0.5,11.2,9.4,4.0,3.9};
    float[] pl_distance= {57,180,140,227,700,1400,2800*0.8,4500*0.8};
    //float[] pl_orbit =  {0.003,0.0018,0.4651,0.2411,12.6,9.87, 2.59, 2.68};
    float[] pl_orbit =  {10,10,10,10,10,10,10,10};
    planets = new Planet[total];
    for (int i =0; i <planets.length; i++) {
      float r = pl_radius[i] * 10 ; //pl_radius[i]
      float d = pl_distance[i];
      // random((radius + r),(radius+r)*2);
      float o = pl_orbit[i]*0.005; // ordit[i] 
      //int index = int(random(0,textures.length));
      planets[i] = new Planet(r,d,o, textures[i]);

      /*
      if (level < 2){
        int num = int(random(0,3)); //int(random(0,4));    parameter edit
        planets[i].spawnMoons(i, level+1);
      }*/
    }
  }
  void show() {
  
   // rot = new PVector(87.97, 224.7, 365.26, 686.96,
    //4333.29, 10756.20, 30707.49, 60223.35);
    //float m = rot.magSq();
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
      //println(planets.length);
      for (int i =0; i <planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}
