void setup()
{
  size(640, 320);
  digger = new Digger(50, 50, 0);
  fill(255);
  myFont =loadFont("AgencyFB-Bold-48.vlw");
  textFont(myFont, 48); 
  smallerFont =loadFont("AgencyFB-Reg-22.vlw");
  textFont(smallerFont, 22);
}

Map [] sq = new Map[26];
int hudState=0;
float mapBorder= 150;
float border =10;
boolean overBox = false;
boolean locked = false;
PFont myFont, smallerFont;
Digger digger;

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
  digMap();
}

void craft()
{
  background(0);
  text("Welcome Craft", 30, 50);
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

void digMap()
{
  //gives me a 5x5 grid
  float x = mapBorder; // distance away from left of screen
  float y = border;  // distance from top of screen
  int b=0;
  for (int i = 0; i < 5; i += 1)
  { 
    for (int j = 0; j < 5; j += 1) 
    { 

      sq[b] = new Map(x+i*53, y+j*53, 50, 50, 50);
      b++;
    }
  }


  for (int i = 0; i < 25; i++) 
  {
    sq[i].display();
  }
}





void draw()
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