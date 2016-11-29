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

    text("Main Menu", 0, 0);
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
  }
  void drawRect()
  {
    fill(255);
    rect(border, border*2, mapBorder-10, 100 );
  }
}