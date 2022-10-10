//toggle button class
button b = new button("button: ", 50, 92, 100);

void setup() {
  size(200, 200);
}

void draw() {
  background(b.bg);
  b.update();
}

class button {
  boolean toggled = false;
  char yes = '☑';
  char no  = '☒';
  color backFill = #323232;
  color black = #000000;
  color white = #FFFFFF;
  color bg = #828282;
  int x, y, w, h = 16, r = 5;
  String buttonText = "", outputText;
  button (String txt, int xpos, int ypos, int buttonwidth) {
    buttonText = txt;
    x = xpos;
    y = ypos;
    w = buttonwidth;
  }
  void update() {
    getWidth();
    drawButton();
    getButtonUpdates();
  }
  void getWidth() {
    if (toggled)
      outputText = buttonText + "ON";
    else
      outputText = buttonText + "OFF";

    w = int(textWidth(outputText)) + 8;
  }
  void drawButton() {
    fill(backFill);
    rect(x, y, w, h);
    fill(white);
    text(outputText, x + 4, y + 12);
  }
  void getButtonUpdates() {
    if (((mouseX >= x && mouseX <= x + w) && (mouseY >= y && mouseY <= y + h)) && mousePressed)
    {
      toggled = !toggled;
      delay(100);
    }
  }
}
