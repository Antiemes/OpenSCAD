$fn=100;

wall_dist=150;
thickness=5;
width=80;
width2=100;
height=20;

screw_dia=4;
screw_dia2=5;
screw_head=8;
screw_offs=width/4*1.3;

screw_dist=76;

back=25;

base_width=43.4;
base_height=9.1;

back=3;

module screwhole()
{
  cylinder(d=screw_dia, h=thickness+1, center=true);
  translate([0, 0, thickness/2]) mirror([0, 0, 1]) cylinder(d2=0, d1=screw_head, h=screw_head*2/3, center=false);
}

module screwhole2()
{
  cylinder(d=screw_dia2, h=thickness+1, center=true);
}

module screwhole()
{
  cylinder(d=screw_dia, h=thickness+1, center=true);
  translate([0, 0, thickness/2]) mirror([0, 0, 1]) cylinder(d2=0, d1=screw_head, h=screw_head*2/3, center=false);
}

module screwhole2()
{
  cylinder(d=screw_dia2, h=thickness+1, center=true);
}

pcb_thickness=1.5;
pcb_length=51.25;
pcb_height=50;
cover_thickness=5;
cover_height=10;
cutout_height=5;
cutout_width=44;
base_inset=4.1;

module pcb()
{
translate([0, 0, -base_height/2+pcb_height/2+cover_thickness/2-pcb_thickness])
  cube([pcb_length, pcb_thickness, pcb_height], center=true);
}

//PCB part
translate([0, cover_thickness/2, cover_height/2+base_height/2+cutout_height-height])
{
  difference()
  {
    cube([pcb_length+cover_thickness, cover_thickness, cover_height], center=true);
    translate([0, 0, (cover_height-cutout_height)/2]) cube([cutout_width, cover_thickness+1, cutout_height], center=true);
    pcb();
  }
}

//Screw mount part
translate([0, -thickness/2, 0]) difference()
{
  cube([width2, thickness, height], center=true);
  translate([screw_dist/2, 0, 0]) rotate([-90, 0, 0]) screwhole2();
  translate([-screw_dist/2, 0, 0]) rotate([-90, 0, 0]) screwhole2();
}

