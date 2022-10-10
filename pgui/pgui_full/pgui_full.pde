//pgui full
button b = new button("sample button: ", 10, 10, 0);
keyBind kb = new keyBind("keybind: ", 120, 10);
checkBox ch = new checkBox(10, 30, 10, "enable slider");
sliderInt si = new sliderInt("height: ", 9, 49, 20, 90, 20, 100);
String[] mbOptions = { "sample option 1", "option 2", "number 3" };
multiBox mb = new multiBox(mbOptions, 248, 10);
String[] cbOptions = { "option 1", "sample option 2", "option 3" };
comboBox cb = new comboBox(cbOptions, 0, 17, 58);
textBox tb = new textBox(116, 58, 78);
knob k = new knob(227, 100, -50, 50, 20, 5);
/*
 button(String txt, int xpos, int ypos, int buttonwidth)
 keyBind(String name, int xpos, int ypos)
 checkBox(int x, int y, int size, String text)
 sliderInt(String name, int xpos, int ypos, float minimum, float maximum, float value, float size)
 multiBox(String[] list, int xpos, int ypos)
 comboBox(String[] list, int defaultselect, int xpos, int ypos)
 textBox(int xpos, int ypos, int boxwidth)
 knob(int x, int y, int min, int max, int size, int scale)
 */

void setup() {
  size(455, 150);
}

void draw() {
  background(120);
  b.update();
  if (b.toggled)
    kb.update();
  ch.update();
  mb.update();
  cb.update();
  if (ch.toggled)
    si.update();
  tb.update();
  k.update();
}







//PGUI CLASSES########################################################################################################################################################################################################################################################

class button {
  boolean toggled = false;
  color backFill = #323232, black = #000000, white = #FFFFFF, bg = #828282;
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

class checkBox {
  color backFill = #505050, hoverFill = #909090, enableFill = #900090;
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
    if (!((mouseX >= xpos && mouseX <= xpos + s + textWidth(txt)) && (mouseY >= ypos && mouseY <= ypos + s)))
    {
      fill(backFill);
      rect(xpos, ypos, s, s);
    } else if (!mousePressed) {
      fill(hoverFill);
      rect(xpos, ypos, s, s);
    } else {
      toggled = !toggled;
      delay(50);
    }
    if (toggled) {
      fill(enableFill);
      rect(xpos + 2, ypos + 2, s - 4, s - 4);
    }
  }
}

class comboBox {
  boolean opened = false;
  int w, h = 16, x, y, padding = 16, selected, longestptr = 0;
  String[] options;
  color boxColor = #383838, textColor = #FFFFFF, dropColor = #434343;
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
    for (int i = 0; i < options.length - 1; i++) {
      if (textWidth(options[i]) >= textWidth(options[longestptr]))
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
    if (!opened)
      text("↓", x + w - 10, y + 12);
    else
      text("↑", x + w - 10, y + 12);
    updateSelected();
  }
  void updateSelected() {
    if ((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + w + 8) && (mouseY >= y && mouseY <= y + h) && mousePressed)
    {
      opened = !opened;
      delay(50);
    }
    if (opened) {
      for (int i = 1; i <= options.length; i++) {
        fill(dropColor);
        rect(x - (padding / 2), y + (h * i), w + 8, h);
        fill(textColor);
        text(options[i - 1], x, y + (h * i) + 12);
        //if statement to check which option is clicked and set selected to that value
        if (((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + w + 8) && (mouseY >= y + (h * i) && mouseY <= y + (h * i) + h)) && mousePressed)
        {
          selected = i - 1;
          opened = false;
        }
      }
    }
  }
}

