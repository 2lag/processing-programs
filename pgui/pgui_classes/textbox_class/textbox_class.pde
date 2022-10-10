//text ☐ class
textBox tb = new textBox(10, 59, 180);

void setup() {
  size(200, 150);
}

void draw() {
  tb.update();
}

class textBox {
  String text = "";
  char inputchar;
  int d = 100;
  int x, y, w, h = 16;
  boolean clicked;
  color textColor = #FFFFFF;
  color boxColor = #323232;
  color bg = #828282;
  textBox(int xpos, int ypos, int boxwidth) {
    x = xpos;
    y = ypos;
    w = boxwidth;
  }
  void update() {
    drawTextBox();
    getInput();
  }
  void drawTextBox() {
    fill(boxColor);
    rect(x, y, w, h);
    fill(textColor);
    text(text, x + 2, y + 12);
  }
  void getInput() {
    if ((mouseX >= x && mouseX <= x + w) && (mouseY >= y && mouseY <= y + h)) {
      if (keyPressed) {
        if (key == BACKSPACE && text.length() > 0)
        {
          text = text.substring(0, text.length() - 1);
          delay(d);
        }
        else if (!(textWidth(text) > w - 4))
        {
          text += str(key);
          delay(d);
        }
      }
    }
  }
}
