difference()
{
  union()
  {
    cylinder(d=25, h=32);
    cylinder(d=35, h=14);
    cylinder(d=38, h=3);
  }
  rotate_extrude(angle=360)
    polygon(points=[
      [0, 0],
      [0, 32],
      [11/2, 32],
      [11/2, 32-10.5],
      [18.5/2, 18],
      [18.5/2, 9+2],
      [21.5/2, 9],
      [21.5/2, 2],
      [21.5/2+2, 0]
      ]);
}
