let img;

function preload(){
  img = loadImage("C:/img_jk/Sun.jpg");
}

function setup(){
  createCanvas(500, 400);
  background(img);
}

function draw() { 
  background(220);
  
  push();
  translate(-100, -100);
  texture(img);
  sphere(img.width, img.height);
  pop();
}
