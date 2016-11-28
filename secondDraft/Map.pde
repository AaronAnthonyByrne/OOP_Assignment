class Map
{
  float sizeX=width-(mapBorder*2);
  float sizeY=height-(border*2);
  PImage map1, map2, map3;
  float plotx, ploty;


  Map() 
  {
  } 

  void display() 
  {
    //image to display
    image(logo, (sizeofMap+mapBorder)+mapBorder/4, (height*0.1)-(border/2), imageSize/2, imageSize/2);
    map1 = loadImage("moonSurface1.jpg");
    map2 = loadImage("moonSurface2.jpg");
    map3 = loadImage("moonSurface3.jpg");
    
    //menu buttons
    pushMatrix();
    fill(255);
    translate(50, 150);
    text("Galileo", 0, 0);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(50, 200);
    text("Minos", 0, 0);
    popMatrix();


    pushMatrix();
    fill(255);
    translate(50, 250);
    text("Zeus", 0, 0);
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(10, 325);
    rect(0, 0, 100, 50);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(60, 360);
    text("Main Menu", 0, 0);
    popMatrix();

    sizeofMap = width - (mapBorder*2);
    if (galileo)
    {
      //map 1


      fill(255);
     // image(map1, mapBorder, border, sizeX, sizeY);
      for (int i=0; i<digSpot.size(); i++)
      {
        DigData m = digSpot.get(i);
        plotx = m.map1Pos.x;
        ploty = m.map1Pos.y;

        stroke(255, 0, 0);
        line(plotx, ploty+2, plotx, ploty-2);
        line(plotx+2, ploty, plotx-2, ploty);


        stroke(255, 0, 0);
        noFill();
        ellipse(plotx, ploty, 5, 5);

        fill(255);
      }
    }
    if (minos)
    {
      fill(255);
      //image(map2, mapBorder, border, sizeX, sizeY);
      for (int i=0; i<digSpot.size(); i++)
      {
        DigData m = digSpot.get(i);
        plotx = m.map2Pos.x;
        ploty = m.map2Pos.y;

        stroke(255, 0, 0);
        line(plotx, ploty+2, plotx, ploty-2);
        line(plotx+2, ploty, plotx-2, ploty);


        stroke(255, 0, 0);
        noFill();
        ellipse(plotx, ploty, 5, 5);

        fill(255);
      }
    }
    if (zeus)
    {


      fill(255);
      //image(map3, mapBorder, border, sizeX, sizeY);
      for (int i=0; i<digSpot.size(); i++)
      {
        DigData m = digSpot.get(i);
        plotx = m.map3Pos.x;
        ploty = m.map3Pos.y;

        stroke(255, 0, 0);
        line(plotx, ploty+2, plotx, ploty-2);
        line(plotx+2, ploty, plotx-2, ploty);


        stroke(255, 0, 0);
        noFill();
        ellipse(plotx, ploty, 5, 5);

        fill(255);
      }
    }
  }
}