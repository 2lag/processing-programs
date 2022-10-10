//combo ☐↓ class
String[] s = {"option 1","options 2"};
comboBox combo = new comboBox(s, 0, 80, 40);

void setup() {
  size(200, 300);
}

void draw() {
  background(180);
  combo.update();
}

class comboBox {
  boolean opened = false;
  int padding = 16;
  int w, h = 16, x, y;
  String[] options;
  int selected;
  int longestptr = 0;
  color boxColor = #383838; color textColor = #FFFFFF; color dropColor = #434343;
  comboBox(String[] list, int defaultselect, int xpos, int ypos) {
    options = list;
    selected = defaultselect;
    x = xpos;
    y = ypos;
  }
  void update() {
    getLongestWord();
    drawBaseBox();
    
  }
  void getLongestWord() {
    for(int i = 0; i < options.length - 1; i++){
      if(textWidth(options[i]) >= textWidth(options[longestptr]))
        longestptr = i;
    }
    w = int(textWidth(options[longestptr]) + padding);
  }
  void drawBaseBox() {
    stroke(0);
    fill(boxColor);
    rect(x - (padding / 2), y, w + 8, h);
    fill(textColor);
    text(options[selected], x, y + 12);
    if(!opened)
      text("↓", x + w - 10, y + 12);
    else
      text("↑", x + w - 10, y + 12);
    updateSelected();
  }
  void updateSelected() {
    if((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + w + 8) && (mouseY >= y && mouseY <= y + h) && mousePressed)
    {
      opened = !opened;
      delay(50);
    }
    if(opened) {
      for(int i = 1; i <= options.length; i++){
        fill(dropColor);
        rect(x - (padding / 2), y + (h * i), w + 8, h);
        fill(textColor);
        text(options[i - 1], x, y + (h * i) + 12);
        //if statement to check which option is clicked and set selected to that value
        if(((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + w + 8) && (mouseY >= y + (h * i) && mouseY <= y + (h * i) + h)) && mousePressed)
        {
          selected = i - 1;
          opened = false;
        }
      }
    }
  }
}
