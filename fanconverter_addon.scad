$fn=96;

//Fan: 120x120
//Hole distance: 105
//Hole dia: 4
//Base size: 190

//Ket tarto kozti tavolsag: 113

linear_extrude(height=1.5)
{
  difference()
  {
    minkowski()
    {
      square(size=193-40, center=true);
      circle(d=40);
    }
    minkowski()
    {
      square(size=130-40, center=true);
      circle(d=40);
    }
  }
}
translate([0, 0, 1.5]) linear_extrude(height=1.5)
{
  difference()
  {
    minkowski()
    {
      square(size=193-40, center=true);
      circle(d=40);
    }
    minkowski()
    {
      square(size=180.4-40, center=true);
      circle(d=40);
    }
  }
}

