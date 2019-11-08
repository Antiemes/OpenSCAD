$fn=96;

//Fan: 120x120
//Hole distance: 105
//Hole dia: 4
//Base size: 180

module fan(size)
{
  hull()
  {
    for (r=[0:90:359])
    {
      rotate([0, 0, r]) translate([(size-6)/2, (size-6)/2, 25]) cylinder(h=25, d=6, center=true);
    }
  }
}

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
          rotate([0, 0, r]) translate([(180-40)/2, (180-40)/2, 0]) cylinder(h=3, d=40, center=true); //Matched to wall size
        }
          //cube([80, 80, 6], center=true);
          //cylinder(h=6, d=75, center=true);
        fan(120);
      }
        
      for (r=[0:90:359])
      {
        rotate([0, 0, r]) translate([105/2, 105/2, 0]) cylinder(h=100, d=4.5, center=true); //Fan screws
      }
      translate([0, 0, 20])
        for (r=[0:90:359])
        {
          rotate([0, 0, r]) translate([40, 40, 0]) cylinder(h=6, d=3.5, center=true);
        }
    }
  }
  fan(121);
  hull() //Wall part
  {
    translate([0, 0, 15])
    intersection()
    { //Fan air hole
      linear_extrude(height=1) square(size=124, center=true);
      linear_extrude(height=1) circle(d=110);
    }
    translate([0, 0, -1.5]) linear_extrude(height=1) minkowski()
    {
      circle(d=25);
      square(size=140-15, center=true);
    }
  }
}
translate([0, 35*1.5, 1]) cube([175, 8, 5], center=true);
translate([0, -35*1.5, 1]) cube([175, 8, 5], center=true);



//difference()
//{
//  translate([0, 0, 3]) cylinder(h=14, d1=80, d2=100);
//  translate([0, 0, 3]) cylinder(h=14, d1=80-6, d2=100-6);
//}
