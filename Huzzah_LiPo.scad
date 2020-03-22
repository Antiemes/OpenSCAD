//PCB size: 47x24x1.6 mm
//charger board: 17.5x22
//holes: 13.5, 18
//USB: 8x3
//Battery: 21x32x7

$fn=36;

batt_x=60;
batt_y=66;
batt_z=4;

over_x=1; //Ennyivel lehet oldalrol ralogni a NYAK-ra
over_z=1.7; //Ennyivel lehet alulrol es felulrol ralogni a NYAK-ra
over2=2; // Ennyivel lesz szelesebb a doboz, mint a NYAK
base_x=65; //Doboz szelessege
base_y=100;
encl_thick=2; //Doboz anyaganak vastagsaga

usb_x=20; //USB tolto x offset
huzzah_x=-10; //Huzzah tolto x offset

module battery()
{
	translate([0, batt_y/2, batt_z/2])
		cube([batt_x, batt_y, batt_z], center=true);
}

//Lent, fent: 1.7mm, oldalt: 1mm

module usb()
{
  translate([usb_x-4, base_y-encl_thick-1, encl_thick+1.2]) cube([8, encl_thick+2, 3]);
}

//pcb();
//translate([-base_x/2, 0, 0]) cube([base_x, base_y, encl_thick]);
difference()
{
  translate([-base_x/2, 0, 0]) cube([base_x, base_y, 8]);
  translate([-base_x/2+encl_thick, encl_thick, encl_thick]) cube([base_x-encl_thick*2, base_y-encl_thick*2, 20]);
  usb();
}

module foo()
{
  cylinder(d=1.6, h=2, center=false);
}

module foo2()
{
  cylinder(d=2.54, h=4, center=false);
  cylinder(d=4, h=2, center=false);
}

translate([usb_x, base_y-1.8-encl_thick, encl_thick])
{
  translate([13.5/2, 0, 0]) foo();
  translate([-13.5/2, 0, 0]) foo();
  translate([13.5/2, -18, 0]) foo();
  translate([-13.5/2, -18, 0]) foo();
}

translate([huzzah_x, base_y-4-encl_thick, encl_thick])
{
  translate([33.2/2, 0, 0]) foo2();
  translate([-33.2/2, 0, 0]) foo2();
  translate([33.2/2, -20.5, 0]) foo2();
  translate([-33.2/2, -20.5, 0]) foo2();
	//translate([0, -10.5, 2.5]) cube([38.4, 25.5, 1.6], center=true);
}


//translate([0, 2, 2]) battery();
