void setup()
{
  size(800, 800);
  frameRate(60);
}

void draw()
{
  //clear bg
  background(0);
  strokeWeight(0);
  //circle vars
  int size_min = -123;
  int size_max = -1 * size_min;
  //circle draw
  for(int x = size_min; x <= size_max; x++)
  {
    for(int y = size_min; y <= size_max; y++)
    {
      int alpha = calculate_alpha(x, y);
      fill(255, 255, 255, alpha);
      square(mouseX + x, mouseY + y, 1);
    }
  }
}

//function to calculate distance from center of circle
int calculate_alpha(float x, float y)
{
  int falloff_multiplier = 5;
  float power = 2;
  float distance = sqrt(pow(x, power) + pow(y, power));
  return 255 - (falloff_multiplier * round(distance));
}
