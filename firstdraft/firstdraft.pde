void setup()
{
  size(640, 360);
  background(0);
  target =20;
  
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
  //drawing the circle for the target.
  noFill();
  ellipse(mouseX,mouseY,target,target);
  //Text for the circle.
  text("You are aiming at",mouseX+target,mouseY);
   grid();
  //messing with rectangles
  rectMode(RADIUS);  // Set rectMode to RADIUS
  fill(255);  // Set fill to white
  rect(50, 50, 30, 30);  // Draw white rect using RADIUS mode
  
  rectMode(CENTER);  // Set rectMode to CENTER
  fill(100);  // Set fill to gray
  rect(50, 50, 30, 30);
  
  
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