void setup()
{
  size(640, 360);
  background(0);

  target =20;
}

float border;
float target;
char letter;
String words = "Your name is?";

void draw()
{
  background(0);
  loadScreen();
  //drawSquares();
}
void loadScreen()
{
    background(102);
    pushMatrix();
    translate(width*0.2, height*0.5);
    rotate(frameCount / 200.0);
    fill(50,205,50);
    star(120, 100, 30, 100, 20); 
    popMatrix();
  }

 // targetSystem();

void star(float x, float y, float radius1, float radius2, int number_points) {
  float angle = TWO_PI / number_points;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) 
  {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void targetSystem()
{
  background(0);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  //draw the line from the y axis
  line(0, mouseY, mouseX-target/2, mouseY);
  //draw the line from the x axis
  line(mouseX, height, mouseX, mouseY+target/2);
  //drawing the circle for the target.
  noFill();
  ellipse(mouseX, mouseY, target, target);
  //Text for the circle.
  text("You are aiming at", mouseX+target, mouseY);
  grid();
}

void grid()
{
  int gridSize = 40;

  for (int x = gridSize; x <= width - gridSize; x += gridSize)
  {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) 
    {
      noStroke();
      fill(255);
      rect(x-1, y-1, 3, 3);
      stroke(255, 100);
      line(x, y, width/2, height/2);
    }
  }
}

void drawSquares()
{
}