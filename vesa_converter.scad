$fn=36;
//122 mm
module vesa1()
{
	difference()
	{
		linear_extrude(height=7)
		{
			vesa_soft=5;
			minkowski()
			{
				square([120-vesa_soft*2, 120-vesa_soft*2], center=true);
				circle(r=vesa_soft);
			}
		}
		for(r=[0:90:359])
		{
			rotate([0, 0, r]) translate([50, 50, 0]) cylinder(d=5, h=10);
		}
	}
}

module vesa2()
{
	difference()
	{
		translate([0, 0, -(5+9)]) linear_extrude(height=5+9)
		{
			vesa_soft=5;
			minkowski()
			{
				square([230-vesa_soft*2, 150-vesa_soft*2], center=true);
				circle(r=vesa_soft);
			}
		}
		translate([ 100, 65, 0]) cylinder(d=5, h=40, center=true);
		translate([ 100,  0, 0]) cylinder(d=5, h=40, center=true);
		translate([-100,  0, 0]) cylinder(d=5, h=40, center=true);
		translate([-100, 65, 0]) cylinder(d=5, h=40, center=true);
		
	}
}

module vesa()
{
	difference()
	{
		linear_extrude(height=12)
		{
			vesa_soft=8;
			minkowski()
			{
				square([120-vesa_soft*2, 120-vesa_soft*2], center=true);
				circle(r=vesa_soft);
			}
		}
		for(r=[0:90:359])
		{
			rotate([0, 0, r]) translate([50, 50, 0]) cylinder(d=4.5, h=15);
		}
		
		for(r2=[0:90:359])
		{
			rotate([0, 0, r2])
			{
				translate([78, 78, 0])
				{
					hull()
					{
						for(r=[0:90:359])
						{
							rotate([0, 0, r])	translate([30, 30, 0]) cylinder(d=15, h=3, center=false);
						}
					}
				}
			}
		}
	}
}

//translate([0, 15+122, 0]) vesa1();
//vesa2();

vesa();

//translate([65, 0, 0]) cube([3, 83, 3], center=true);
