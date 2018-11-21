$fn=80;

headr=10;
neckr=3;
neckh=2;
bodyh=30;

handr=2;
handh=6; //height of hand and legs
handdist=24;
handin=1;
handout=2;

legsp=3; //difference between two circles of leg
legover=3; //leg longer than a half circle with this amount

module hand()
{
  hull()
  {
    translate([handdist, headr+handout, bodyh/2]) rotate([0, 180, 0]) cylinder(r=handr, h=handh, center=false);
    translate([0, headr-handr-handin, bodyh/2]) rotate([0, 180, 0]) cylinder(r=handr, h=handh, center=false);
  }
}

module legs()
{
  footlength=8;
  footheight=6;
  difference()
  {
    union()
    {
      hull()
      {
        cylinder(r=headr+legsp/2, h=handh, center=true);
        translate([0, headr, 0]) cylinder(r=headr, h=handh, center=true);
      }
      //feet:
      translate([0, -legover, -handh/2]) rotate([0, -90, 0]) linear_extrude(height=headr*2+legsp, center=true) polygon(points=[[0, 0], [footlength, 0], [handh, legover], [0, legover]]);
    }
    //cylinder(r=headr-legsp/2, h=headr*2, center=true);
    sphere(r=headr-legsp/2, center=true);
    translate([0, -legover, 0]) rotate([0, 90, 0]) cylinder(r=legover*2, h=headr*2-6, center=true);
    translate([0, -headr-legsp/2-0.5-legover, 0]) cube([headr*2+legsp+1, headr*2+legsp+1, handh+1], center=true);
  }
}

cylinder(r=headr, h=bodyh, center=true); //body
translate([0, 0,  bodyh/2]) cylinder(r=neckr, h=neckh+headr, center=true); //neck
translate([0, 0, bodyh/2+headr+neckh]) sphere(r=headr, center=true); //head

difference() //hands
{
  union()
  {
    hand();
    mirror([0, 1, 0]) hand();
  }
  translate([headr*2, 0, 0]) cylinder(r=headr, h=bodyh+1, center=true);
}

translate([0, 0, -(bodyh/2+headr)]) rotate([0, 90, 0]) rotate([0, 0, 90]) legs();


