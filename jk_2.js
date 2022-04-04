/*
camera, material, slider, lights
*/
var cols, rows;
var scl = 20;
var w = 1400;
var h = 1000;
let s;

var flying = 0;

var terrain = [];

function setup() {
  // 슬라이드 생성
  s = createSlider(0,255,127);
   ss = createSlider(0,255,127);
    sss = createSlider(0,255,127);
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
  // v라는 변수안에 슬라이드 값을 추가.
  let v = s.value();
  let vv = ss.value();
    let vvv = sss.value();
  let locX = mouseX - height / 2;
  let locY = mouseY - width / 2;

  // 다양한 lights 함수 추가
  ambientLight(60, 60, 60);
  pointLight(255, 255, 255, locX, locY, 100);
  
  shininess(10);  
  ambientLight(20);
  specularColor(120, 0, 0);
  pointLight(255, 0, 0, 0, -50, 50);
  specularColor(0, 120, 0);
  pointLight(0, 255, 0, 0, 50, 50);
  specularMaterial(100);  //specularColor 

  flying -= 0.01;
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
  //카메라에 다양한 인수 추가
  camera(0, 0, 400, x, y, 0, 0, 1, 0);
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
 
    // material 함수를 3개의 구체로 표현
    // sphere의 크기를 v값으로 받아서 슬라이드 조절에 따라서 sphere 크기 조절
    push();
    translate(width / 2, height/2);
    rotateZ(frameCount * 0.01);
    torus(80, 20, 64, 64);
    sphere(v);
    specularMaterial(250);
    pop();

    push();
    translate(width / 2+300, height / 2-100);
    rotateX(frameCount * 0.01);
    normalMaterial(255, 0, 0);
    torus(80, 20, 64, 64);
    sphere(vv);
    pop();

    push();
    translate(width / 2+600, height / 2-100);
    rotateY(frameCount * 0.01);
    torus(80, 20, 64, 64);
    sphere(vvv);
    ambientMaterial(50);
    pop();
    
    // push, pop
    push();
    fill(67,183,255);
    translate(w/2,h/2);
    translate(mouseX-width/2, (mouseY-height/2)*3);
    rotateX(PI/6);
    rotateY(PI/3);
    sphere(70);
    pop();
  }
}
