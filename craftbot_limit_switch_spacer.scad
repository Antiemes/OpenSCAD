front=10;
back=4;
center=1.55;
difference()
{
	cube([10, front+center+back, 34], center=true);
	translate([0, (front-back)/2, -4])
		cube([12, center, 34], center=true);
	translate([0, 0, -12])
		rotate([90, 0, 0])
			cylinder(d=3.5, h=1+front+back+center, center=true, $fn=96);
}

#translate([0, (front-back)/2, 2.5]) cube([10, center, 20], center=true);
