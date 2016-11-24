class Map
{
  float mapBorder= 150;
  float border =10;
  Map() 
  {
  } 

  void display() 
  {
    for (float x = 0; x<=5; x++)
    {
      float lx = map(x, 0, 5, mapBorder, width-border);
      line(lx, border, lx, height-border);
    }
    for (float y = 0; y<=5; y++)
    {
      float ly = map(y, 0, 5, border, height-border);
      line(mapBorder, ly, width-border, ly);
    }
  }

/*  void plotDigSpots()
  {
    for (int i = 0; i < digSpot.size(); i++) 
    {

      float plotx = map(digSpot.get(i).distanceX, 0, 5, mapBorder, width-border);
      float ploty = map(digSpot.get(i).distanceY, 0, 5, border, height-border);

      stroke(0, 255, 255);
      line(plotx, ploty+2, plotx, ploty-2);
      line(plotx+2, ploty, plotx-2, ploty);

      noFill();
      stroke(255, 0, 0);
      ellipse(plotx, ploty, 5, 5);

      fill(255);
      textAlign(LEFT, CENTER);
      text(digSpot.get(i).drillType, plotx+10, ploty-2);
    }
  }*/
}