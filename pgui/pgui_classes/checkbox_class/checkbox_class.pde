//check ☐ class
checkBox box = new checkBox(15, 15, 10, "placeholder");

void setup() {
  size(100, 50);
}

void draw() {
  background(125);
  drawFrameRate();
  
  box.update();
}

void drawFrameRate() {
  fill(200);
  text(frameRate, -1, 10);
}

class checkBox {
  color backFill = #505050;
  color hoverFill = #909090;
  color enableFill = #900090;
  String txt;
  int xpos, ypos, s;
  boolean hovered, toggled = false;
  checkBox(int x, int y, int size, String text) {
    xpos = x;
    ypos = y;
    s = size;
    txt = text;
  }
  void update() {
    fill(255);
    text(txt, xpos + (s * 1.5), ypos + 9);
    hovered = ((mouseX >= xpos && mouseX <= xpos + s + textWidth(txt)) && (mouseY >= ypos && mouseY <= ypos + s));
    if(!hovered)
    {
      fill(backFill);
      rect(xpos, ypos, s, s);
    } else if(!mousePressed) {
      fill(hoverFill);
      rect(xpos, ypos, s, s);
    } else {
      toggled = !toggled;
      delay(50);
    }
    
    if(toggled) {
      fill(enableFill);
      rect(xpos + 2, ypos + 2, s - 4, s - 4);
    }
  }
}
