void setup()
{
  size(640, 320);
  myFont =loadFont("AgencyFB-Bold-48.vlw");
  textFont(myFont, 48); 
  smallerFont =loadFont("AgencyFB-Reg-22.vlw");
  textFont(smallerFont, 22);
}

int hudState=0;
PFont myFont,smallerFont;

void menu()
{
  background(0);
  stroke(255);
  textFont(myFont);
  text("Welcome to the Europa Mining Colony",30,50);
  textFont(smallerFont);
  text("1.Dig",30,100);
  text("2.Craft",30,130);
  text("3.Buy and Sell",30,160);
  text("4. LogOut",30,190);
}
void dig()
{
}

void craft()
{
}

void buyAndSell()
{
}

void gameOver()
{
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