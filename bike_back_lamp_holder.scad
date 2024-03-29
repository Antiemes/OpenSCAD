roundness = 20;
xsize = 100;
ysize = 35;
depth = 40;
$fn = 96;
sw_x = 19.8;
sw_y = 13;

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

module inner(offs)
{
  hull()
  {
    for (zo=[8-offs, depth-8+offs])
    {
      for (xom=[-1, 1])
      {
        translate([xom*(xsize/2-8+offs), 0, zo])
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
  translate([-8, 8, depth / 2 - 3]) rotate([0, 90, 0]) cylinder(d=18, h=65+5, center=true);
}

module zip()
{
  for (zo=[-7.5, 7.5])
  {
    for (xo=[-25, 25])
    {
      translate([xo - 8, ysize / 2, depth / 2 - 3 + zo]) cube([4, 10, 1.5], center=true);
    }
  }
}

module notch(offs)
{
  for (zo = [5, depth - 5])
  {
    for (xo = [-30, 0, 30])
    {
      translate([xo, -ysize/2 + 2.5, zo]) rotate([0, 90, 0]) cylinder(d=2+offs, h=5, center=true);
    }
  }
}

module cutout()
{
  for (xo = [-15, 15])
  {
    translate([xo, -ysize/2 + 2.5, 5]) rotate([90, 0, 0]) cylinder(d=8, h=10, center=true);
  }

}

module lamp()
{
  difference()
  {
    body();
    leds();
    inner(0);
    drillholes();
    switch();
    battery();
    zip();
  }
  
  notch(0);
}


module cover()
{
  difference()
  {
    intersection()
    {
      inner(-0.2);
      body();
      translate([-xsize/2, -ysize/2, 0]) cube([xsize, 5, depth]);
    }
    notch(0.2);
    cutout();
  }
}

//lamp();
cover();
