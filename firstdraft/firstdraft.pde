void setup()
{
  size(640, 360);
  background(0);
  loadData();
  target =20;
  
}

float border;
float target;
char letter;
String words = "Your name is?";
ArrayList<Button> but = new ArrayList<Button>();


void loadData()
{
  but.clear();

  Table t = loadTable("buttondata.csv");
  
  for (int i = 0; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Button r = new Button(row);
    but.add(r);
  }
 
}

void draw()
{
 background(0);
  loadScreen();
// menu();
 /*
  //messing with rectangles
  rectMode(RADIUS);  // Set rectMode to RADIUS
  fill(255);  // Set fill to white
  rect(50, 50, 30, 30);  // Draw white rect using RADIUS mode
  
  rectMode(CENTER);  // Set rectMode to CENTER
  fill(100);  // Set fill to gray
  rect(50, 50, 30, 30);
  */
  
}
void loadScreen()
{
  for (int j=0;j<100;j++)
  {
    background(102);
    pushMatrix();
    translate(width*0.2, height*0.5);
    rotate(frameCount / 200.0);
    star(10, 0, 50, 140, 20); 
    popMatrix();
  }
  
  targetSystem();
}
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