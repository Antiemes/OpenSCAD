$fn=100;

thickness=10;
wall_dist=150+thickness;
width=80;
width2=100;
height=30;

screw_dia=4;
screw_dia2=5;
screw_head=8;
screw_offs=width/4*1.3;

screw_dist=76;

back=3;

module screwhole()
{
  cylinder(d=screw_dia, h=thickness+1, center=true);
  translate([0, 0, thickness/2]) mirror([0, 0, 1]) cylinder(d2=0, d1=screw_head, h=screw_head*2/3, center=false);
}

module screwhole2()
{
  cylinder(d=screw_dia2, h=thickness+1, center=true);
  //translate([0, 0, thickness/2]) mirror([0, 0, 1]) cylinder(d2=0, d1=screw_head, h=screw_head*2/3, center=false);
}


//   FALI TARTO
translate([0, -thickness/2], 0) difference()
{
  union()
  {
    cube([width, thickness, height], center=true);
    translate([0, 0, width/2]) cube([height, thickness, width], center=true);
  }
  translate([screw_offs, 0, 0]) rotate([-90, 0, 0]) screwhole();
  translate([-screw_offs, 0, 0]) rotate([-90, 0, 0]) screwhole();
}

//   SZEKRENYHEZ ROGZITHETO
//rotate([0, 0, 45])
//{
//  difference()
//  {
//    union()
//    {
//      translate([70/2+thickness/2, 0, 0]) cube([70, thickness, height], center=true);
//      //translate([50/2+thickness/2, 0, 10]) cube([50, thickness, height], center=true);
//      //cylinder(d=thickness, h=height, center=true);
//    }
//    translate([50+thickness/2, 0, 0]) rotate([90, 0, 0]) screwhole2();
//  }
//  translate([0, 18.8/2+thickness/2, 0]) cube([thickness, 18.8+thickness*2, height], center=true);
//  #translate([back/2+thickness/2, 18.8+thickness, 0]) cube([back, thickness, height], center=true);
//}

//difference()
//{
//  #translate([0, -wall_dist/2, 0]) cube([thickness, wall_dist, height], center=true);
//
//}

translate([0, 0, height/2])
  rotate([-90, 0, 90])
    linear_extrude(height=thickness, center=true)
      polygon(points=[[0, height], [0, 0], [8, 0], [80, height/2], [160, height/2], [160, height]]);

//translate([0, -wall_dist+thickness/2, 0]) difference()
//{
//  cube([width2, thickness, height], center=true);
//  translate([screw_dist/2, 0, 0]) rotate([-90, 0, 0]) screwhole2();
//  translate([-screw_dist/2, 0, 0]) rotate([-90, 0, 0]) screwhole2();
//}

