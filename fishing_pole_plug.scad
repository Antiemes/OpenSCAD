$fn=720;

id=28.5;
od=30.4+4;
height=25;
cut=15;

soft=10;

thread_depth=2.5;
thread_length=5;

intersection()
{
	difference()
	{
		union()
		{
			cylinder(d=od, h=(height-cut));
			intersection()
			{
				cylinder(d=id, h=height);
				union()
				{
					translate([0, 0, height-soft])
						cylinder(d2=id*0.95, d1=id, h=soft);
					cylinder(d=od, h=height-soft);
				}
			}
		}
	
		union()
		{
			for(angle=[0:60:359])
				rotate([0, 0, angle])
				{
					translate([0, 0, height-cut/2])
						linear_extrude(height=cut, center=true, twist=-45)
							translate([id/2-thread_depth/2+0.5, 0, 0])
								square([thread_depth, thread_length], center=true);
				}
		}
	}

}
