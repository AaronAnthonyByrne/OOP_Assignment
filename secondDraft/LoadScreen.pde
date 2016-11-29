class LoadScreen
{
  LoadScreen()
  {
  }
  void star(float x, float y, float radius1, float radius2, int points_on_star) 
  {
    fill(30, 144, 255);
    float angle = TWO_PI / points_on_star;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) 
    {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  void display()
  {
    image(logo, width/2-(imageSize/2), 10, imageSize, imageSize);
    pushMatrix();
    translate(width*0.5, height *0.25);
    //speed of star
    rotate(frameCount / 100.0);
    fill(50, 205, 50);
    star(120, 100, 30, 75, 20); 
    popMatrix();
    textFont(myFont);
    text("Welcome to the Europa Mining Colony", 30, height-30);
  }
  void exitScreen()
  {
    image(logo, width/2-(imageSize/2), 10, imageSize, imageSize);
    pushMatrix();
    translate(width*0.5, height *0.25);
    //speed of star
    rotate(frameCount / 100.0);
    fill(50, 205, 50);
    star(120, 100, 30, 75, 20); 
    popMatrix();
    textFont(myFont);
    fill(50, 205, 50);
    textAlign(LEFT);
    text("Goodbye from the Europa Mining Colony", 10, height-30);
  }
}