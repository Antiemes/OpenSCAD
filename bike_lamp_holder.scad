//25-26, 31-32

module upper()
{
	rotate([0, -90, 0])
	{
		difference()
		{
			intersection()
			{
				difference()
				{
					minkowski()
					{
						union()
						{
							cylinder(d=34, h=15, center=true, $fn=96);
							cube([8, 50, 15], center=true);
						}
						sphere(r=2, $fn=8);
					}
					cylinder(d=26.5, h=25, center=true, $fn=96);
				}
				translate([0, -35, -25]) cube([30, 70, 50]);
			}
			for (x=[-22, 22]) for (y=[-4, 4])
			{
				translate([-1, x, y]) rotate([0, 90, 0]) cylinder(d=3.2, h=10, $fn=32);
			}
		}
	}
}

module lower()
{
	rotate([0, -90, 0])
	{
		difference()
		{
			intersection()
			{
				difference()
				{
					minkowski()
					{
						union()
						{
							cylinder(d=34, h=15, center=true, $fn=96);
							cube([50, 50, 15], center=true);
						}
						sphere(r=2, $fn=8);
					}
					cylinder(d=26.5, h=25, center=true, $fn=96);
				}
				mirror([1, 0, 0]) translate([0, -35, -25]) cube([30, 70, 50]);
			}
			for (x=[-22, 22]) for (y=[-4, 4])
			{
				translate([1, x, y]) rotate([0, -90, 0]) cylinder(d=3.2, h=20, $fn=32);
				translate([-10, x, y]) rotate([0, -90, 0]) cylinder(d=6.5, h=20, $fn=32);
			}
			//translate([-28, -35, -15]) cube([10, 70, 30]);
			translate([-29, 0, 0]) rotate([90, 0, 0]) scale([1, 1, 25/26]) cylinder(d=26, h=70, center=true);
			for (x=[-15, 15]) translate([-13, x, 0]) cube([2, 4, 30], center=true);
		}
	}
}

//upper();
lower();

//translate([0, 0, -32]) rotate([90, 0, 0]) scale([1, 1, 32/31]) cylinder(d=31, h=70, center=true);
