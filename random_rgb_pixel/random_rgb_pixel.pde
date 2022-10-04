void setup()
{
  size(200,200);
  frameRate(60);
}

void draw()
{
  background(255);
  noStroke();
  
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      fill(get_pixel_color());
      square(x, y, 1);
    }
  }
}

color get_pixel_color()
{
  return color(int(random(0,255)), int(random(0,255)), int(random(0,255)));
}
