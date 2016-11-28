PImage logo;
void setup()
{
  size(640, 400);
  //Images that will be used.
  logo = loadImage("europa.png");
  //declaring new instances of the class
  digger = new Digger(50, 50, 0);
  map = new Map();
  //calling on specific fonts
  fill(255);
  myFont =loadFont("AgencyFB-Bold-48.vlw");
  textFont(myFont, 48); 
  smallerFont =loadFont("AgencyFB-Reg-22.vlw");
  textFont(smallerFont, 22);
  digFont=loadFont("BodoniMTCondensed-Italic-12.vlw");
  textFont(digFont, 12);

  //using the framerate to contrl the loading screen
  frameRate(40);

  //colour of the background
  background(0);

  //methods to call in setup
  loadData();
  printData();
}
//Fonts for use in HUD
PFont myFont, smallerFont, digFont;

//variables in use
int hudState=0;
float mapBorder= 150;
float border =10;
float imageSize =150;
int count = frameCount;
int targetCount = 300;
int choice = -1;
float[] years = {1, 2, 3, 4, 5, 6};
String[] yearC ={"2034", "2035", "2036", "2037", "2038", "2039"};
Table table;
//
boolean siteSelected = false;
boolean siteUnselected = false;
//Class variables
Digger digger;
Map map;
Population bars;

//ArrayList declarations

ArrayList<DigData> digSpot = new ArrayList<DigData>();
ArrayList<Population> pop = new ArrayList<Population>();

void loadData()
{
  Table t = loadTable("data.csv", "header");
  for (TableRow row : t.rows())
  {
    DigData insert = new DigData(row);
    digSpot.add(insert);
  }

  table= loadTable("birthRate.tsv", "header");
  for (TableRow row : table.rows())
  {
    Population a = new Population(row);
    pop.add(a);
  }
}
void printData()
{
  for (DigData insert : digSpot)
  {
    println(insert);
  }
}

void menu()
{
  background(0);
  stroke(255);
  textFont(myFont);
  textAlign(CENTER);
  text("Please select from the following options", width/2, 100);
  textAlign(LEFT);
  textFont(smallerFont);
  text("1.Dig", width/2, 130);
  textAlign(RIGHT);
  text("2.Population Information", width/2, 160);
  textAlign(LEFT);
  text("3.Buy and Sell", width/2, 180);
  textAlign(RIGHT);
  text("4. LogOut", width/2, 200);


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
  textFont(smallerFont);
  text("Dig Map", 30, 50);

  digger.render();
  map.display();
  for (int i =0; i <digSpot.size(); i++)
  {
    DigData d = digSpot.get(i);
    float x = d.mapPos.x;
    float y = d.mapPos.y;
    if (dist(mouseX, mouseY, x, y)<d.position.x)
    {
      ellipse(x, y, 10, 10);

      if (mousePressed)
      {
        siteSelected = true;
        siteUnselected = false;
      } else
      {
        siteUnselected = true;
      }
    } else 
    {
      if (siteSelected == true)
      {
        if (mousePressed && siteUnselected == true)
        {
          siteSelected = false;
        }
        noStroke();
        fill(255);
        textSize(18);
        text(d.SiteName, x, y );
        fill(0, 0, 255);
        ellipse(x, y, 10, 10);
      } else
      {
        noStroke();
        fill(255, 0, 0);
        ellipse(x, y, 8, 8);
      }
    }
  }
  if (keyPressed && key =='0')
  {
    hudState=0;
  }
}


void craft()
{
  background(0);
  bars.drawGraph();
}

void buyAndSell()
{
  background(0);
  text("Welcome buy and sell", 30, 50);

  if (keyPressed && key =='0')
  {
    hudState=0;
  }
}

void gameOver()
{
  background(0);
  text("Logout", 30, 50);
  exit();
}


void startScreen()
{


  if (frameCount<targetCount)
  {
    image(logo, width/2-(imageSize/2), height*0.1, imageSize, imageSize);
    pushMatrix();
    translate(width*0.5, height *0.25);
    rotate(frameCount / 200.0);
    fill(50, 205, 50);
    star(120, 100, 30, 75, 20); 
    popMatrix();
    textFont(myFont);
    text("Welcome to the Europa Mining Colony", 30, height-50);
  } else
  {
    switch(hudState) {
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
  fill(30, 144, 255);
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
  startScreen();

  if (choice > 0)
  {
    DigData data = digSpot.get(choice);
    text(" Information about this dig site"+data.State + data.SiteName+data.PrimaryOre
      +data.SecondaryOre, width-mapBorder, 20);
  }
}