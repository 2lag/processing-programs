//knob class
knob k = new knob(width / 2, height / 2, -100, 100, 20, 4);

void setup() {
  size(100, 100);
}

void draw() {
  background(k.bg);
  k.update();
  println(k.value, k.editable);
}

class knob {
  color bg = #828282, black = #000000, knobFill = #323232, textFill = #FFFFFF, valPtrFill = #8a308a;
  boolean editable  = false; //tracks whether or not value can be changed by dragging mouse with the bool checks when editable true, when mouse is hovering knob and mousePressed, editable = !editable; with delay(250) after (maybe rework this idea)
  int min, max, value;                  //minimum and maximum values, then current value of knob
  int x, y, size;                       //knob center point & size
  String text;                          //output text
  int txtx;                             //text position
  int x2, y2, size2;                    //value pointer on knob point & size
  int value2;                           //map for scale of knob
  int scale;                            //scale for swiping
  knob(int x, int y, int min, int max, int size, int scale) {
    this.x = x;
    this.y = y;
    this.min = min;
    this.max = max;
    this.size = size;
    size2 = size / 3;
    value = (min + max) / 2;
    this.scale = scale;
  }
  void update() {
    updateVal();
    updateKnob();
    drawKnob();
  }
  void drawKnob() {
    fill(knobFill);
    circle(x, y, size);
    fill(valPtrFill);
    circle(x2, y2, size2);
    fill(textFill);
    text(text, txtx, y - 14);
  }
  void updateVal() {
    if (editable) {
      if (mouseX > pmouseX)
        value+=scale;
      if (mouseX < pmouseX)
        value-=scale;
      if (mouseY < pmouseY)
        value+=scale;
      if (mouseY > pmouseY)
        value-=scale;
      if (mousePressed) {
        editable = !editable;
        delay(150);
      }
    }
    if (value <= min) {
      value = min;
    }
    if (value >= max) {
      value = max;
    }
  }
  void updateKnob() {
    if ((mouseX > x - size / 2 && mouseX < x + size / 2) && (mouseY > y - size / 2 && mouseY < y + size / 2) && mousePressed) {
      editable = !editable;
      delay(150);
    }
    text = str(value);
    txtx = x - (int(textWidth(text)) / 2);
    value2 = int(map(value, min, max, -size * 4, size * 4));     //maps to scale of knob
    x2 = int(x + (int(size / 2) - 4) * sin(value2 * PI / 180));  //x position of value pointer
    y2 = int(y + (int(size / 2) - 4) * -cos(value2 * PI / 180));  //y position of value pointer
  }
}
