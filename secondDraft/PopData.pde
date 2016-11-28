class PopData
{
  int year, pop, birth, mort, gPop;
  PopData(TableRow row)
  {
    year= row.getInt("Year");
    pop= row.getInt("Population");
    birth= row.getInt("Birth");
    mort= row.getInt("Mortality");
    gPop= row.getInt("Gross Population");
  }

  String toString()
  {
    return year
      + "," + pop
      + "," + birth
      + "," + mort
      + "," + gPop;
  }
}