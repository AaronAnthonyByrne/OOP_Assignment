class Button
{
  String ButtonName;
  float buttonX,buttonY,buttonW,buttonH;
  
  Button(String line)
  {
    String[] fields = line.split(",");
    ButtonName = fields[1];
    buttonX = Float.parseFloat(fields[2]);
    buttonY = Float.parseFloat(fields[3]);
    buttonW = Float.parseFloat(fields[4]);
    buttonH = Float.parseFloat(fields[5]);
  }
  
  Button(TableRow row)
  {
    ButtonName = row.getString(0);
    buttonX = row.getFloat(1);
    buttonY = row.getFloat(2);
    buttonW = row.getFloat(3);
    buttonH = row.getFloat(4);
  }
    String toString()
    {
     return ButtonName
    +" " +buttonX
    +" " +buttonY
    +" " +buttonW
    +" " +buttonH; 
    }
}