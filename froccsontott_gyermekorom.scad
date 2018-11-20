$fn=80;

headr=10;
neckr=3;
neckh=2;
bodyh=30;

handr=2;
handh=5;
handdist=25;

module hand()
{
  hull()
  {
    translate([handdist, headr, bodyh/2]) rotate([0, 180, 0]) cylinder(r=handr, h=handh, center=false);
    translate([0, headr-handr, bodyh/2]) rotate([0, 180, 0]) cylinder(r=handr, h=handh, center=false);
  }
}

cylinder(r=headr, h=bodyh, center=true);
translate([0, 0,  bodyh/2]) cylinder(r=neckr, h=neckh+headr, center=true);
translate([0, 0, bodyh/2+headr+neckh]) sphere(r=headr, center=true);
difference()
{
  union()
  {
    hand();
    mirror([0, 1, 0]) hand();
  }
  translate([headr*2, 0, 0]) cylinder(r=headr, h=bodyh+1, center=true);
}

///*translate([-24,0,0]) {
//    union() {
//        cube(15, center=true);
//        sphere(16);
//    }
//}
//
//intersection() {
//    cube(15, center=true);
//    sphere(10);
//}
//
//translate([24,0,0]) {
//    difference() {
//        cube(15, center=true);
//        sphere(10);
//    }
//}*/
//
//dotd=3;
//
//module dot()
//{
//  sphere(1, $fn=30);
//};
//
//
//difference(){
//intersection()
//{
//  cube(15, center=true);
//  sphere(10.5, $fn=200);
//};
//
//
//union(){
//rotate([0, 180, 0])
//{
//  translate([7.5, 0, 0])
//  {
//    translate([0, dotd, dotd])dot();
//    translate([0, -dotd, -dotd])dot();
//  }
//}
//
//rotate([0, 0, 90])
//{
//  translate([7.5, 0, 0])
//  {
//    dot();
//    translate([0, dotd, dotd])dot();
//    translate([0, -dotd, -dotd])dot();
//  }
//}
//
//rotate([0, 0, -90])
//{
//  translate([7.5, 0, 0])
//  {
//    translate([0, dotd, dotd])dot();
//    translate([0, -dotd, -dotd])dot();
//    translate([0, dotd, -dotd])dot();
//    translate([0, -dotd, dotd])dot();
//  }
//}
//
//rotate([0, 0, 0])
//{
//  translate([7.5, 0, 0])
//  {
//    dot();
//    translate([0, dotd, dotd])dot();
//    translate([0, -dotd, -dotd])dot();
//    translate([0, dotd, -dotd])dot();
//    translate([0, -dotd, dotd])dot();
//  }
//}
//
//rotate([0, 90, 0])
//{
//  translate([-7.5, 0, 0])
//  {
//    dot();
//  }
//}
//
//rotate([0, -90, 0])
//{
//  translate([-7.5, 0, 0])
//  {
//    translate([0, dotd, dotd*3/2])dot();
//    translate([0, dotd, 0])dot();
//    translate([0, dotd, -dotd*3/2])dot();
//    translate([0, -dotd, dotd*3/2])dot();
//    translate([0, -dotd, 0])dot();
//    translate([0, -dotd, -dotd*3/2])dot();
//  }
//}
//}
//}
//
//echo(version=version());
//// Written by Marius Kintel <marius@kintel.net>
////
//// To the extent possible under law, the author(s) have dedicated all
//// copyright and related and neighboring rights to this software to the
//// public domain worldwide. This software is distributed without any
//// warranty.
////
//// You should have received a copy of the CC0 Public Domain
//// Dedication along with this software.
//// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
