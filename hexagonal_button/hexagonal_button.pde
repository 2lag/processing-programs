//hexagonal button

hexButton hb = new hexButton(100, 65, 100, 50, "test hex button");

void setup() {
  size(200, 130);
}

void draw() {
  background(125);
  hb.update();
}

class hexButton {
  int cx, cy, w, h; //button defintions
  int currR = 120, currG = 120, currB = 120, strokeColor = 190; //colors
  String txt;
  hexButton(int centerx, int centery, int hexw, int hexh, String text) {
    cx = centerx;
    cy = centery;
    w = hexw;
    h = hexh;
    txt = text;
  }
  void update() {
    drawHex();
  }
  void updateColors() {
    //detect if mouse is within the hexagon and change color based on that
    stroke(strokeColor);
    if ((mouseX > cx - (w / 1.2) && mouseX < cx + (w / 1.2)) && (mouseY > cy - (h / 3) && mouseY < cy + (h / 3))) {
      if(mousePressed) {strokeColor = 80;} else {strokeColor = 190;}
      currR+=2;
      currB+=2;
      if (currR >= 170 || currB >= 170) {
        currR = 170;
        currB = 170;
      }
    } else {
      currR--;
      currB--;
      if (currR <= 120 || currB <= 120) {
        currR = 120;
        currB = 120;
      }
    }
    fill(currR, currG, currB);
  }
  void drawHex() {
    float x1 = cx - (w / 1.4), x4 = cx + (w / 1.4);
    int x2 = cx - (w / 2), x3 = cx + (w / 2);
    int y1 = cy - (h / 3), y2 = cy + (h / 3);

    updateColors();
    strokeWeight(1.5);
    beginShape();
    vertex(x1, cy); //middle left
    vertex(x2, y1); //top left
    vertex(x3, y1); //top right
    vertex(x4, cy); //middle right
    vertex(x3, y2); //bottom right
    vertex(x2, y2); //bottom left
    endShape(CLOSE);
    
    fill(strokeColor);
    textSize(15);
    text(txt, cx - textWidth(txt) / 2, cy + 5);
  }
}
