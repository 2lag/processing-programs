//waving american flag
//using -> https://www.omnicalculator.com/other/flag
int canvas_height = 260; // The only number that needs changing
float canvas_width = canvas_height * 1.9;

murican_flag flag = new murican_flag();

void setup() {
  size(494, 260);
  noStroke();
  smooth();
  noLoop();
}

void draw() {
  background(flag.WHITE);
  flag.update();
}

class murican_flag {
  //flag colors
  color WHITE = #FFFFFF, OGBLUE = #002147, OGRED = #BB133E;
  int numstripes = 13;
  float stripeh = height / numstripes * 2.854;
  float unionh = height * 7.0 / 13.0;
  void update() {
    drawStripes();
    drawUnion();
    drawStars();
  }
  void drawStripes() {
    fill(OGRED);
    for (int i = 0; i < numstripes; i += 2) {
      rect(0, stripeh * i, width, stripeh);
    }
  }
  void drawUnion() {
    fill(OGBLUE);
    rect(0, 0, width * 0.4, height * 0.53853169174);
  }
  void drawStars() {
    fill(WHITE);

    float star_hmargin = width * 0.4 /12.0;
    float star_hspacing = width * 0.4 /6.0;
    float star_vmargin = height * 0.53853169174 /10.0;
    float star_vspacing = height * 0.53853169174 /10.0;
    float star_diameter = height * 0.0616;

    for (int y = 0; y < 9; ++y) {
      int nbrStars = 5 + ((y+1) & 1);
      float lm = star_hmargin * (1 + (y & 1));
      for (int x = 0; x < nbrStars; ++x) {
        float tm = star_vmargin;
        float px = lm + star_hspacing * x;
        float py = tm + star_vspacing * y;
        star(5, px, py, star_diameter);
      }
    }
  }
}

void star(int numVertex, float x, float y, float diameter)
{
  int skipPoints = 2;
  float radius = diameter / 2.0;

  pushMatrix();
  translate(x, y);
  rotate(-PI/2);
  float ang = TWO_PI / numVertex;

  beginShape();
  int n = 0;
  for (int i = 0; i < numVertex; ++i) {
    vertex(cos(ang * n) * radius, sin(ang * n) * radius);
    n += skipPoints;
  }
  endShape(CLOSE);
  popMatrix();
}
