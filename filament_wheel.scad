difference()
{
  cylinder(d=20, h=8.5, center=true, $fn=96);
  cylinder(d=3.2, h=9, center=true, $fn=48);
  rotate_extrude($fn=96)
  {
    translate([11, 0, 0]) circle(d=6, $fn=48);
  }
  for (i = [0: 36: 359])
  {
    rotate([0, 0, i])
      translate([0, 8, 8.5/2-0.4])
        cylinder(d=2, h=2, center=false, $fn=48);
  }
}
