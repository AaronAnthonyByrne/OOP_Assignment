
void setup()
{
  size(640, 400);
  //Images that will be used.
  logo = loadImage("europa.png");
  //declaring new instances of the class
  map = new Map();
  hud = new HUD();
  pop = new Population();
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
  //printData();
}
PImage logo;
//Fonts for use in HUD
PFont myFont, smallerFont, digFont;

//variables in use
int hudState=0;
int count = frameCount;
int targetCount = 300;
float mapBorder= 150;
float border =10;
float graphBorder=20;
float imageSize =150;
float half = width/2;
float curx;
float cury;
float pmin, pmax,bmin,bmax,dmin,dmax;
float lineBorder = mapBorder+(mapBorder/2);
float sizeofMap;


String currentSite;
Table table;
//
boolean siteSelected = false;
boolean siteUnselected = false;
boolean bChart=false;
boolean dChart=false;
boolean pChart=false;
boolean oChart=false;


//Class variables
Map map;
Population pop;
HUD hud;

//ArrayList declarations
ArrayList<DigData> digSpot = new ArrayList<DigData>();
ArrayList<PopData> pdata = new ArrayList<PopData>();

void loadData()
{
  Table t = loadTable("data.csv", "header");
  for (TableRow row : t.rows())
  {
    DigData insert = new DigData(row);
    digSpot.add(insert);
  }
  Table popTable = loadTable("birthRate.tsv", "header");
  for (TableRow row : popTable.rows())
  {
    PopData insert = new PopData(row);
    pdata.add(insert);
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
  text("1.Dig Site", width/2, 130);
  textAlign(RIGHT);
  text("2.Minieral Information", width/2, 160);
  textAlign(LEFT);
  text("3.Population", width/2, 180);
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
  textSize(22);
  text("Dig Sites", 100, 50);

  map.display();
  for (int i =0; i <digSpot.size(); i++)
  {
    DigData d = digSpot.get(i);
    float x = d.mapPos.x;
    float y = d.mapPos.y;
    if (dist(mouseX, mouseY, x, y)<d.position.x)
    {
      ellipse(x, y, 10, 10);

      if (mousePressed )
      {
        currentSite = d.SiteName;
        curx =x +5;
        cury= y+5;
        siteSelected = true;
        delay(50);
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

        fill(255);
        textSize(18);
        text(currentSite, curx, cury);
        fill(0, 0, 255);
        ellipse(x, y, 10, 10);
      } else
      {

        fill(255, 0, 0);
        ellipse(x, y, 8, 8);
        noFill();
      }
    }
  }

  if (keyPressed && key =='0')
  {
    hudState=0;
  }
}


void info()
{
  background(0);
  hud.display();
  //bars.drawGraph();
}

void population()
{
  background(0);
  calcMinMax();
  pop.display();
  if (mousePressed)
  {
    if (mouseX >50 && mouseX <mapBorder)
    {
      if (mouseY>125 && mouseY<175)
      {
        bChart = true;
        dChart=false;
        pChart=false;
        oChart=false;
      }
      if (mouseY>175 && mouseY<250)
      {
        bChart = false;
        dChart = true;
        pChart=false;
        oChart=false;
      }
      if (mouseY>250 && mouseY<300)
      {
        bChart = false;
        dChart = false;
        pChart = true;
        oChart=false;
      }
      if (mouseY>300 && mouseY<350)
      {
        bChart = false;
        dChart = false;
        pChart=false;
        oChart = true;
      }
    }
  }

  if (bChart)
  {
    pop.drawBLineGraph();
  }
  if (dChart)
  {
    pop.drawDLineGraph();
  }
  if (pChart)
  {
    pop.drawPLineGraph();
  }
  if (oChart)
  {
  }
}

void gameOver()
{
  background(0);
  text("Logout", 30, 50);
  exit();
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
void calcMinMax()
{
  pmin = pmax = pdata.get(0).gPop; 
  for (PopData pD : pdata)
  {
    if (pD.gPop < pmin)
    {
      pmin = pD.gPop;
    }
    if (pD.gPop > pmax)
    {
      pmax = pD.gPop;
    }
  }
  bmin = bmax = pdata.get(0).birth; 
  for (PopData pD : pdata)
  {
    if (pD.birth < pmin)
    {
      bmax = pD.birth;
    }
    if (pD.birth > pmax)
    {
      bmin= pD.birth;
    }
  }
  dmin = dmax = pdata.get(0).mort; 
  for (PopData pD : pdata)
  {
    if (pD.mort < pmin)
    {
      dmax = pD.mort;
    }
    if (pD.birth > pmax)
    {
      dmin = pD.mort;
    }
  }
  println(bmin, bmax, pmin, pmax,dmin,dmax);
}



void draw()
{
  if (frameCount<targetCount)
  {
    image(logo, width/2-(imageSize/2), 10, imageSize, imageSize);
    pushMatrix();
    translate(width*0.5, height *0.25);
    rotate(frameCount / 200.0);
    fill(50, 205, 50);
    star(120, 100, 30, 75, 20); 
    popMatrix();
    textFont(myFont);
    text("Welcome to the Europa Mining Colony", 30, height-30);
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
      info();
      break;
    case 3:
      population();
      break;
    case 4:
      gameOver();
      break;
    }
  }
}