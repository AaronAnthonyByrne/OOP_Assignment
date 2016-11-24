class DigData
{
  String drilled;
  String drillType;
  String oreType;
  float money;
  PVector position;
  PVector mapPos;


  DigData(TableRow row)
  {
    drilled= row.getString("drilled");
    drillType=row.getString("drillType");
    oreType=row.getString("ore");
    money = row.getFloat("money");
    position = new PVector(
    row.getFloat("disX")
    ,row.getFloat("disY")
    );
    mapPos = new PVector(
    map(position.x, 1, 5, mapBorder, width-mapBorder)
    ,map(position.y, 1, 5, border, height-border)
    );
  }

  String toString()
  {
    return drilled
      + "," + drillType
      + "," + oreType
      + "," + money
      + "," +  position

      ;
  }
}