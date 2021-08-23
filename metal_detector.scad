// d=17.4 mm

$fn=96;

difference()
{
	cylinder(d=60, h=14, center=true);
	difference()
	{
		cylinder(d=62, h=10, center=true);
		cylinder(d=55, h=10, center=true);
	}
	cylinder(d=50, h=16, center=true);
	translate([0, 0, 4.5]) rotate([90, 0, 5+180]) cylinder(d=1, h=40);
	translate([-2.5, 29, -10]) cylinder(d=1, h=10);
}


difference()
{
	union()
	{
		cube([52, 3, 14], center=true);
		cube([3, 52, 14], center=true);
		rotate([30, 0, 0]) cylinder(d=17.5+6, h=50, center=true);
	}
	rotate([30, 0, 0]) cylinder(d=17.5, h=102, center=true);
	translate([-100, -100, 7]) cube([200, 200, 80]);
	rotate([30, 0, 0]) rotate([0, 0, 110]) rotate([0, 90, 0]) translate([15, 0, 0]) cylinder(d=3, h=20);
}
