class Calc
{
 Calc ()
 {
 }
 void calcMinMax()
{
  pmin = pmax = pdata.get(0).gPop; 
  for (PopData pD : pdata)
  {
    if (pD.gPop < pmin)
    {
      pmin = pD.gPop;
    }
    if (pD.gPop > pmax)
    {
      pmax = pD.gPop;
    }
  }
  bmin = bmax = pdata.get(0).birth; 
  for (PopData pD : pdata)
  {
    if (pD.birth < pmin)
    {
      bmax = pD.birth;
    }
    if (pD.birth > pmax)
    {
      bmin= pD.birth;
    }
  }
  dmin = dmax = pdata.get(0).mort; 
  for (PopData pD : pdata)
  {
    if (pD.mort < pmin)
    {
      dmax = pD.mort;
    }
    if (pD.birth > pmax)
    {
      dmin = pD.mort;
    }
  }
}
}