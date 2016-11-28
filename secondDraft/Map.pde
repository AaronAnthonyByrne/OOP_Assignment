class Map
{
  float sizeX=width-(mapBorder*2);
  float sizeY=height-(border*2);
  PImage map;
  float plotx,ploty;
  Map() 
  {
  } 

  void display() 
  {

    map = loadImage("moonSurface1.jpg");
    fill(255);
    image(map, mapBorder, border, sizeX, sizeY);
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
    for (int i=0; i<digSpot.size(); i++)
    {
      DigData m = digSpot.get(i);
      plotx = m.mapPos.x;
      ploty = m.mapPos.y;

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