class sliderInt {
  color text = #FFFFFF, bg = #878787, slider = #000000, ball = #873287;
  float val, s, min, max;
  int staticx, staticy, x, y, ballx, ballsize = 10;
  String txt;
  sliderInt(String name, int xpos, int ypos, float minimum, float maximum, float value, float size) {
    txt = name;
    val = value;
    staticx = xpos;
    x = xpos;
    staticy = ypos;
    y = ypos;
    s = size;
    min = minimum;
    max = maximum;
  }
  void update() {
    drawText();
    drawSlider();
    drawBall();
  }
  void drawText() {
    fill(text);
    text(txt + int(val), staticx, y);
    String text = txt + int(val);
    int textWidth = int(textWidth(text));
    x = staticx + textWidth + ballsize;
    y = staticy + 4;
  }
  void drawSlider() {
    fill(slider);
    line(x, staticy, x + s, staticy);
  }
  void drawBall() {
    fill(ball);
    circle(ballx, staticy, ballsize);
    updateBall();
  }
  void updateBall() {
    String text2 = txt + int(val);
    int textWidth = int(textWidth(text2));
    if (ballx < (staticx + textWidth + ballsize + 4))
      ballx = staticx + textWidth + ballsize + 4;
    else if (ballx > (staticx + textWidth + s + ballsize))
      ballx = staticx + textWidth + int(s) + ballsize;
    if (mousePressed) {
      if ((mouseX >= (ballx - (ballsize / 2)) && mouseX <= (ballx + (ballsize / 2))) && ((mouseY >= staticy - (ballsize / 2)) && (mouseY <= staticy + (ballsize / 2)))) {
        ballx = mouseX;
        //update value here
        val = map(ballx, staticx + textWidth + ballsize, staticx + textWidth + s + ballsize, min, max);
        if (val < min)
          val = min;
        else if (val > max)
          val = max;
      }
    }
  }
}

class keyBind {
  boolean overridable = false;
  color bg = #828282, backFill = #323232, textFill = #FFFFFF, black = #000000;
  int x, y, w, w_padding = 4, h = 16;
  char[] o = { '[', ']' };
  String text, defaultText = "...", updateText = "...", lastText = "...", outputText;
  keyBind(String name, int xpos, int ypos) {
    text = name;
    x = xpos;
    y = ypos;
  }
  void update() {
    getWidth();
    drawKeyBind();
    updateKeyBind();
  }
  void getWidth() {
    w = w_padding + int(textWidth(updateBind()));
  }
  void updateKeyBind() {
    if ((mouseX >= x && mouseX <= x + w) && (mouseY >= y && mouseY <= y + h)) {
      if (updateText == "...")
        updateText = "press a key";
      if (mousePressed) {
        overridable = true;
        delay(150);
      }
    } else if (!((mouseX >= x && mouseX <= x + w) && (mouseY >= y && mouseY <= y + h)) && updateText == "press a key") {
      updateText = "...";
    }
    if (overridable) {
      if (keyPressed) {
        updateText = keyToString();
        overridable = false;
      } else if (mousePressed) {
        updateText = mouseToString();
        overridable = false;
      }
    }
  }
  String updateBind() {
    outputText = text + o[0] + updateText + o[1];
    return outputText;
  }
  void drawKeyBind() {
    fill(backFill);
    rect(x, y, w, h);
    fill(textFill);
    text(outputText, x + 2, y + 12);
  }
  String mouseToString() {
    switch(mouseButton) {
    case 37:
      return "lmb";
    case 39:
      return "rmb";
    default:
      return "...";
    }
  }
  String keyToString() {
    switch(int(key)) {
    case 8:
      return "backspace";
    case 9:
      return "tab";
    case 10:
      return "enter";
    case 32:
      return "space";
    case 39:
      return "'";
    case 44:
      return ",";
    case 45:
      return "-";
    case 46:
      return ".";
    case 47:
      return "/";
    case 48:
      return "0";
    case 49:
      return "1";
    case 50:
      return "2";
    case 51:
      return "3";
    case 52:
      return "4";
    case 53:
      return "5";
    case 54:
      return "6";
    case 55:
      return "7";
    case 56:
      return "8";
    case 57:
      return "9";
    case 59:
      return ";";
    case 61:
      return "=";
    case 65:
      return "a";
    case 66:
      return "b";
    case 67:
      return "c";
    case 68:
      return "d";
    case 69:
      return "e";
    case 70:
      return "f";
    case 71:
      return "g";
    case 72:
      return "h";
    case 73:
      return "i";
    case 74:
      return "j";
    case 75:
      return "k";
    case 76:
      return "l";
    case 77:
      return "m";
    case 78:
      return "n";
    case 79:
      return "o";
    case 80:
      return "p";
    case 81:
      return "q";
    case 82:
      return "r";
    case 83:
      return "s";
    case 84:
      return "t";
    case 85:
      return "u";
    case 86:
      return "v";
    case 87:
      return "w";
    case 88:
      return "x";
    case 89:
      return "y";
    case 90:
      return "z";
    case 91:
      return "[";
    case 92:
      return "\\";
    case 93:
      return "]";
    case 96:
      return "`";
    case 97:
      return "a";
    case 98:
      return "b";
    case 99:
      return "c";
    case 100:
      return "d";
    case 101:
      return "e";
    case 102:
      return "f";
    case 103:
      return "g";
    case 104:
      return "h";
    case 105:
      return "i";
    case 106:
      return "j";
    case 107:
      return "k";
    case 108:
      return "l";
    case 109:
      return "m";
    case 110:
      return "n";
    case 111:
      return "o";
    case 112:
      return "p";
    case 113:
      return "q";
    case 114:
      return "r";
    case 115:
      return "s";
    case 116:
      return "t";
    case 117:
      return "u";
    case 118:
      return "v";
    case 119:
      return "w";
    case 120:
      return "x";
    case 121:
      return "y";
    case 122:
      return "z";
    case 127:
      return "..."; //delete key
    default:
      if (key == 65535) {
        switch(keyCode) {
          //keycode switch
        case 16:
          return "shift";
        case 17:
          return "ctrl";
        case 18:
          return "alt";
        case 20:
          return "caps";
        case 33:
          return "pgup";
        case 34:
          return "pgdn";
        case 35:
          return "end";
        case 36:
          return "home";
        case 37:
          return "left";
        case 38:
          return "up";
        case 39:
          return "right";
        case 40:
          return "down";
        case 155:
          return "insert";
        default:
          return "...";
        }
      } else {
        return "...";
      }
    }
  }
}

