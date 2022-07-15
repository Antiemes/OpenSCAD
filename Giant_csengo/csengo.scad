sf = .50693069306930693069;

linear_extrude(height=6)
{
	scale([sf, sf])
	{
  	translate([0, 200])
  	{
  	  import(file = "csengo.svg", center = false);
  	}
	}
}
