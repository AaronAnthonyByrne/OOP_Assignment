class Info
{
  PImage plag, pyro, oliv, ilme;
  float imageX= imageSize*.75;

  Info()
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
        if (mouseY>200 && mouseY<350)
        {
          println("plag");
          plagFlag = true;
          pyroFlag = false;
          olivFlag = false;
          ilmeFlag = false;
        }
        if (mouseY>200 && mouseY<350)
        {
          println("pyro");
          plagFlag = false;
          pyroFlag = true;
          olivFlag = false;
          ilmeFlag = false;
        }
      }
      if (mouseX> 450  && mouseX < 600)
      {
        println("inside 2 X");
        if (mouseY>100 && mouseY<180)
        {
          println("oliv");
          plagFlag = false;
          pyroFlag = false;
          olivFlag = true;
          ilmeFlag = false;
        }
        if (mouseY>200 && mouseY<350)
        {
          println("ilme");
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