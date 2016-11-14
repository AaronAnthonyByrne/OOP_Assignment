class Map
{
  float x;
  float y; 

  float w=50;
  float h=50; 

  int col;

  Map( float x, float y, float w, float h, int col ) 
  {
    this.x=x;
    this.y=y;
  } 

  void display() 
  {
    stroke(0);
    rect (x, y, w, h);
    println (x);
  }
}