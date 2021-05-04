/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

MWLRS50BoxX=99;
MWLRS50BoxY=82;
MWLRS50BoxZ=30;

MWLRS50ConnectionsXOffset=-0.01;
MWLRS50ConnectionsYOffset=3;
MWLRS50ConnectionsZOffset=7;
MWLRS50ConnectionsXSize=12 + 0.01;
MWLRS50ConnectionsYSize=(MWLRS50BoxY - MWLRS50ConnectionsYOffset) + 0.01;
MWLRS50ConnectionsZSize=(MWLRS50BoxZ - MWLRS50ConnectionsZOffset) + 0.01;

MWLRS50DrillHole1X=4.5 + 92.5;
MWLRS50DrillHole1Y=6.5;
MWLRS50DrillHole1Diameter=3.5;
MWLRS50DrillHole2X=4.5;
MWLRS50DrillHole2Y=6.5 + 70;
MWLRS50DrillHole2Diameter=3.5;

module MWLRS50_2D()
{
    difference() {
        square([MWLRS50BoxX, MWLRS50BoxY]);

        translate([MWLRS50DrillHole1X, MWLRS50DrillHole1Y, 0])
            circle(d=MWLRS50DrillHole1Diameter, $fn=360);

        translate([MWLRS50DrillHole2X, MWLRS50DrillHole2Y, 0])
            circle(d=MWLRS50DrillHole2Diameter, $fn=360);
    }
}

module MWLRS50_3D()
{
    difference() {
        cube([MWLRS50BoxX, MWLRS50BoxY, MWLRS50BoxZ]);
        
        translate([MWLRS50ConnectionsXOffset, MWLRS50ConnectionsYOffset, MWLRS50ConnectionsZOffset])
            cube([MWLRS50ConnectionsXSize, MWLRS50ConnectionsYSize, MWLRS50ConnectionsZSize]);

        translate([MWLRS50DrillHole1X, MWLRS50DrillHole1Y, -0.01])
            cylinder(h=MWLRS50BoxZ + 0.02, d=MWLRS50DrillHole1Diameter, $fn=360);

        translate([MWLRS50DrillHole2X, MWLRS50DrillHole2Y, -0.01])
            cylinder(h=MWLRS50BoxY + 0.02, d=MWLRS50DrillHole2Diameter, $fn=360);
    }
}

module MWLRS50M3MountPoints3D(height=5)
{
    translate([MWLRS50DrillHole1X, MWLRS50DrillHole1Y, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            translate([0,0,-0.01])
                cylinder(h=height + 0.02, d=2.5, $fn=360);
        }

    translate([MWLRS50DrillHole2X, MWLRS50DrillHole2Y, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            translate([0,0,-0.01])
                cylinder(h=height + 0.02, d=2.5, $fn=360);
        }

    translate([MWLRS50DrillHole1X, MWLRS50DrillHole2Y, 0])
        cylinder(h=height, d=6, $fn=360);

    translate([MWLRS50DrillHole2X, MWLRS50DrillHole1Y, 0])
        cylinder(h=height, d=6, $fn=360);
}

/*
MWLRS50M3MountPoints3D(5);
translate([0,0,5])
    MWLRS50_3D();
*/