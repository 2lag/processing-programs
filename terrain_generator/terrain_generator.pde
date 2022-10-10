// 3D terrain generator
int col, row, scale = 20, w = 1800, h = 2800;
float[][] terrain;
float moving;

void setup() {
  size(800, 600, P3D);
  
  col = w / scale;
  row = h / scale;
  
  terrain = new float[col][row];
}

void draw() {
  moving -= .01;
  float yoffset = moving;
  for(int y = 0; y < row; y++) {
    float xoffset = 0;
    for(int x = 0; x < col; x++) {
      terrain[x][y] = map(noise(xoffset, yoffset), 0, 1, -150, 100);
      xoffset += .1;
    }
    yoffset += .1;
  }
  
  noFill();
  stroke(255, 0, 255);
  background(50);
  
  translate(width / 2, height / 2);
  rotateX(PI/3);
  translate(-w / 2, -h / 2);
  
  for(int y = 0; y < row - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < col; x++) {
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y + 1]);
    }
    endShape();
  }
}
