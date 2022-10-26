int scale = 3;

void setup()
{
  size(200,200);
  frameRate(20);
}

void draw()
{
  background(255);
  noStroke();
  
  for(int x = 0; x < width; x+=scale)
  {
    for(int y = 0; y < height; y+=scale)
    {
      fill(get_pixel_color());
      square(x, y, scale);
    }
  }
}

color get_pixel_color()
{
  int c = round(random(0,1));
  if(c == 0)
    return #000000;
  return #FFFFFF;
}
