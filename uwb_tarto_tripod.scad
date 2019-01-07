$fn=100;

wall_dist=150;
thickness=10;
width=80;
width2=100;
height=30;

screw_dia=4;
screw_dia2=5;
screw_head=8;
screw_offs=width/4*1.3;

screw_dist=76;

back=25;

base_width=43.25;
base_height=9.1;

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

pcb_thickness=1.6;
pcb_length=50;
pcb_height=50;
cover_thickness=5;
module pcb()
{
#translate([0, 0, -base_height/2+pcb_height/2+cover_thickness/2-pcb_thickness])
  cube([pcb_length, pcb_thickness, pcb_height], center=true);
}

//Tripod mount
translate([0, -20-base_width/2, 0])
{
  union()
  {
  base_inset=4.1;
  base_cutout = 0.8;
  
  translate([-base_width/2, 20, -height/2])
  {
    union()
    {
      intersection()
      {
      	polyhedron(points=[[-base_cutout,-base_cutout,0],
                         [base_inset,base_inset,base_height],
                         [-base_cutout,base_width+base_cutout,0],
                         [base_inset,base_width-base_inset,base_height],
                         [base_width+base_cutout,base_width+base_cutout,0],
                         [base_width-base_inset,base_width-base_inset,base_height],
                         [base_width+base_cutout,-base_cutout,0],
                         [base_width-base_inset,base_inset,base_height]],
                 triangles=[[2,1,0],[1,2,3],[4,3,2],[3,4,5],[6,5,4],[5,6,7],[0,7,6],[7,0,1],
      				     [4,2,0],[0,6,4],[1,3,5],[5,7,1]]
                 );	
    	  cube([base_width,base_width,50]);
      }
    }
  }
  
    
  translate([-(base_width-base_inset*2)/2, 20+base_inset, -height/2])
    cube([base_width-base_inset*2, base_width-base_inset*2, height]);
  }
}

//PCB part
cover_height=10;

%translate([0, 0, cover_height/2+base_height/2])
  difference()
  {
    union()
    {
      cube([pcb_length, cover_thickness, cover_height], center=true);
      translate([pcb_length/2, 0, 0]) cube([cover_height, cover_height, cover_thickness], center=true);
    }
    pcb();
  }
