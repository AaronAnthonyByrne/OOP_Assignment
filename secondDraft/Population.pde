class Population
{

  PImage plag, pyro, oliv, ilme;
  float imageX= imageSize*.75;   

  Population()
  {
  }


  void display()
  {
    textAlign(LEFT);
    textSize(25);

    pushMatrix();
    fill(255);
    translate(50, 150);
    text("Birth Rate", 0, 0);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(50, 200);
    text("Death Rate", 0, 0);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(50, 250);
    text("Population Growth", 0, 0);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(50, 300);
    text("All Data", 0, 0);
    popMatrix();

    pushMatrix();
    fill(0, 0, 255);
    translate(25, 10);
    image(logo, 0, 0, imageX, imageX );
    popMatrix();

    pushMatrix();
    noStroke();
    fill(30, 144, 255);
    translate(50, 325);
    rect(0, 0, 100, 50);
    popMatrix();

    pushMatrix();
    fill(255);
    translate(60, 360);
    text("Main Menu", 0, 0);
    popMatrix();

    stroke(255, 0, 255);
    line(50, 125, 50, 160);
    stroke(0, 255, 0);
    line(50, 165, 50, 225);
    stroke(255, 255, 0);
    line(50, 230, 50, 265);
    stroke(255, 0, 0);
    line(50, 270, 50, 305);

    if (mousePressed)
    {
      if (mouseX >50 && mouseX <mapBorder)
      {
        if (mouseY>125 && mouseY<160)
        {
          bChart = true;
          dChart=false;
          pChart=false;
          oChart=false;
        }
        if (mouseY>165 && mouseY<225)
        {
          bChart = false;
          dChart = true;
          pChart=false;
          oChart=false;
        }
        if (mouseY>230 && mouseY<265)
        {
          bChart = false;
          dChart = false;
          pChart = true;
          oChart=false;
        }
        if (mouseY>270 && mouseY<305)
        {
          bChart = false;
          dChart = false;
          pChart=false;
          oChart = true;
        }
        if (mouseY>325 && mouseY<360)
        {
          hudState=0;
        }
      }
    }

    if (bChart)
    {
      drawBLineGraph();
    }
    if (dChart)
    {
      drawDLineGraph();
    }
    if (pChart)
    {
      drawPLineGraph();
    }
    if (oChart)
    {
      drawALineGraph();
    }
  }
}

void drawPLineGraph()
{
  stroke(255);  
  line(lineBorder, height - border, width - border, height - border);
  line(lineBorder, border, lineBorder, height - border);

  for (int i = 1; i < pdata.size(); i ++)
  {
    stroke(255, 255, 0);
    float x1 = map(i - 1, 0, pdata.size() - 1, lineBorder, width - border);
    float y1 = map(pdata.get(i - 1).gPop, pmin, pmax, height - border, border);
    float x2 = map(i, 0, pdata.size() - 1, lineBorder, width - border);
    float y2 = map(pdata.get(i).gPop, pmin, pmax, height - border, border);
    line(x1, y1, x2, y2);
  }
}
void drawBLineGraph()
{
  stroke(255);  
  line(lineBorder, height - border, width - border, height - border);
  line(lineBorder, border, lineBorder, height - border);

  for (int i = 1; i < pdata.size(); i ++)
  {
    stroke(255, 0, 255);
    float x5 = map(i - 1, 0, pdata.size() - 1, lineBorder, width - border);
    float y5 = map(pdata.get(i - 1).birth, bmin, bmax, height - graphBorder, border);
    float x6 = map(i, 0, pdata.size() - 1, lineBorder, width - border);
    float y6 = map(pdata.get(i).birth, bmin, bmax, height - graphBorder, border);
    line(x5, y5, x6, y6);
  }
}
void drawDLineGraph()
{
  stroke(255);  
  line(lineBorder, height - border, width - border, height - border);
  line(lineBorder, border, lineBorder, height - border);

  for (int i = 1; i < pdata.size(); i ++)
  {
    stroke(0, 255, 0);
    float x3 = map(i - 1, 0, pdata.size() - 1, lineBorder, width - border);
    float y3 = map(pdata.get(i - 1).mort, dmin, dmax, height - graphBorder-10, border);
    float x4 = map(i, 0, pdata.size() - 1, lineBorder, width - border);
    float y4 = map(pdata.get(i).mort, dmin, dmax, height - graphBorder-10, border);
    line(x3, y3, x4, y4);
  }
}
void drawALineGraph()
{
  drawPLineGraph();
  drawBLineGraph();
  drawDLineGraph();
}