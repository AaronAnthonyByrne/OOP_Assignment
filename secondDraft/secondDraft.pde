
void setup()
{
  size(640, 320);
  //declaring new instances of the class
  digger = new Digger(50, 50, 0);

  //calling on specific fonts
  fill(255);
  myFont =loadFont("AgencyFB-Bold-48.vlw");
  textFont(myFont, 48); 
  smallerFont =loadFont("AgencyFB-Reg-22.vlw");
  textFont(smallerFont, 22);

  //using the framerate to contrl the loading screen
  frameRate(40);

  //colour of the background
  background(0);
  
  //methods to call in setup
  loadData();
  printData();
}
//Fonts for use in HUD
PFont myFont, smallerFont;

//variables in use
int hudState=0;

int count = frameCount;
int targetCount = 150;

//Class variables
Digger digger;
Map map;
ArrayList<DigData> digSpot = new ArrayList<DigData>();

void loadData()
{
  digSpot.clear();

  Table t = loadTable("data.csv","header");
  for (int i = 0; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    DigData insert = new DigData(row);
    digSpot.add(insert);
  }
  
}
void printData()
{
  for (DigData d : digSpot)
  {
    println(d);
  }
}

void menu()
{
  background(0);
  stroke(255);
  textFont(myFont);
  text("Welcome to the Europa Mining Colony", 30, 50);
  textFont(smallerFont);
  textAlign(CENTER);
  text("Please select from the following options", width/2, 100);
  textAlign(LEFT);
  text("1.Dig", 30, 130);
  text("2.Craft", 30, 150);
  text("3.Buy and Sell", 30, 170);
  text("4. LogOut", 30, 190);

  if (keyPressed && key == '1')
  {
    hudState = 1;
  }
  if (keyPressed && key == '2')
  {
    hudState = 2;
  }
  if (keyPressed && key == '3')
  {
    hudState = 3;
  }
  if (keyPressed && key == '4')
  {
    hudState = 4;
  }
}

void dig()
{
  background(0);
  text("Welcome DIG", 30, 50);

  digger.render();
  map.display();
  //map.plotDigSpots();
}


void craft()
{
  background(0);
  text("Crafting", 30, 50);
}

void buyAndSell()
{
  background(0);
  text("Welcome buy and sell", 30, 50);
}

void gameOver()
{
  background(0);
  text("gameOVER", 30, 50);
  exit();
}


void loadScreen()
{

  if (frameCount<targetCount)
  {
    pushMatrix();
    translate(width*0.5, height *0.25);
    rotate(frameCount / 200.0);
    fill(50, 205, 50);
    star(120, 100, 30, 75, 20); 
    popMatrix();
  } else
  {
    switch (hudState)
    {
    case 0:
      menu();
      break;
    case 1:
      dig();
      break;
    case 2:
      craft();
      break;
    case 3:
      buyAndSell();
      break;
    case 4:
      gameOver();
      break;
    }
  }
}

void star(float x, float y, float radius1, float radius2, int number_points) 
{
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

void draw()
{
  loadScreen();
}