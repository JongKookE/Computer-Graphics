import peasy.*;
PeasyCam cam;
Planet sun;

PImage sunTexture;
PImage[] textures = new PImage[8];
void setup(){
  size(1200,800,P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  textures[5] = loadImage("saturn.jpg");
  textures[6] = loadImage("uranus.jpg");
  textures[7] = loadImage("neptune.jpg");
  
  //textures[3...7]
  cam = new PeasyCam(this, 500);
  sun = new Planet(100,0,0, sunTexture);
  sun.spawnMoons(8);
}
void draw(){
  background(0);
  lights();
  //pointLight(255,255,255,0,0,0);
  sun.show();
  sun.orbit();


}
