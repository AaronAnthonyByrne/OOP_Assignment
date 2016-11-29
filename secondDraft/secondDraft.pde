  void setup()
{
  size(640, 400);
  //Images that will be used.
  logo = loadImage("europa.png");
  //declaring new instances of the class
  map = new Map();
  info = new Info();
  pop = new Population();
  calc = new Calc();
  load = new LoadScreen();
  menu = new Menu();
  rock = new Rock();
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
}
//images used
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
float pmin, pmax, bmin, bmax, dmin, dmax;
float lineBorder = mapBorder+(mapBorder/2);
float sizeofMap;


String currentSite;
//all boolean variables used in HUD
boolean siteSelected = false;
boolean siteUnselected = false;
boolean bChart=false;
boolean dChart=false;
boolean pChart=false;
boolean oChart=false;
boolean galileo =false;
boolean minos = false;
boolean zeus = false;
boolean plagFlag = false;
boolean pyroFlag = false;
boolean olivFlag = false;
boolean ilmeFlag = false;

//Class variables
Map map;
Population pop;
Info info;
Calc calc;
LoadScreen load;
Menu menu;
Rock rock;
//ArrayList declarations
ArrayList<DigData> digSpot = new ArrayList<DigData>();
ArrayList<PopData> pdata = new ArrayList<PopData>();

//Loading both data files in tables for use.
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

/////
//Menu option for Dig Sites
void dig()
{
  background(0);
  textSize(22);
  fill(30, 144, 255);
  text("Dig Sites", 50, 50);

  //call the display from the map class.
  map.display(); 
  //printing and selcting dig sites and displayin information
  map.printDigLocations();
}

//
//menu for mineral information
void info()
{
  background(0);
  //display the information about the mineral screen
  info.display();
}

//
//menu for population with graphs and buttons
void population()
{
  background(0);
  //calculating the max and min for use in line graphs
  calc.calcMinMax();
  //display the menu options in Population and Graphs
  pop.display();
}
  
//
//when user wants to logout display a splash screen
void gameOver()
{
  background(0);
  //Logout Splash Screen
  if (frameCount<count)
  {
    load.exitScreen();
  } else
  {
    exit();
  }
}

void draw()
{
  if (frameCount<targetCount)
  {
    load.display();
  } else
  {
    
  //choosing which state the HUD is in
    switch(hudState) {
    case 0:
      menu.display();
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