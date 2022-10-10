//slider int
sliderInt slider1 = new sliderInt("text: ", 10, 20, 0, 100, 50, 50);

void setup() {
  size(200,150);
}

void draw() {
  slider1.update();
}

class sliderInt {
  color text = #FFFFFF, bg = #878787, slider = #000000, ball = #873287;
  float val, s;
  int staticx, staticy, x, y;
  float min, max;
  int ballx;
  int ballsize = 10;
  String txt;
  sliderInt(String name, int xpos, int ypos, float minimum, float maximum, float value, float size) {
    txt = name; val = value; staticx = xpos; x = xpos; staticy = ypos; y = ypos; s = size; min = minimum; max = maximum;
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
    
    if(ballx < (staticx + textWidth + ballsize + 4)) 
      ballx = staticx + textWidth + ballsize + 4;
    else if(ballx > (staticx + textWidth + s + ballsize))
      ballx = staticx + textWidth + int(s) + ballsize;
    if(mousePressed) {
      if((mouseX >= (ballx - (ballsize / 2)) && mouseX <= (ballx + (ballsize / 2))) && ((mouseY >= staticy - (ballsize / 2)) && (mouseY <= staticy + (ballsize / 2)))) {
        ballx = mouseX;
        //update value here
        val = map(ballx, staticx + textWidth + ballsize, staticx + textWidth + s + ballsize, min, max);
        if(val < min)
          val = min;
        else if(val > max)
          val = max;
      }
    }
  }
}
