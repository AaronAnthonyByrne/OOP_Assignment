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
}