class Map
{
  float sizeX=width-(mapBorder*2);
  float sizeY=height-(border*2);
  PImage map1, map2, map3;
  float plotx, ploty;
  String curState;
  String curPO;
  String curSO;


  Map() 
  {
  } 

  void display() 
  {
    //image to display
    image(logo, (sizeofMap+mapBorder)+mapBorder/4, (height*0.1)-(border/2), imageSize/2, imageSize/2);
    map1 = loadImage("moonSurface1.jpg");

    //menu buttons
    pushMatrix();
    fill(255);
    translate(50, 150);
    text("Galileo", 0, 0);
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(10, 325);
    rect(0, 0, 100, 50);
    popMatrix();

    pushMatrix();
    textAlign(CENTER);
    fill(255);
    translate(60, 360);
    text("Main Menu", 0, 0);
    popMatrix();

    sizeofMap = width - (mapBorder*2);

    //map 1

    fill(255);
    image(map1, mapBorder, border, sizeX, sizeY);
    for (int i=0; i<digSpot.size(); i++)
    {
      DigData m = digSpot.get(i);
      plotx = m.map1Pos.x;
      ploty = m.map1Pos.y;

      fill(0, 0, 255);
      noFill();
      ellipse(plotx, ploty, 5, 5);

      fill(255);
    }

    if (mousePressed)
    {
      if (mouseX >10 && mouseX<120 && mouseY>325 && mouseY<370)
      {
        hudState=0;
      }
    }
  }

  void printDigLocations()
  {
    for (int i =0; i <digSpot.size(); i++)
    {
      
      DigData d = digSpot.get(i);
      float x = d.map1Pos.x;
      float y = d.map1Pos.y;
      if (dist(mouseX, mouseY, x, y)<d.size)
      {
        noStroke();
        fill(255, 255, 0);
        ellipse(x, y, 10, 10);

        if (mousePressed)
        {
          currentSite = d.SiteName;
          curx =x +5;
          cury= y+5;
          curState = d.State;
          curPO = d.PrimaryOre;
          curSO= d.SecondaryOre;
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
          textAlign(LEFT);
          noStroke();
          fill(255);
          text("Name: \n"+currentSite,490,160);
          text("Status: \n"+curState,490,200);
          text("Primary Ore: \n"+curPO,490,280);
          text("Secondary Ore: \n"+curSO,490,350);
          fill(0, 0, 255);
          ellipse(x, y, 10, 10);
        } else
        {
          noStroke();
          fill(0,0,255);
          ellipse(x, y, 8, 8);
          noFill();
        }
      }
    }
  }
}