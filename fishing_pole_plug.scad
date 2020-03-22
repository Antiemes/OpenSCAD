$fn=72;

id=28.5+0.1;
od=30.4+4;
height=25;
cut=15;

soft=6;

thread_depth=2.5;

grip_soft=3;

id2=id-thread_depth;

module shaper(dadd)
{
	union()
	{
		translate([0, 0, height-soft])
			cylinder(d2=id2*0.95+dadd, d1=id2+dadd, h=soft);
		cylinder(d=od+dadd, h=height-soft);
	}
}

minkowski()
{
	cylinder(d=od-grip_soft, h=(height-cut)/2, $fn=6);
	cylinder(d=grip_soft, h=(height-cut)/2);
}
intersection()
{
	cylinder(d=id2, h=height);
	shaper(0);
}

intersection()
{
	for(angle=[0:30:359])
	{
		rotate([0, 0, angle])
		{
			translate([0, 0, height-cut/2])
				linear_extrude(height=cut, center=true, twist=-45)
					translate([id2/2-thread_depth+0.5, 0, 0])
						circle(r=thread_depth, center=true);
		}
	}
	shaper(thread_depth-1.5);
}
