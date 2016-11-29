class Menu
{
  Menu()
  {
  }

  //Main menu to select options from
  void display()
  {
    background(0);

    image(logo, width/2-(imageSize/2), 10, imageSize, imageSize);

    //using pop and push matrix to move things around the screen
    pushMatrix();
    fill(255);
    translate(width/2, 200);
    textFont(myFont);
    textAlign(CENTER);
    text("Please select from the following options", 0, 0);
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(5, 220);
    rect(0, 0, 100, 45);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(55, 250);
    textFont(smallerFont);
    text("Dig Site", 0, 0);
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate((width/2)-70, 220);
    rect(0, 0, 140, 45);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(width/2, 250);
    text("Mineral Information", 0, 0);
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(width-110, 220);
    rect(0, 0, 100, 45);
    popMatrix();

    pushMatrix();
    fill(255);
    translate((width-60), 250);
    text("Population", 0, 0);
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(width/2-50, 325);
    rect(0, 0, 100, 50);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(width/2, 360);
    text("Exit", 0, 0);
    popMatrix();

    //checking for user interactions, mouse clicked?
    if (mousePressed)
    {
      if (mouseX > (width/2)-50 && mouseX <(width/2)+50)
      {
        if (mouseY>325 && mouseY<360)
        {
          hudState = 4;
          //used to help end the exitScreen
          count = frameCount +targetCount;
        }
      }
      if (mouseY>220 && mouseY<250)
      {
        if (mouseX>5 &&mouseX<105)
        {
          hudState = 1;
        }
        if (mouseX>(width/2)-70 &&mouseX<(width/2)+70)
        {
          hudState = 2;
        }
        if (mouseX>width-110 &&mouseX<width-20)
        {
          hudState = 3;
        }
      }
    }
  }
}