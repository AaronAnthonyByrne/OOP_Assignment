class HUD
{
  PImage plag, pyro, oliv, ilme;
  float imageX= imageSize*.75;

  HUD()
  {
  }

  void display()
  {
    plag = loadImage("plag.jpg");
    pyro = loadImage("Pyro.jpg");
    oliv = loadImage("oliv.jpg");
    ilme = loadImage("ilme.jpg");

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(25, 20);
    rect(0, 0, 100, 50);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(70, 50);
    text("Main Menu", 0, 0);
    popMatrix();

    pushMatrix();
    fill(0, 255, 0);
    translate(border, 125);
    image(plag, 0, 0, imageX, imageX);
    popMatrix();

    pushMatrix();
    fill(0, 0, 255);
    translate(border, 250);
    image(pyro, 0, 0, imageX, imageX);
    popMatrix();

    pushMatrix();
    fill(0, 0, 255);
    translate(width-(mapBorder+(border)), 10);
    image(logo, 0, 0, imageX, imageX );
    popMatrix();

    pushMatrix();
    fill(0, 255, 0);
    translate(width-(mapBorder+border), 125);
    image(oliv, 0, 0, imageX, imageX);
    popMatrix();

    pushMatrix();
    fill(0, 0, 255);
    translate(width-(mapBorder+border), 250);
    image(ilme, 0, 0, imageX, imageX);
    popMatrix();

    if (mousePressed)
    {
      if (mouseX> border && mouseX < border+imageX)
      {
        if (mouseY>125 && mouseY<125+imageX)
        {
          plagFlag = true;
          pyroFlag = false;
          olivFlag = false;
          ilmeFlag = false;
        }
        if (mouseY>125+250 && mouseY<125+250+imageX)
        {
          plagFlag = false;
          pyroFlag = true;
          olivFlag = false;
          ilmeFlag = false;
        }
      }
      if (mouseX> width-(mapBorder+border) && mouseX < width-(mapBorder+border)+imageX)
      {
        if (mouseY>125 && mouseY<125+imageX)
        {
          plagFlag = false;
          pyroFlag = false;
          olivFlag = true;
          ilmeFlag = false;
        }
        if (mouseY>125+250 && mouseY<125+250+imageX)
        {
          plagFlag = false;
          pyroFlag = false;
          olivFlag = false;
          ilmeFlag = true;
        }
      }
      if (mouseY>20 && mouseY<80 && mouseX >10 && mouseX<125)

      {
        hudState=0;
      }
    }
  }
}