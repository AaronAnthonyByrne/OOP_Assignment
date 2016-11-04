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
 menu();
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

void menu()
{
    textSize(36);
    text(words, 50, 120, 540, 300);
  
  
}

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') || key == ' ')
  {
    letter = key;
    words = words + key;
    // Write the letter to the console
    println(key);
  }
   else if (key == 0)
  {
    targetSystem();
   }
  
}

void targetSystem()
{
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