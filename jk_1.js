var cols, rows;
var scl = 20;
var w = 1400;
var h = 1000;
let s;

var flying = 0;

var terrain = [];

function setup() {
  s = createSlider(0,255,117);
  createCanvas(600, 600, WEBGL);
  cols = w / scl;
  rows = h / scl;

  for (var x = 0; x < cols; x++) {
    terrain[x] = [];
    for (var y = 0; y < rows; y++) {
      terrain[x][y] = 0; //specify a default value for now
    }
  }
}

function draw() {
  let v = s.value();
  let locX = mouseX - height / 2;
  let locY = mouseY - width / 2;

  ambientLight(60, 60, 60);
  pointLight(255, 255, 255, locX, locY, 100);

  flying -= 0.1;
  var yoff = flying;
  for (var y = 0; y < rows; y++) {
    var xoff = 0;
    for (var x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  background(0);
  noStroke();
  lights();
  var x = map(mouseX, 0, width, -100, 100);
  var y = map(mouseY, 0, height, -100, 100);
  camera(0, 0, 200, x, y, 0, 0, 1, 0);
  translate(50, 50);
  rotateX(PI / 3);
  fill(200, 200, 200, 150);
  translate(-w / 2, -h / 2);


  for (var y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (var x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
    }
    endShape();
  
    push();
    translate(width / 2, v);
    rotateZ(frameCount * 0.01);
    torus(80, 20, 64, 64);
    sphere(50);
    specularMaterial(250);
    pop();

    push();
    translate(width / 2+300, height / 2-100);
    rotateX(frameCount * 0.01);
    normalMaterial(255, 0, 0);
    torus(80, 20, 64, 64);
    sphere(50);
    pop();

    push();
    translate(width / 2+600, height / 2-100);
    rotateY(frameCount * 0.01);

    torus(80, 20, 64, 64);
    sphere(50);
    ambientMaterial(190);
    pop();
  }
}
