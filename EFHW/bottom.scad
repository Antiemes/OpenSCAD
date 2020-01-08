$fn=96;

px=25.2;
py=30.2;
pz=26.6;
dd=3;
ddd=20;
dd2=5;
difference()
{
  union()
  {
    translate([-125, -99.7, 0])
    {
      import("EFHW-box-ft140-PL-bottom.stl", convexity=3);
    }
    translate([px, py, 0]) cylinder(d=4, h=pz);
    translate([px, -py, 0]) cylinder(d=4, h=pz);
    translate([-px, py, 0]) cylinder(d=4, h=pz);
    translate([-px, -py, 0]) cylinder(d=4, h=pz);
    translate([ 27, 18, 12.5]) rotate([0, 90, 0]) cylinder(d=12, h=4, center=true);
    translate([-27, 18, 12.5]) rotate([0, 90, 0]) cylinder(d=12, h=4, center=true);
  }
translate([ px,  py, pz+0.1]) mirror([0, 0, 1]) cylinder(d=dd, h=ddd);
translate([ px, -py, pz+0.1]) mirror([0, 0, 1]) cylinder(d=dd, h=ddd);
translate([-px,  py, pz+0.1]) mirror([0, 0, 1]) cylinder(d=dd, h=ddd);
translate([-px, -py, pz+0.1]) mirror([0, 0, 1]) cylinder(d=dd, h=ddd);
translate([0, 18, 12.5]) rotate([0, 90, 0]) cylinder(d=dd2, h=80, center=true);
}
//cube([60, 70, 20], center=true);
