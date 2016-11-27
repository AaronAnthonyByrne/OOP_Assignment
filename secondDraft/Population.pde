class Population
{
  float year;
  float population;
  float min, max;
  Population(TableRow row)
  {
    year=row.getFloat("Year");
    population=row.getFloat("Population");
  }
  void drawGraph()
  {
    min = max = pop.get(0).population; 
    for (Population p : pop)
    {
      if (p.population< min)
      {
        min = p.population;
      }
      if (p.population > max)
      {
        max = p.population;
      }
      stroke(255);  
      line(mapBorder - 5, height - border, width - mapBorder, height - border);
      line(mapBorder, border, mapBorder, height - border + 5);


      for (int i = 1; i < pop.size(); i ++)
      {
        stroke(0, 255, 255);
        float x1 = map(i - 1, 0, pop.size() - 1, mapBorder, width - border);
        float y1 = map(pop.get(i - 1).population, min, max, height - border, border);
        float x2 = map(i, 0, pop.size() - 1, mapBorder, width - border);
        float y2 = map(pop.get(i).population, min, max, height - border, border);
        line(x1, y1, x2, y2);
      }
    }
  }
}