class multiBox {
  boolean opened = false;
  color boxColor = #383838, textColor = #FFFFFF, dropColor = #434343;
  int padding = 16, w, h = 16, x, y, longestptr = 0;
  String displayText = "", linker = ", ";
  String[] options;
  boolean[] selected = {false, false, false};
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
    for (int i = 0; i < options.length; i++) {
      if (textWidth(options[i]) >= textWidth(options[longestptr]))
        longestptr = i;
    }
    if (w < int(textWidth(options[longestptr])))
      return int(textWidth(options[longestptr]));
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
    for (int i = 0; i < options.length; i++) {
      if (selected[i])
        displayText += options[i] + linker;
    }
    text(displayText, x, y + 12);
    if (!opened)
      text("↓", x + w - 4, y + 12);
    else
      text("↑", x + w - 4, y + 12);
    updateSelected();
  }
  void updateSelected() {
    if ((mouseX >= x - (padding / 2) && mouseX <= x - (padding / 2) + w + 16) && (mouseY >= y && mouseY <= y + h) && mousePressed)
    {
      opened = !opened;
      delay(50);
    }
    if (opened) {
      for (int i = 1; i <= options.length; i++) {
        fill(dropColor);
        w = getOverrideWidth();
        rect(x - (padding / 2), y + (h * i), w + 16, h);
        fill(textColor);
        text(options[i - 1], x, y+ (h * i) + 12);
        //if statement to check which option is clicked then set selected text to true
        if (((mouseX >= x - (padding / 2) && mouseX <= x + w) && (mouseY >= y + (h * i) && mouseY <= y + (h * i) + h)) && mousePressed)
        {
          selected[i - 1] = !selected[i - 1];
          delay(50);
        }
      }
    }
  }
}

class textBox {
  boolean clicked;
  char inputchar;
  color textColor = #FFFFFF, boxColor = #323232, bg = #828282;
  int d = 100, x, y, w, h = 16;
  String text = "";
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
        } else if (!(textWidth(text) > w - 4)) {
          text += str(key);
          delay(d);
        }
      }
    }
  }
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
