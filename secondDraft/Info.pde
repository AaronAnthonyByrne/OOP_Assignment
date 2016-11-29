class Info
{
  PImage plag, pyro, oliv, ilme;
  float imageX= imageSize*.75;
  String plagInfo = "Plagioclase is a series of tectosilicate (framework silicate) minerals within the feldspar group. Rather than referring to a particular mineral with a specific chemical composition, plagioclase is a continuous solid solution series, more properly known as the plagioclase feldspar series";
  String pyroInfo = "The pyroxenes (commonly abbreviated to Px) are a group of important rock-forming inosilicate minerals found in many igneous and metamorphic rocks. Pyroxenes are silicon-aluminum oxides with Ca, Na, Fe, Mg, Zn, Mn, Li substituting for Si and Al.";
  String olivInfo = "Olivine is the name of a group of rock-forming minerals that are typically found in mafic and ultramafic igneous rocks such as basalt, gabbro, dunite, diabase, and peridotite. They are usually green in color and have compositions that typically range between Mg2SiO4 and Fe2SiO4. Many people are familiar with olivine because it is the mineral of a very popular green gemstone known as peridot.";
  String ilmeInfo = "Ilmenite is a common accessory mineral in igneous rocks, sediments, and sedimentary rocks in many parts of the world. Apollo astronauts found abundant ilmenite in lunar rocks and the lunar regolith. Ilmenite is a black iron-titanium oxide with a chemical composition of FeTiO3.";

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

    mouseClicked();
  }

  void mouseClicked()
  {
    if (mouseX> border && mouseX < mapBorder)
    {
      if (mouseY>150 && mouseY<200)
      {
        plagFlag = true;
        pyroFlag = false;
        if (plagFlag)
        {
          fill(255);
          text(plagInfo, mapBorder, mapBorder, 300, 300);
        } 
        else
        {
          plagFlag = false;
        }
      }
      
      if (mouseY>300 && mouseY<350)
      {
        pyroFlag = true;
      }
      if (pyroFlag)
      {
        fill(255);
        text(pyroInfo, mapBorder, mapBorder, 300, 300);
      } 
      else
      {
        pyroFlag = false;
      }
    }
    if (mouseX>width-mapBorder  && mouseX < width-border)
    {

      if (mouseY>150 && mouseY<200)
      {
        olivFlag = true;
        if (olivFlag)
        {
          fill(255);
          text(olivInfo, mapBorder, mapBorder-10, 305, 300);
        } 
        else
        {
          olivFlag =false;
        }
      }
      if (mouseY>250 && mouseY<350)
      {
        ilmeFlag = true;
        if (ilmeFlag)
        {
          fill(255);
          text(ilmeInfo, mapBorder, mapBorder, 300, 300);
          text()
        } 
        else
        {
          ilmeFlag =false;
        }
      }
    }
    if (mouseY>20 && mouseY<80 && mouseX >10 && mouseX<125)

    {
      hudState=0;
    }
  }
}