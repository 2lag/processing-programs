//△ track
void setup()
{
  size(600, 600);
  frameRate(60);
}

int border_offset =  0;
int mouse_offset = 0;

void draw()
{
  background(60);
  
  if(keyPressed)
  {
    if(keyCode == UP)
    {
      border_offset++;
      if(border_offset > 300)
        border_offset = 300;
    }
    if(keyCode == DOWN)
    {
      border_offset--;
      if(border_offset < 0)
        border_offset = 0;
    }
    if(keyCode == RIGHT)
    {
      mouse_offset++;
      if(mouse_offset > 300)
        mouse_offset = 300;
    }
    if(keyCode == LEFT)
    {
      mouse_offset--;
      if(mouse_offset < 0)
        mouse_offset = 0;
    }
  }
  
  int border_min = 0 + border_offset;
  int border_max = 599 - border_offset;
  
  int base_color = 20;
  int max_color = 235;
  float top_color = base_color + (mouseY / 2.79069767442);
  float bottom_color = max_color - (mouseY / 2.79069767442);
  float left_color = base_color + (mouseX / 2.79069767442);
  float right_color = max_color - (mouseX / 2.79069767442);
  
  fill(top_color);
  triangle(                      //top triangle
    border_min, border_min,       //outside top left
    border_max, border_min,       //outside top right
    mouseX, mouseY - mouse_offset //inside
  );
  fill(right_color);
  triangle(                      //right triangle
    border_max, border_min,       //outside top    right
    border_max, border_max,       //outside bottom right
    mouseX + mouse_offset, mouseY //inside
   );
  fill(bottom_color);
  triangle(                      //bottom triangle
    border_max, border_max,       //outside bottom right
    border_min, border_max,       //outside bottom left
    mouseX, mouseY + mouse_offset //inside
   );
  fill(left_color);
  triangle(                      //left triangle
    border_min, border_max,       //outside bottom left
    border_min, border_min,       //outside top    right
    mouseX - mouse_offset, mouseY //inside
   );
}
