//75mm, 98mm

$fn=90;

module screwhole()
{
  mirror([0, 0, 1])
  union()
  {
    cylinder(d=4, h=10, center=false);
    cylinder(d=7, h=3, center=false);
  }
}

module sc2(cut)
{
  rotate_extrude(angle=360) polygon(points=[[0, 0], [5, 0], [5, 1], [2.5, 3.5], [2.5, 10], [0, 10]]);
  rotate([90, 0, 0]) linear_extrude(height=15) polygon(points=[[5, 0], [5, 1], [2.5, 3.5], [2.5, 10], [-2.5, 10], [-2.5, 3.5], [-5, 1], [-5, 0]]);
  if (cut==1)
  {
    translate([0, -12, 0]) cylinder(d=10, h=8, center=false);
  }
}

difference()
{
  translate([0, 0, -5]) cube([98, 98, 10], center=true);
  translate([75/2, 75/2, 0]) screwhole();
  translate([75/2, -75/2, 0]) screwhole();
  translate([-75/2, -75/2, 0]) screwhole();
  translate([-75/2, 75/2, 0]) screwhole();
  translate([-60/2, -98/2+10, -8]) sc2();
  translate([60/2, -98/2+10, -8]) sc2();
  translate([-60/2, -98/2+10, -8]) sc2();
  translate([60/2, -98/2+10, -8]) sc2();
  translate([-60/2, -98/2+10+70, -8]) sc2(cut=1);
  translate([60/2, -98/2+10+70, -8]) sc2(cut=1);
}

