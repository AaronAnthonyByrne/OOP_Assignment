void setup()
{
  size(800,400);
  background(0);
}

void draw()
{
  rect(20,20,760,360,7);
  bezier(20, 20, 50, 10, 90, 90,20, 380);
  bezier(760, 360, 730, 5, 730, 400,760, 20);
}