$fn=96;

//Fan: 120x120
//Hole distance: 105
//Hole dia: 4

difference()
{
  union()
  {
    difference()
    {
      hull()
      {
        for (r=[0:90:359])
        {
          rotate([0, 0, r]) translate([35, 35, 0]) cylinder(h=6, d=10, center=true);
        }
          //cube([80, 80, 6], center=true);
          //cylinder(h=6, d=75, center=true);
        for (r=[0:90:359])
        {
          rotate([0, 0, r]) translate([40, 40, 17]) cylinder(h=6, d=20, center=true);
        }
      }
        
      for (r=[0:90:359])
      {
        rotate([0, 0, r]) translate([35, 35, 0]) cylinder(h=6, d=3.5, center=true);
      }
      translate([0, 0, 20])
        for (r=[0:90:359])
        {
          rotate([0, 0, r]) translate([40, 40, 0]) cylinder(h=6, d=3.5, center=true);
        }
    }
    translate([0, 0, 20])
      difference()
      {
        cube([100, 100, 6], center=true);
        //cylinder(h=6, d=95, center=true);
      }
  }

hull()
{
  translate([0, 0, -3]) linear_extrude(height=1) circle(d=75);
  translate([0, 0, 22]) linear_extrude(height=1) minkowski()
  {
    circle(d=20);
    square(size=70, center=true);
  }
}
}

//difference()
//{
//  translate([0, 0, 3]) cylinder(h=14, d1=80, d2=100);
//  translate([0, 0, 3]) cylinder(h=14, d1=80-6, d2=100-6);
//}
