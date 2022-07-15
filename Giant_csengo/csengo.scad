linear_extrude(height=4)
{

  translate([0, 200])
  {
    import(file = "csengo.svg", center = false, dpi = 300);
  }
}
