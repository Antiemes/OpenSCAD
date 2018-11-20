$fn=50;

frame=1;
fwidth=54;
fheight=16;
roundness=3;

sheight=7;

linear_extrude(height=1.5, center=false)
{
  mirror([1, 0, 0]) text("BULLSHIT", halign="center", valign="center", font="Impact");
  difference()
  {
    minkowski()
    {
      square([fwidth-roundness,fheight-roundness], center=true);
      circle(roundness);
    }
    minkowski()
    {
      square([fwidth-roundness-frame,fheight-roundness-frame], center=true);
      circle(roundness);
    }
  }
}

translate([0,0, -(sheight-roundness)/2]) intersection()
{
  minkowski()
  {
    cube([fwidth-roundness,fheight-roundness, sheight], center=true);
    sphere(roundness, center=true);
  }
  translate([0,0, -roundness]) cube([fwidth+roundness, fheight+roundness, sheight+roundness], center=true);
}

translate([0,0,-sheight-10])
{
  difference()
  {
    minkowski()
    {
      cube([fwidth-10, fheight-12, 17], center=true);
      sphere(1, center=true);
    }
    minkowski()
    {
      translate([0, 12, 0]) rotate([0, 90, 0]) cylinder(r=10, h=fwidth-10-4, center=true);
      sphere(1, center=true);
    }
    minkowski()
    {
      translate([0, -12, 0]) rotate([0, 90, 0]) cylinder(r=10, h=fwidth-10-4, center=true);
      sphere(1, center=true);
    }
  }
}
