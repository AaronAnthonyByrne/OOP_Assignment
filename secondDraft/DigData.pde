class DigData
{
  String drilled;
  String drillType;
  String oreType;
  float money;
  float distanceX;
  float distanceY;

  DigData(String line)
  {
    String[] fields = line.split(",");
    drilled= fields[0];
    drillType=fields[1];
    oreType=fields[2];
    money = Float.parseFloat(fields[3]);
    distanceX = Float.parseFloat(fields[4]);
    distanceY = Float.parseFloat(fields[5]);
  }

  DigData(TableRow row)
  {
    drilled= row.getString(0);
    drillType=row.getString(1);
    oreType=row.getString(2);
    money = row.getFloat(3);
    distanceX = row.getFloat(4);
    distanceY = row.getFloat(5);
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