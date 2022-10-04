void setup()
{
  size(765, 765);
  frameRate(60);
}

void draw()
{
  //15*17 = 255
  //255 * 3 = 765
  //color vars
  int base_color = 51;
  int base_color_max = 204;
  int top_color = (mouseY / 5) + base_color;
  int right_color = base_color_max - (mouseX / 5);
  int bottom_color = base_color_max - (mouseY / 5);
  int left_color = (mouseX / 5) + base_color;
  //spacing
  int offset = 10;
  int border_offset = 10;
  //line settings
  background(base_color + 6);
  strokeWeight(1);
  //top quad
  fill(top_color);
  quad(
    0 + border_offset, 0 + border_offset,        //outside top left
    765 - border_offset, 0 + border_offset,      //outside top right
    mouseX + offset, mouseY - offset,            //inside  top right
    mouseX - offset, mouseY - offset             //inside  top left
    );
  //bottom quad
  fill(bottom_color);
  quad(
    0 + border_offset, 765 - border_offset,      //outside bottom left
    765 - border_offset, 765 - border_offset,    //outside bottom right
    mouseX + offset, mouseY + offset,            //inside  bottom right
    mouseX - offset, mouseY + offset             //inside  bottom left
    );
  //left quad
  fill(left_color);
  quad(
    0 + border_offset, 0 + border_offset,        //outside top    left
    0 + border_offset, 765 - border_offset,      //outside bottom left
    mouseX - offset, mouseY + offset,            //inside  bottom left
    mouseX - offset, mouseY - offset             //inside  top    left
   );
  //right quad
  fill(right_color);
  quad(
    765 - border_offset, 0 + border_offset,      //outside top    right
    765 - border_offset, 765 - border_offset,    //outside bottom right
    mouseX + offset, mouseY + offset,            //inside  bottom right
    mouseX + offset, mouseY - offset             //inside  top    right
   );
  //middle square
  int last_color = (top_color + right_color + bottom_color + left_color) / 4;
  fill(last_color);
  square(mouseX - offset, mouseY - offset, offset * 2);
}
