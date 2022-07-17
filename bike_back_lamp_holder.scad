roundness = 20;
xsize = 100;
ysize = 35;
depth = 40;
$fn = 96;
sw_x = 25;
sw_y = 14;

module body()
{
  linear_extrude(height = depth)
  {
    hull()
    {
      for (yom=[-1, 1])
      {
        for (xom=[-1, 1])
        {
          translate([xom * (xsize - roundness) / 2, yom * (ysize - roundness) / 2])
            circle(d = roundness);
        }
      }
    }
  }
}

module leds()
{
  for (yo=[-9, 9])
  {
    //for (xo=[-30, -10, 10, 30])
    for (xo=[-36:18:36])
    {
      translate([xo, yo, depth-28])
      {
        cylinder(d=5, h=30);
      }
    }
  }
}

module inner()
{
  hull()
  {
    for (zo=[8, depth-8])
    {
      for (xom=[-1, 1])
      {
        translate([xom*(xsize/2-8), 0, zo])
        {
          rotate([90, 0, 0]) translate([0, 0, 3]) cylinder(d=6, h=ysize, center=true);
        }
      }
    }
  }
}

module drillholes()
{
  for (xo=[-36, -25, 25, 36])
  {
    translate([xo, 0, -1])
    {
      cylinder(d=5.5, h=30);
    }
  }
}

module switch()
{
  translate([xsize / 2 - sw_y / 2 - 8, ysize / 2, depth / 2])
  {
    cube([sw_y, 10, sw_x], center=true);
  }
}

module battery()
{
  translate([-8, 0, depth / 2]) rotate([0, 90, 0]) cylinder(d=18, h=65, center=true);
}

difference()
{
  body();
  leds();
  inner();
  drillholes();
  switch();
}

#battery();
