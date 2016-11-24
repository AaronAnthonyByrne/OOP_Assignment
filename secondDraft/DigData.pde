class DigData
{
  String drilled;
  String drillType;
  String oreType;
  float money;
  float distanceX;
  float distanceY;


  DigData(TableRow row)
  {
    drilled= row.getString("drilled");
    drillType=row.getString("drillType");
    oreType=row.getString("ore");
    money = row.getFloat("money");
    distanceX = row.getFloat("disX");
    distanceY = row.getFloat("disY");
  }
  String toString()
  {
    return drilled
      +" " +drillType
      +" " +oreType
      +" " +money
      +" " +distanceX
      +" " +distanceY;
  }
}