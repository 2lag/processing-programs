//multi ☐↓ class
String[] s = {"option 1","options 2", "option num 3"};
multiBox box = new multiBox(s, 14, 14);

void setup() {
  size(200, 300);
}

void draw() {
  background(180);
  box.update();
}

class multiBox {
  boolean opened = false;
  String displayText = "";
  String linker = ", ";
  int padding = 16;
  int w, h = 16, x, y;
  int longestptr = 0;
  String[] options;
  boolean[] selected = {false, false, false};
  color boxColor = #383838; color textColor = #FFFFFF; color dropColor = #434343;
  multiBox(String[] list, int xpos, int ypos) {
    options = list;
    x = xpos;
    y = ypos;
  }
  void update() {
     w = int(textWidth(displayText));
     drawBaseBox();
     drawText();
  }
  int getOverrideWidth() {
    for(int i = 0; i < options.length; i++) {
      if(textWidth(options[i]) >= textWidth(options[longestptr]))
        longestptr = i;
    }
    if(w < int(textWidth(options[longestptr])))
      return int(textWidth(options[longestptr]));;
    return w;
  }
  void drawBaseBox() {
    stroke(0);
    fill(boxColor);
    w = getOverrideWidth();
    rect(x - (padding / 2), y, w + 16, h);
  }
  void drawText() {
    fill(textColor);
    displayText = "";
    for(int i = 0; i < options.length; i++) {
      if(selected[i])
        displayText += options[i] + linker;
    }
    text(displayText, x, y + 12);
    if(!opened)
      text("↓", x + w - 4, y + 12);
    else
      text("↑", x + w - 4, y + 12);
    updateSelected();
  }
  void updateSelected() {
    if((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + w + 16) && (mouseY >= y && mouseY <= y + h) && mousePressed)
    {
      opened = !opened;
      delay(50);
    }
    if(opened) {
      for(int i = 1; i <= options.length; i++) {
        fill(dropColor);
        w = getOverrideWidth();
        rect(x - (padding / 2), y + (h * i), w + 16, h);
        fill(textColor);
        text(options[i - 1], x, y+ (h * i) + 12);
        //if statement to check which option is clicked then set selected text to true
        if(((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + textWidth(options[i - 1]) + 16) && (mouseY >= y + (h * i) && mouseY <= y + (h * i) + h)) && mousePressed)
        {
          selected[i - 1] = !selected[i - 1];
          delay(50);
        }
      }
    }
  }
}
