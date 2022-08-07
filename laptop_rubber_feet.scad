$fn=360;

hull()
{
  cylinder(d=8, h=2.6);
  
  for (a=[0:90:359])
  {
    rotate([0, 0, a])
    {
      translate([14.6/2-12/2, 0, 0]) cylinder(d=12, h=.8-0.4);
    }
  }
  for (a=[45:90:359])
  {
    rotate([0, 0, a])
    {
      translate([14.6/2-5/2+0.6, 0, 0]) cylinder(d=5, h=.8-0.4);
    }
  }
}
