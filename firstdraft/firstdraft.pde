void setup()
{
  size(500,500);
  background(0);
  target =20;
  border = width * 0.1f;
}
float border;
float target;

void draw()
{
  background(0);
  stroke(255,0,0);
  fill(255,0,0);
  //draw the line from the y axis
  line(0,mouseY,mouseX-target/2,mouseY);
  //draw the line from the x axis
  line(mouseX,height,mouseX,mouseY+target/2);
  noFill();
  ellipse(mouseX,mouseY,target,target);
  text("You are aiming at",mouseX+target,mouseY);
}