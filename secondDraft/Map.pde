class Map
{

  Map() 
  {
  } 

  void display() 
  {
    fill(255);
    for (float x = 0; x<=5; x++)
    {
      float lx = map(x, 0, 5, mapBorder, width-mapBorder);
      line(lx, border, lx, height-border);
    }
    for (float y = 0; y<=5; y++)
    {
      float ly = map(y, 0, 5, border, height-border);
      line(mapBorder, ly, width-mapBorder, ly);
    }
    for (DigData spot : digSpot)
    {

      float plotx = spot.mapPos.x;
      float ploty = spot.mapPos.y;

      stroke(255, 0, 0);
      line(plotx, ploty+2, plotx, ploty-2);
      line(plotx+2, ploty, plotx-2, ploty);


      stroke(255, 0, 0);
      noFill();
      ellipse(plotx, ploty, 5, 5);
      
      fill(255);
      textFont(digFont);
       textAlign(LEFT, CENTER);
       text(spot.drillType, plotx+10, ploty-2);
    }
  }
}