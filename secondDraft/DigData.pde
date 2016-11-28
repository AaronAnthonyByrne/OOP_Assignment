class DigData
{
  String State;
  String SiteName;
  String PrimaryOre;
  String SecondaryOre;
  PVector position;
  PVector mapPos;
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
    mapPos = new PVector(
    map(position.x, 1, 5, mapBorder, width-mapBorder),
    map(position.y, 1, 5, border, height-border)
    );
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