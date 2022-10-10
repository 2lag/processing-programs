void setup() {
  size(400,400);
}

int w = 10, y = 30;

void draw() {
  background(0);
  noStroke();
  fill(#523252);

  loading();
}

void loading() {
  translate(width/2,height/2);
  rotate(frameCount/100.);

  for(int i = 0; i < 6; i++) {
    rotate(frameCount / 100.0);
    ellipse(sin(frameCount / 20.0) * 20, 18, w, y);
    
    push();
    rotate(radians(30 / 2));
    ellipse(sin(frameCount / 20.0) * 20, 18, w, y);
    rotate(radians(30 / 2));
    ellipse(sin(frameCount / 20.0) * 20, 18, w, y);
    pop();
    
    rotate(radians(360/6));
  }
}
