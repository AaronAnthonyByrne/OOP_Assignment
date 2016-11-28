class DigData
{
  String State;
  String SiteName;
  String PrimaryOre;
  String SecondaryOre;
  Float size;
  PVector position;
  PVector map1Pos;
  PVector map2Pos;
  PVector map3Pos;
  PImage logo;

  DigData(TableRow row)
  {
    State= row.getString("State");
    SiteName=row.getString("SiteName");
    PrimaryOre=row.getString("PrimaryOre");
    SecondaryOre=row.getString("SecondaryOre");
    position = new PVector(
    row.getFloat("disX")
    ,row.getFloat("disY")
    );
    map1Pos = new PVector(
    map(position.x, 1, 5, mapBorder, width-mapBorder),
    map(position.y, 1, 5, border, height-border)
    );
    position = new PVector(
    row.getFloat("disA")
    ,row.getFloat("disB")
    );
    map2Pos = new PVector(
    map(position.x, 1, 5, mapBorder, width-mapBorder),
    map(position.y, 1, 5, border, height-border)
    );
    position = new PVector(
    row.getFloat("disC")
    ,row.getFloat("disD")
    );
    map3Pos = new PVector(
    map(position.x, 1, 5, mapBorder, width-mapBorder),
    map(position.y, 1, 5, border, height-border)
    );
    size=row.getFloat("size");
  }

  String toString()
  {
    return State
    + "," + SiteName
    + "," + PrimaryOre
    + "," + SecondaryOre
    + "," +  position;
  }
}