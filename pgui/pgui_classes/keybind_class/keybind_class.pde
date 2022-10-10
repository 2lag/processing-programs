//keybind class
keyBind keybind = new keyBind("bind: ", 10, 10);

void setup() {
  size(180, 130);
}

void draw() {
  background(#828282);
  keybind.update();
}

class keyBind {
  boolean overridable = false;
  color bg = #828282;
  color backFill = #323232;
  color textFill = #FFFFFF;
  color black = #000000;
  int x, y, w, w_padding = 4, h = 16;
  char[] o = { '[', ']' };
  String text;
  String defaultText = "...", updateText = "...", lastText = "...", outputText;
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
      if(mousePressed)
        overridable = true;
    } else if (!((mouseX >= x && mouseX <= x + w) && (mouseY >= y && mouseY <= y + h)) && updateText == "press a key")
      updateText = "...";

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
