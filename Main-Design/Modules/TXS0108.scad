/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

TXS0108BoardX=27;
TXS0108BoardY=17;
TXS0108BoardZ=3;
TXS0108DrillHoleX=3.4;
TXS0108DrillHoleY=8.5;

module TXS01082D()
{
    color("blue")
        difference() {
            square([TXS0108BoardX, TXS0108BoardY]);

            translate([TXS0108DrillHoleX, TXS0108DrillHoleY, 0])
                circle(d=3, $fn=360);

            translate([TXS0108BoardX - TXS0108DrillHoleX, TXS0108DrillHoleY, 0])
                circle(d=3, $fn=360);
        }
}

module TXS01083D()
{
    color("blue")
        difference() {
            cube([TXS0108BoardX, TXS0108BoardY, TXS0108BoardZ]);

            translate([TXS0108DrillHoleX, TXS0108DrillHoleY, -0.01])
                cylinder(h=TXS0108BoardZ + 0.02, d=3, $fn=360);

            translate([TXS0108BoardX - TXS0108DrillHoleX, TXS0108DrillHoleY, -0.01])
                cylinder(h=TXS0108BoardZ + 0.02, d=3, $fn=360);
        }
}


module TXS0108M2MountPoints3D(height=5)
{
    translate([TXS0108DrillHoleX, TXS0108DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=5, $fn=360);
            cylinder(h=height + 0.01, d=1.6, $fn=360);
        }

    translate([TXS0108BoardX - TXS0108DrillHoleX, TXS0108DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=5, $fn=360);
            cylinder(h=height + 0.01, d=1.6, $fn=360);
        }
}

module TXS0108M3MountPoints3D(height=5)
{
    translate([TXS0108DrillHoleX, TXS0108DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            cylinder(h=height + 0.01, d=2.5, $fn=360);
        }

    translate([TXS0108BoardX - TXS0108DrillHoleX, TXS0108DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            cylinder(h=height + 0.01, d=2.5, $fn=360);
        }
}

/*
TXS0108M2MountPoints3D(10);
/*
translate([0,0,10])
    TXS01083D();
*/