use <ttf/D-DIN-Bold.ttf>

color("black")
linear_extrude(height=3, center=false)
{
	text("Vakulya Gergely", font = "D\\-DIN:style=DIN\\-Bold", halign="center", valign="center", size=48);
}

color("gray")
mirror([0, 0, 1]) linear_extrude(height=3, center=false)
{
	minkowski()
	{
		circle(r=10);
		square([470, 110], center=true);
	}
}
//cube([500, 100, 2], center=true);
