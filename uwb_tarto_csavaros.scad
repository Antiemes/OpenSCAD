$fn=100;

wall_dist=150;
thickness=10;
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

//Tripod mount
//difference()
//{
//translate([0, -20-base_width/2, 0])
//  {
//    union()
//    {
//      base_cutout = 0.8;
//      
//      translate([-base_width/2, 20, -height/2])
//      {
//        union()
//        {
//          intersection()
//          {
//          	polyhedron(points=[[-base_cutout,-base_cutout,0],
//                             [base_inset,base_inset,base_height],
//                             [-base_cutout,base_width+base_cutout,0],
//                             [base_inset,base_width-base_inset,base_height],
//                             [base_width+base_cutout,base_width+base_cutout,0],
//                             [base_width-base_inset,base_width-base_inset,base_height],
//                             [base_width+base_cutout,-base_cutout,0],
//                             [base_width-base_inset,base_inset,base_height]],
//                     triangles=[[2,1,0],[1,2,3],[4,3,2],[3,4,5],[6,5,4],[5,6,7],[0,7,6],[7,0,1],
//          				     [4,2,0],[0,6,4],[1,3,5],[5,7,1]]
//                     );	
//        	  cube([base_width,base_width,50]);
//          }
//        }
//      }
//      
//        
//      translate([-(base_width-base_inset*2)/2, 20+base_inset, -height/2])
//        cube([base_width-base_inset*2, base_width-base_inset*2, height]);
//    }
//    
//  }
//  translate([0, 0, cover_height/2+base_height/2+cutout_height]) pcb();
//}

module support()
{
  support_height=9.5;
  rotate([90, 0, 0]) linear_extrude(height=cover_thickness, center=true) polygon(points=[[0, 0], [0, -support_height], [(pcb_length+cover_thickness-base_width+base_inset*2)/2, 0]]);
}

//PCB part
translate([0, 0, cover_height/2+base_height/2+cutout_height])
{
  difference()
  {
    cube([pcb_length+cover_thickness, cover_thickness, cover_height], center=true);
    translate([0, 0, (cover_height-cutout_height)/2]) cube([cutout_width, cover_thickness+1, cutout_height], center=true);
    pcb();
  }
  translate([base_width/2-base_inset, 0, -5]) support();
  mirror([1, 0, 0]) translate([base_width/2-base_inset, 0, -5]) support();
}
